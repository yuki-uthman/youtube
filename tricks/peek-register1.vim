
function! s:close(id) abort
  bw! "register"
endfunc

function! s:open() abort

  " save what is in the cmdline
  let cmd = getcmdline()

  " exit cmdline mode
  call feedkeys("\<C-U>\<Esc>", 'n')

  " open the split 
  3new 'register'

  " write the registers content
  call setline(1, [getreg('a'), getreg('b'), getreg('c')])

  " setup the timer to close the split
  call timer_start(1, function('s:close'))

  " go back to the cmdline and restore cmd
  call feedkeys(':'.. cmd .."\<C-R>", 'n')
endfunc

let @a = 'this is from register a'
let @b = 'this is from register b'
let @c = 'this is from register c'

cnoremap <C-R> <cmd>call <SID>open()<CR>


