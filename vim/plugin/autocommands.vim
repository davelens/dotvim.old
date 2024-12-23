augroup buffers_setup
  au!
  " Delete trailing whitespaces on saving a file
  autocmd BufWritePre * call buffers#strip_trailing_whitespace()
augroup END

augroup vim_setup
  au!
  " When editing a file, always jump to the last known cursor position.
  " When editing a commit message (gitcommit for instance), just ignore
  " the last cursor position, it'll probably be wrong anyway.
  " Thanks to @dubgeiser for the commit message exception!
  autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") && &ft !~# 'commit' |
        \   exe "normal g`\"" |
        \ endif

  " The following autocommands are used in tandem to avoid file conflicts in general.
  autocmd FocusGained,BufEnter * :checktime " Load in changes made from *within* vim.
  autocmd FocusLost,WinLeave * :silent! noautocmd w " Write files when leaving buffers.
  " To understand why autoread alone does not track all changes regardless of source:
  " https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044

  " Close preview windows after autocomplete automatically
  autocmd CompleteDone * pclose

  " TODO: Move this to a another spot in this file?
  autocmd BufRead,BufNewFile *.heex set filetype=eelixir
augroup END

" :TestFile mapping to Enter, with a fix for Enter in command-line mode.
augroup tests
  au!
  " Reserves <CR> for running a file spec in any buffer with a defined FileType.
  au FileType ruby,elixir,javascript nnoremap <buffer> <CR> :TestFile<CR>
  " Unmaps <CR> when entering Command-Line Mode. Includes terminals.
  " This way I can keep using <CR> in q:
  au FileType vim silent! nunmap <buffer> <CR>
augroup END

augroup git
  au!
  au FileType * nnoremap <leader>g :G<CR>
augroup END

" Fix copy/paste from vim registers to system clipboard on WSL.
if has('wsl')
  augroup WSL_setup
    au!
    autocmd TextYankPost * :call system('clip.exe ',@")
  augroup END
endif

augroup rails
  au!
  autocmd CursorMoved *.yml echo localorie#expand_key()
augroup END
