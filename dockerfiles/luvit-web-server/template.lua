-- template.lua

local utils = require'utils'
local template = {}

function template.replace(req, res, fileName)
  local templateMap = {GetPath = req.url}
  local html = utils.slurp(fileName)
  for fromStr,toStr in pairs(templateMap) do
      local fromStr = '{' .. fromStr .. '}'
      html = html:gsub(fromStr, toStr)
  end
  return html
end

return template

