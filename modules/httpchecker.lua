--------------------------------------------------------------------------
-- Module to Check URL for Boundary Lua HttpCheck Plugin
--
-- Author: Yegor Dia
-- Email: yegordia at gmail.com
--
--------------------------------------------------------------------------

local object = require('core').Object
local http = require('http')
local https = require('https')
local string = require('string')

local HttpCheck = object:extend()

--[[ Initialize HttpCheck with  parameters
]]
function HttpCheck:initialize()
	return self
end


--[[ 
]]
function HttpCheck:request(url)
	p('requested')
	p(url)
	
	local req = http.request({
	  host = url,
	  port = 80,
	  path = "/",
	  method = "GET"
	}, function (res)
	  res:on("error", function(err)
		msg = tostring(err)
		print("Error while receiving a response: " .. msg)
	  end)

	  res:on("data", function (chunk)
		p("ondata", {chunk=chunk})
	  end)

	  res:on("end", function ()
		res:destroy()
	  end)
	end)

	req:on("error", function(err)
	  msg = tostring(err)
	  print("Error while sending a request: " .. msg)
	end)

	req:done()
end


return HttpCheck