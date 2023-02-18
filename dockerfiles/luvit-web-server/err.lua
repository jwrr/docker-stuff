-- err.lua

local utils = require'utils'
local template = require'template'

local err = {}

function err.handler(req, res, errCode, contentDir)
  res.statusCode = errCode
  local fileName = contentDir .. '/err' .. tostring(errCode) .. '.html'
  local html = template.replace(req, res, fileName)
  if html == '' then
    html = 'Error ' .. string(errCode) .. '\n'
  end
  return html
end

return err

