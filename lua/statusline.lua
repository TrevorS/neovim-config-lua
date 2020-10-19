local M = {}

local modes = setmetatable({
  ["!"] = "Shell",
  ["^S"] = "Select-Block",
  ["^V"] = "Visual-Block",
  ["c"] = "Command",
  ["ce"] = "Ex",
  ["cv"] = "Vim Ex",
  ["i"] = "Insert",
  ["ic"] = "Insert",
  ["ix"] = "Insert",
  ["n"] = "Normal",
  ["no"] = "Normal - Operator Pending",
  ["r"] = "Prompt",
  ["R"] = "Replace",
  ["r?"] = "Confirm",
  ["rm"] = "More",
  ["Rv"] = "Visual-Replace",
  ["s"] = "Select",
  ["S"] = "Select-Line",
  ["t"] = "Terminal",
  ["v"] = "Visual",
  ["V"] = "Visual-Line"
}, {
  __index= function(_, _)
    return ""
  end
})

function M.activeLine()
  local statusline = ""

  -- editor status
  local mode = M.getMode()
  statusline = statusline .. mode

  -- buffer filename
  local fileName = M.getFileName()
  statusline = statusline .. " | " .. fileName

  -- align to the left
  statusline = statusline .. "%="

  -- buffer filetype
  local filetype = M.getFileType()
  statusline = statusline .. filetype

  return statusline
end

function M.inactiveLine()
  local statusline = ""

  statusline = statusline

  return statusline
end

function M.getMode()
  local results = vim.api.nvim_get_mode()["mode"]

  return modes[results]
end

function M.getFileName()
  local filename = vim.api.nvim_call_function("expand", {"%F"})

  if M.isEmpty(filename) then
    return "[No Name]"
  end

  return filename
end

function M.getFileType()
  return vim.api.nvim_buf_get_option(0, "filetype")
end

function M.isEmpty(str)
  return str == nil or str == ""
end

function M.isPresent(str)
  return not M.isEmpty(str)
end

return M
