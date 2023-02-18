-- srv.lua

local utils = require'utils'
local err = require'err'

local srv = {}

-------------------------------------------------------------------------
-- contentTypes

local contentTypes = {
  css = 'text/css',
  gif = 'image/gif',
--   html = 'text/html',
--   htm = 'text/html',
  jpg = 'image/jpeg',
  png = 'image/x-png',
  svg = 'image/svg+xml',
  txt = 'text/plain'
}

function srv.getContentType(fileType)
  return contentTypes[fileType] or 'unknown'
end

-- Add custom http content-type
function srv.addContentType(fileType, contentType)
  contentTypes[fileType] = contentType
end

-------------------------------------------------------------------------


function srv.getUrlFields(rootDir, reqUrl)
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
  local fileType = baseName:gsub('.*%.', '')

  local fullPathName = rootDir .. urlFileName;
  local fileFound = utils.fileExists(fullPathName)

  local contentType = srv.getContentType(fileType)

  local processedOutput = {fileType = fileType, pathName = pathName, urlFileName = urlFileName, baseName = baseName,
  fullPathName = fullPathName, fileFound = fileFound, contentType = contentType }
  return processedOutput
end


function srv.getBody(req, res, contentDir)
  local urlFields = srv.getUrlFields(contentDir, req.url)
  local body = ''
  if urlFields.fileFound then
    body = utils.slurp(urlFields.fullPathName)
  else
    body = err.handler(req, res, 404, contentDir)
  end

  if urlFields.contentType ~= 'unknown' then
    res:setHeader('Content-Type', urlFields.contentType)
  end
  res:setHeader('Content-Length', #body)

  return body
end


return srv

