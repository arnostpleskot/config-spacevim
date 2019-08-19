function! myspacevim#before() abort
  "" RainbowParentheses
  au VimEnter * RainbowParentheses
  au Syntax * RainbowParentheses
  " au Syntax * RainbowParenthesesLoadSquare
  " au Syntax * RainbowParenthesesLoadBraces

  "" ALE config
  let g:ale_sign_column_always = 1
  let g:ale_fix_on_save = 1
  let g:ale_echo_msg_format = '%severity%: %linter%: [ %code% ] %s'
  let g:ale_fixers = {
  \   '*': ['remove_trailing_lines', 'trim_whitespace'],
  \   'javascript': ['eslint', 'prettier'],
  \   'typescript': ['eslint', 'prettier'],
  \   'markdown': ['prettier']
  \}
endfunction

function! myspacevim#after() abort
   "" Copy/Paste/Cut
  if has('unnamedplus')
    set clipboard=unnamed,unnamedplus
  endif

  noremap YY "+y<CR>
  noremap <C-p> "+gP<CR>
  noremap XX "+x<CR>

  if has('macunix')
    " pbcopy for OSX copy/paste
    vmap <C-x> :!pbcopy<CR>
    vmap <C-c> :w !pbcopy<CR><CR>
  endif
endfunction
