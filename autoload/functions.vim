" Window movement shortcuts
" move to the window in the direction shown, or create a new window
function! functions#WinMove(key)
    let t:curwin = winnr()
    exec "wincmd ".a:key
    if (t:curwin == winnr())
        if (match(a:key,'[jk]'))
            wincmd v
        else
            wincmd s
        endif
        exec "wincmd ".a:key
    endif
endfunction

" smart tab completion
function! functions#Smart_TabComplete()
    let line = getline('.')                         " current line

    let substr = strpart(line, -1, col('.')+1)      " from the start of the current
    " line to one character right
    " of the cursor
    let substr = matchstr(substr, '[^ \t]*$')       " word till cursor
    if (strlen(substr)==0)                          " nothing to match on empty string
        return '\<tab>'
    endif
    let has_period = match(substr, '\.') != -1      " position of period, if any
    let has_slash = match(substr, '\/') != -1       " position of slash, if any
    if (!has_period && !has_slash)
        return '\<C-X>\<C-P>'                         " existing text matching
    elseif ( has_slash )
        return '\<C-X>\<C-F>'                         " file matching
    else
        return '\<C-X>\<C-O>'                         " plugin matching
    endif
endfunction

" execute a custom command
function! functions#RunCustomCommand()
	up
    if g:silent_custom_command
        execute 'silent !' . s:customcommand
    else
        execute '!' . s:customcommand
    endif
endfunction

function! functions#SetCustomCommand()
    let s:customcommand = input('Enter Custom Command$ ')
endfunction

function! functions#TrimWhiteSpace()
    %s/\s\+$//e
endfunction

function! functions#HtmlUnEscape()
  silent s/&lt;/</eg
  silent s/&gt;/>/eg
  silent s/&amp;/\&/eg
endfunction


" delete the current buffer
function! functions#Delete(...)
    if (exists('a:1'))
        let file=a:1
    elseif ( &ft == 'help' )
        echohl Error
        echo "Cannod delete a help buffer!"
        echohl None
        return -1
    else
        let file=expand('%:p')
    endif
    let status=delete(file)
    if (status == 0)
        echo "Deleted " . file
    else
        echohl WarningMsg
        echo "Failed to delete " . file
        echohl None
    endif
    return status
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Returns true if paste mode is enabled
function! functions#HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

" Don't close window, when deleting a buffer
function! functions#BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

function! functions#CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction 

function! functions#VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction
