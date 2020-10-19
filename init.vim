lua require('init')

function ActiveLine()
  return luaeval("require('statusline').activeLine()")
endfunction

function InactiveLine()
  return luaeval("require('statusline').inactiveLine()")
endfunction

augroup StatusLine
  autocmd!
  autocmd WinEnter,BufEnter * setlocal statusline=%!ActiveLine()
  autocmd WinLeave,BufLeave * setlocal statusline=%!InactiveLine()
augroup END
