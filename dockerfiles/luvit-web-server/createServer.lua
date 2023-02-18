#!/usr/local/bin/luvit

-- createServer.lua

local http = require'http'
local https = require'https'
local url = require'url'
package.path=package.path..';/var/www/html/?.lua'
local srv = require'srv'

http.createServer(function (req, res)
  -- srv.addContentType('svg', 'image/svg+xml')
  local contentDir = '/var/www/html/content'
  body = srv.getBody(req, res, contentDir)
  res:finish(body)
end):listen(1337, '0.0.0.0')

print('Server running at http://0.0.0.0:1337/')

