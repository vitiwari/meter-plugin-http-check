local boundary = require('boundary')
local httpchecker = require('httpchecker')
local timer = require('timer')
local string = require('string')

-- Default params
local items = {}
local pollInterval = 20000

-- Fetching params
if (boundary.param ~= nil) then
  items = boundary.param.items or items
  pollInterval = boundary.param.pollInterval or pollInterval
end

print("_bevent:Boundary LUA HttpCheck plugin up : version 1.0|t:info|tags:lua,plugin")

local httpcheck = httpchecker:new()

local function poll()
	--local host = httpcheck:run_test_server()
	--httpcheck:request("POST", "http", host, "", "", {"key=1"}, function(response)
		--p(response)
	--end)
	for index, item in ipairs(items) do
		timer.setTimeout(tonumber(item.pollInterval), function ()
			httpcheck:request(item['method'], item['protocol'], item['url'], item['username'], item['password'], item['postdata'], function(response)
				p(string.format("HTTP_RESPONSETIME %s %s", response['exec_time'], item.source))
			end)
		end)
	end
end

timer.setInterval(pollInterval, function ()
	poll()
end)
