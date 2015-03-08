local boundary = require('boundary')
local httpchecker = require('httpchecker')

-- Default params
local items = {}

-- Fetching params
if (boundary.param ~= nil) then
  items = boundary.param.items or items
end

print("_bevent:Boundary LUA HttpCheck plugin up : version 1.0|t:info|tags:lua,plugin")

local httpcheck = httpchecker:new()

local function poll()
	item = items[1]
	p(item)
	httpcheck:request(item['url'])
end
poll()