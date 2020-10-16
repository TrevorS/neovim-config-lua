local Utils = {}

function Utils.map(mode, key, command, options)
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

function Utils.join_path(path_fragments, options)
  local options = options or {}

  return table.concat(path_fragments, options.sep or "/")
end

function Utils.home_path(path, options)
  local base = vim.fn.expand("$HOME")

  if path == nil then return base end

  return Utils.join_path({ base, path })
end

function Utils.nvim_path(path, options)
  local base = Utils.join_path({
    Utils.home_path(),
    ".config",
    "nvim"
  }, options)

  if path == nil then return base end

  return Utils.join_path({ base, path })
end

function Utils.lua_path(path, options)
  local base = Utils.join_path({ Utils.nvim_path(), "lua" })

  if path == nil then return base end

  return Utils.join_path({ base, path })
end

return Utils
