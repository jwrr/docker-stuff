#!/usr/local/bin/luvit
local http = require 'http'
local https = require 'https'
local url = require 'url'
local lfs = require 'lfs'

--package.path=package.path..';/var/local/luvit/?.lua'
--local markdown = require('markdown');

package.path  = "/var/local/luarocks-3.8.0/lua_modules/share/lua/5.1/?.lua;" .. package.path
package.cpath = "/var/local/luarocks-3.8.0/lua_modules/lib/lua/5.1/?.so;" .. package.cpath

 local lcmark = require("lcmark")

local items = {};


function slurp(file)
    local f = assert(io.open(file, "rb"))
    local content = f:read("*all")
    f:close()
    return content
end


function fileExists(name)
   local f=io.open(name, "r")
   if f~=nil then io.close(f) return true else return false end
end


function err404(res)
  res.statusCode = 404;
end


function processUrl(rootDir, reqUrl)
  local urlFileName = reqUrl:gsub('%?.*', '')
  if urlFileName:sub(-1) == '/' then
    urlFileName = urlFileName .. 'index.html'
  end
  local baseName = urlFileName:gsub('.*%/', '')
  if not baseName:find('.') then
    baseName = 'index.html'
    urlFileName = urlfileName .. '/' .. baseName
  end
  local charToDelete = -(#baseName + 2)
  local pathName = urlFileName:sub(2, charToDelete)
  local fileType = string.lower(baseName:gsub('.*%.', ''))

  local fullPathName = rootDir .. urlFileName;
  local fileFound = fileExists(fullPathName)

  local ContentTypes = {
    css = 'text/css',
    gif = 'image/gif',
    html = 'text/html', htm = 'text/html',
    jpg = 'image/jpeg',
    md = 'text/html',
    png = 'image/x-png',
    svg = 'image/svg+xml',
    txt = 'text/plain'
  }

  local contentType = ContentTypes[fileType] or 'unknown'

  local processedOutput = {fileType = fileType, pathName = pathName, urlFileName = urlFileName, baseName = baseName,
  fullPathName = fullPathName, fileFound = fileFound, contentType = contentType }
  return processedOutput
end


http.createServer(function (req, res)
  local currDir = lfs.currentdir()
  local rootDir = currDir .. '/content'
  local rootDir = '/var/local/luvit/content'
  local urlData = processUrl(rootDir, req.url)
  local body = ''
  if urlData.fileFound then
    body = slurp(urlData.fullPathName)
    if urlData.fileType == 'md' then
      local middle, metadata = lcmark.convert(body,"html", {smart = true})
      local top = [[
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>index.html - Home Page</title>
  <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>

]]

      local bot = [[
</body>
</html>
      ]]

      body = top .. middle .. bot
    end
  else
    err404(res)
    body = "Not found"
  end

  if urlData.contentType ~= 'unknown' then
    res:setHeader('Content-Type', urlData.contentType)
  end
  res:setHeader('Content-Length', #body)
  res:finish(body)

end):listen(1337, '0.0.0.0')

print('Server running at http://0.0.0.0:1337/')

