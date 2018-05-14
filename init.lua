-- Copyright 2015 BMC Software, Inc.
--
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
--    http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.

local framework = require('framework.lua')
local Plugin = framework.Plugin
local DataSourcePoller = framework.DataSourcePoller
local WebRequestDataSource = framework.WebRequestDataSource
local PollerCollection = framework.PollerCollection
local url = require('url')
local notEmpty = framework.string.notEmpty
local isHttpSuccess = framework.util.isHttpSuccess
local auth = framework.util.auth
local trim = framework.string.trim

local json = require('json')
local env = require('env')

local params = env.get("TSP_PLUGIN_PARAMS")
if(params == nil or  params == '') then
   params = framework.params
else
   params = json.parse(params)
end

local SITE_IS_DOWN = -1

local function createPollers(params) 
  local pollers = PollerCollection:new() 

  for _,item in pairs(params.items) do
    -- prefix with selected protocol
    item.url = trim(item.url)
    local chunk, protocol = item.url:match("^(([a-z0-9+]+)://)")
    item.url = item.url:sub((chunk and #chunk or 0) + 1) 
    local protocol = item.protocol or 'http'
    item.url = protocol .. '://' .. item.url 

    local options = url.parse(item.url)
    options.auth = options.auth or auth(item.username, item.password)
    options.method = item.method
    options.meta = { source = item.source, ignoreStatusCode = item.ignoreStatusCode }
    options.data = item.postdata
    options.debug_level = item.debug_level
    options.wait_for_end = false
    options.follow_redirects = item.follow_redirects
    options.max_redirects = item.max_redirects

    local data_source = WebRequestDataSource:new(options)

    local time_interval = tonumber(notEmpty(item.pollSeconds, notEmpty(item.pollInterval, notEmpty(params.pollInterval, 1000))))
    if time_interval < 500 then time_interval = time_interval * 1000 end
    local poller = DataSourcePoller:new(time_interval, data_source)
    
    pollers:add(poller)
  end

  return pollers
end

local pollers = createPollers(params)

local plugin = Plugin:new(params, pollers)
function plugin:onError(err)
  if err.context then
    err.source = err.context.info.source
    err.message = err.message and err.message .. ' for ' .. err.context.options.href   
  end
  result = {}
  if "Max redirects reached!" == err then
     --checking condition for Max redirects reached 
  else
     result['HTTP_RESPONSETIME'] = {value = -1, source = err.context.info.source}
  end
  self:report(result)
  return err  
end

function plugin:onParseValues(body, extra)
  local result = {}
  local value = tonumber(extra.response_time) 
  if not extra.info.ignoreStatusCode and not isHttpSuccess(extra.status_code) then
    self:emitEvent('error', ('%s Returned %d'):format(extra.info.source, extra.status_code), self.source, extra.info.source, ('HTTP request returned %d for URL %s'):format(extra.status_code, extra.context.options.href))
    result['HTTP_RESPONSETIME'] = {value = SITE_IS_DOWN, source = extra.info.source}
  elseif extra.max_redirects_reached then
    result['HTTP_RESPONSETIME'] = {value = SITE_IS_DOWN, source = extra.info.source}
  elseif extra.status_code == 500 then
    result['HTTP_RESPONSETIME'] = {value = SITE_IS_DOWN, source = extra.info.source}
  else
    result['HTTP_RESPONSETIME'] = {value = value, source = extra.info.source} 
  end

  return result
end
plugin:run()

