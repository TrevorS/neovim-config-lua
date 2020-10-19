local M = {}

function M.map(mode, key, command, options)
  local options = options or {};
  local cr = options.cr or false;

  if cr then
    command = command .. "<cr>"
  end

  vim.fn.nvim_set_keymap(mode, key, command, {
    noremap = options.noremap or true,
    silent = options.silent or false,
    expr = options.expr or false,
    script = options.script or false,
  })
end

function M.join_path(path_fragments, options)
  local options = options or {}

  return table.concat(path_fragments, options.sep or "/")
end

function M.home_path(path, options)
  local base = vim.fn.expand("$HOME")

  if path == nil then return base end

  return M.join_path({ base, path })
end

function M.nvim_path(path, options)
  local base = M.join_path({
    M.home_path(),
    ".config",
    "nvim"
  }, options)

  if path == nil then return base end

  return M.join_path({ base, path })
end

function M.lua_path(path, options)
  local base = M.join_path({ M.nvim_path(), "lua" })

  if path == nil then return base end

  return M.join_path({ base, path })
end

return M
