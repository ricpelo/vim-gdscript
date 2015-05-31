setlocal foldmethod=expr
setlocal foldexpr=GetGdscriptFold(v:ln)

function! IndentLevel(ln)
    return indent(a:ln) / &shiftwidth
endfunction

function! NextLine(ln)
    let numLines = line('$')
    let current = a:ln + 1

    while current <= numLines
        if getline(current) =~? '\v\S'
            return current
        endif
    
        let current += 1
    endwhile

    return -2
endfunction

function! GetGdscriptFold(ln)
    if getline(a:ln) =~? '\v\s*$'
        return '-1'
    endif

    let ci = IndentLevel(a:ln)
    let ni = IndentLevel(NextLine(a:ln))

    if ni == ci
        return ci
    elseif ni < ci
        return ci
    elseif ni > ci
        return '>' . ni
    endif
endfunction
