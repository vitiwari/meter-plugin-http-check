local framework = require('framework.lua')
local Plugin = framework.Plugin
local DataSourcePoller = framework.DataSourcePoller
local WebRequestDataSource = framework.WebRequestDataSource
local PollerCollection = framework.PollerCollection
local url = require('url')
local notEmpty = framework.string.notEmpty
local isHttpSuccess = framework.util.isHttpSuccess
local auth = framework.util.auth

local params = framework.params

local function createPollers(params) 
  local pollers = PollerCollection:new() 

  for _,item in pairs(params.items) do
    local options = url.parse(item.url)
    options.protocol = options.protocol or item.protocol or 'http'
    options.auth = options.auth or auth(item.username, item.password)
    options.method = item.method
    options.meta = { source = item.source, ignoreStatusCode = item.ignoreStatusCode, debugEnabled = item.debugEnabled }
    options.data = item.postdata
    options.wait_for_end = false

    local data_source = WebRequestDataSource:new(options)

    local time_interval = tonumber(notEmpty(item.pollSeconds, notEmpty(item.pollInterval, notEmpty(params.pollInterval, 1000))))
    if time_interval < 500 then time_interval = time_interval * 1000 end
    local poller = DataSourcePoller:new(time_interval, data_source)
    
    pollers:add(poller)
  end

  return pollers
end

local pollers = createPollers(params)

local function logFailure(str)
  process.stderr:write(str)  
end

local plugin = Plugin:new(params, pollers)
function plugin:onParseValues(body, extra)
  local result = {}
  local value = tonumber(extra.response_time) 
  if not extra.info.ignoreStatusCode and not isHttpSuccess(extra.status_code) then
    self:emitEvent('error', ('%s Returned %d'):format(extra.info.source, extra.status_code), self.source, self.source, ('HTTP Request Returned %d instead of OK'):format(extra.status_code))
    if (extra.info.debugEnabled) then
      logFailure(extra.info.source .. ' status code: ' .. extra.status_code .. '\n')
      logFailure(extra.info.source .. ' body:\n' .. tostring(body) .. '\n')
    end
  else
    result['HTTP_RESPONSETIME'] = {value = value, source = extra.info.source} 
  end

  return result
end
plugin:run()
