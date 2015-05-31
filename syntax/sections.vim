function! s:NextSection(backwards)
endfunction

noremap <script> <buffer> <silent> [[ :call <SID>NextSection(1, 0)<cr>
noremap <script> <buffer> <silent> ]] :call <SID>NextSection(1, 1)<cr>
noremap <script> <buffer> <silent> [] :call <SID>NextSection(2, 0)<cr>
noremap <script> <buffer> <silent> ][ :call <SID>NextSection(2, 1)<cr>

