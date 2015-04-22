" Encoding {
    set fileencodings=gb2312,gbk,ucs-bom,utf-8
    set fileencoding=gbk
    set termencoding=gbk
    set encoding=utf-8
" }

" Plugins {
    call pathogen#infect('~/.vim_runtime/sources_my/{}')
    call pathogen#helptags()
" }

" UI {
    set cmdheight=1
    "set cursorline
    "hi CursorLine ctermbg=darkblue ctermfg=white cterm=NONE guibg=darkred guifg=white gui=NONE
    set background=dark
    colorscheme solarized
    " cursor line & color
    set cursorline
    hi CursorLine ctermbg=darkblue ctermfg=white cterm=NONE guibg=darkred guifg=white gui=NONE
" }

" Misc {
    "set number
" }

" Text Formatting/Layout {
    set textwidth=100
    set smartindent
    if has("autocmd")
        au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif
    endif
    if $VIM_HATE_SPACE_ERRORS != '0'
        let c_space_errors=1
    endif
" }

" Folding {
    set foldenable " Turn on folding
    set foldmarker={,} " Fold C style code (only use this as default if you use a high foldlevel)
    set foldmethod=marker " Fold on the marker
    "set foldmethod=syntax
    set foldlevel=100 " Don't autofold anything (but I can still fold manually)
    set foldopen=block,hor,mark,percent,quickfix,tag " what movements open folds
    function SimpleFoldText()
        return getline(v:foldstart).' '
    endfunction
    set foldtext=SimpleFoldText() " Custom fold text function (cleaner than default)
    "set foldminlines=5
" }

" FileType Settings {
    highlight TooLong ctermbg=grey
    autocmd FileType cpp match TooLong '\%>100v.*'
    autocmd FileType cpp set foldcolumn=0 "no foldcolumn for cpp, since line number is shown
    autocmd FileType cpp set number

    autocmd FileType cs set foldcolumn=0 "no foldcolumn for cpp, since line number is shown
    autocmd FileType cs set number

    autocmd FileType python match TooLong '\%>80v.*'
    autocmd FileType python inoremap # #
    autocmd FileType python set foldcolumn=0
    autocmd FileType python set number

    autocmd FileType make set noexpandtab
    autocmd FileType diff nmap <C-n> /^+\\|^-<CR>
    autocmd FileType svnlog nmap q :q<CR>
    autocmd FileType otl set tabstop=2
    autocmd FileType otl set shiftwidth=2
" }

" Key Bindings {
    map <C-g> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
    map <C-G> :! ctags -R --fields=+lS .<CR>
    map <leader>l :TlistToggle<CR>
    nmap <F8> :set invnumber<CR>
" }

" NerdTree {
    " 设置NERDTree子窗口宽度
    let NERDTreeWinSize=32
    " 设置NERDTree子窗口位置
    let NERDTreeWinPos="left"
    " 显示隐藏文件
    let NERDTreeShowHidden=1
    " NERDTree 子窗口中不显示冗余帮助信息
    let NERDTreeMinimalUI=1
    " 删除文件时自动删除文件对应 buffer
    let NERDTreeAutoDeleteBuffer=1
" }

" DoxygenToolkit {
    let g:DoxygenToolkit_authorName = "zhangbiao(zhangbiao@baidu.com)"
    let g:DoxygenToolkit_briefTag_funcName = "yes"
    "let g:DoxygenToolkit_blockHeader = "----------------------------------------------------------------------------"
    "let g:DoxygenToolkit_blockFooter = "----------------------------------------------------------------------------"
    let g:DoxygenToolkit_licenseTag = "Copyright (c) 2015 Baidu.com, Inc. All Rights Reserved"
    let g:doxygen_enhanced_color = 1
" }
