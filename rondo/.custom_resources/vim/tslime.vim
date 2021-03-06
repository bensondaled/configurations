" Tslime.vim. Send portion of buffer to tmux instance
" Maintainer: C.Coutinho <kikijump [at] gmail [dot] com>
" Licence:    DWTFYWTPL

if exists("g:tslime_loaded")
  finish
endif

let g:tslime_loaded = 1
let g:matlab_cmd = "matlab -nosplash -nodesktop"
let g:tmux_sessionname = g:tmux_session_name
let g:tmux_windowname = "0"
let g:tmux_panenumber = "0"

" Main function.
" Use it in your script if you want to send text to a tmux session.
function! Send_to_Tmux(text, panenumber)
  if !exists("b:tmux_sessionname") || !exists("b:tmux_windowname") || !exists("b:tmux_panenumber")
    if exists("g:tmux_sessionname") && exists("g:tmux_windowname") && exists("g:tmux_panenumber")
      let b:tmux_sessionname = g:tmux_sessionname
      let b:tmux_windowname = g:tmux_windowname
      let b:tmux_panenumber = a:panenumber
    else
      call <SID>Tmux_Vars()
    end
  end

  let target = b:tmux_sessionname . ":" . b:tmux_windowname . "." . b:tmux_panenumber

  call system("tmux set-buffer '" . substitute(a:text, "'", "'\\\\''", 'g') . "'" )
  call system("tmux paste-buffer -t " . target)
endfunction

" Session completion
function! Tmux_Session_Names(A,L,P)
  return system("tmux list-sessions | sed -e 's/:.*$//'")
endfunction

" Window completion
function! Tmux_Window_Names(A,L,P)
  return system("tmux list-windows -t" . b:tmux_sessionname . ' | grep -e "^\w:" | sed -e "s/ \[[0-9x]*\]$//"')
endfunction

" Pane completion
function! Tmux_Pane_Numbers(A,L,P)
  return system("tmux list-panes -t " . b:tmux_sessionname . ":" . b:tmux_windowname . " | sed -e 's/:.*$//'")
endfunction

" set tslime.vim variables
function! s:Tmux_Vars()
  let b:tmux_sessionname = input("session name: ", "", "custom,Tmux_Session_Names")
  let b:tmux_windowname = substitute(input("window name: ", "", "custom,Tmux_Window_Names"), ":.*$" , '', 'g')
  let b:tmux_panenumber = input("pane number: ", "", "custom,Tmux_Pane_Numbers")

  if !exists("g:tmux_sessionname") || !exists("g:tmux_windowname") || !exists("g:tmux_panenumber")
    let g:tmux_sessionname = b:tmux_sessionname
    let g:tmux_windowname = b:tmux_windowname
    let g:tmux_panenumber = b:tmux_panenumber
  end
endfunction

" Custom Functions
"
function! RunCurrentScript()
	let scriptName = expand('%:r')
	call Send_to_Tmux(scriptName . "\n")
endfunction

function! ChangeToCurrentDirectory()
	let currentDir = fnamemodify(getcwd(), ':p')
	call Send_to_Tmux("cd " . currentDir . "\n")
endfunction

function! SendToPrompt(text)
    if g:pro_lang == "py"
        call Send_to_Tmux("%cpaste \n " . a:text . "\n--\n", 1)
    elseif g:pro_lang == "matlab"
        call Send_to_Tmux(a:text . "\n", 1)
    endif
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

map <C-M> "ry <Esc> :call SendToPrompt(@r)<CR>
