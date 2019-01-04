
" let g:ctrlp_root_markers = ['vendor/']
" nnoremap <Leader>o :CtrlP<CR>

let g:ctrlp_custom_ignore = {
  \ 'dir':  'vendor',
  \ }

" Now when you choose a file to open via CtrlP it will open and the NERDTree pane will be closed:
let g:ctrlp_dont_split = 'NERD'

let g:ctrlp_working_path_mode = 'ra'

let g:go_decls_includes = "func,type,const,var"

let g:auto_ctags = 1
let g:ctrlp_extensions = ['tag']
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" golang
" let g:ctrlp_buftag_types = {'go' : '--language-force=go --golang-types=ft'}

let g:ctrlp_buftag_types = {'go': '--language-force=go --golang-types=ftv'}
