set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=$HOME/vimfiles/bundle/Vundle.vim/
call vundle#begin('$HOME/vimfiles/bundle/')
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'https://github.com/ctrlpvim/ctrlp.vim.git'
Plugin 'https://github.com/kana/vim-textobj-user.git'
Plugin 'https://github.com/kana/vim-textobj-indent.git'
Plugin 'https://github.com/tpope/vim-surround.git'
Plugin 'https://github.com/scrooloose/nerdtree.git'
Plugin 'https://github.com/inkarkat/vim-mark.git'
Plugin 'https://github.com/inkarkat/vim-ingo-library.git'
Plugin 'https://github.com/dpelle/vim-LanguageTool.git' "grammar checking
Plugin 'https://github.com/w0rp/ale.git' "syntax checking
Plugin 'https://github.com/python-mode/python-mode.git' " python highlight more syntax'
"Plugin 'https://github.com/Valloric/YouCompleteMe.git'
Plugin 'https://github.com/vim-airline/vim-airline.git' " status bar
Plugin 'https://github.com/rking/ag.vim.git' "Plugin for the_silver_searcher
Plugin 'https://github.com/Chun-Yang/vim-action-ag.git' "Search current words or text selection with Ag
Plugin 'https://github.com/gabesoft/vim-ags.git' " Another silver searcher plugin
Plugin 'https://github.com/jremmen/vim-ripgrep.git' " ripgrep for searching like silver_searcher
Plugin 'taglist_46', {'pinned': 1}
Plugin 'conque_2.3', {'pinned': 1}
"Colorscheme
Plugin 'dracula/vim'
Plugin 'https://github.com/phanviet/vim-monokai-pro.git'
Plugin 'https://github.com/ajmwagar/vim-deus.git'
Plugin 'https://github.com/nightsense/snow.git'
Plugin 'https://github.com/NLKNguyen/papercolor-theme.git'
Plugin 'colors', {'pinned': 1}
Plugin 'https://github.com/rafi/awesome-vim-colorschemes.git'
Plugin 'https://github.com/t9md/vim-quickhl.git' " Quick highlight
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-clugin stuff after this line

"Font
"colorscheme murphy
"colorscheme dracula
colorscheme gruvbox
"colorscheme eclipse
"colorscheme notepad-plus-plus
"autocmd BufWinEnter,FileType c colorscheme gruvbox
"autocmd BufWinEnter,FileType vim colorscheme dracula
"if (&ft == 'c')
"    ":setlocal colorscheme gruvbox
"    "autocmd BufWinEnter colorscheme gruvbox
"endif
set guifont=Consolas:h8

" Window moverment
set splitbelow
set splitright
"nnoremap <C-J> <C-W><C-J> "Ctrl-j to move down a split
"nnoremap <C-K> <C-W><C-K> "Ctrl-k to move up a split
"nnoremap <C-L> <C-W><C-L> "Ctrl-l to move	right a split
"nnoremap <C-H> <C-W><C-H> "Ctrl-h to move left a split

"Maximum current window and restore
nnoremap <C-W>m :call MaximizeToggle()<CR>
function! MaximizeToggle()
    if exists("s:maximize_session")
        exec "source " . s:maximize_session
        call delete(s:maximize_session)
        unlet s:maximize_session
        let &hidden=s:maximize_hidden_save
        unlet s:maximize_hidden_save
    else
        let s:maximize_hidden_save = &hidden
        let s:maximize_session = tempname()
        set hidden
        exec "mksession! " . s:maximize_session
        only
    endif
endfunction

" Edit ~\_vimrc
" edit vimrc/zshrc and load vimrc bindings
nnoremap <leader>e :vs! $HOME\_vimrc<CR>
nnoremap <leader>s :so $HOME\_vimrc<CR>

" Encoding
set encoding=utf8
" Tab indent
set tabstop=4
"set autoindent
set backspace=indent,eol,start
set shiftwidth=4
set expandtab

" Cscope
set cscopequickfix=s-,c-,d-,i-,t-,e-,a-
" To do the first type of search, hit 'CTRL-\', followed by one of the
" cscope search types above (s,g,c,t,e,f,i,d).  The result of your cscope
" search will be displayed in the current window.  You can use CTRL-T to
" go back to where you were before the search.  
"
nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>


" Using 'CTRL-spacebar' (intepreted as CTRL-@ by vim) then a search type
" makes the vim window split horizontally, with search result displayed in
" the new window.
"
" (Note: earlier versions of vim may not have the :scs command, but it
" can be simulated roughly via:
"    nmap <C-@>s <C-W><C-S> :cs find s <C-R>=expand("<cword>")<CR><CR>	

nmap <C-@>s :scs find s <C-R>=expand("<cword>")<CR><CR>	
nmap <C-@>g :scs find g <C-R>=expand("<cword>")<CR><CR>	
nmap <C-@>c :scs find c <C-R>=expand("<cword>")<CR><CR>	
nmap <C-@>t :scs find t <C-R>=expand("<cword>")<CR><CR>	
nmap <C-@>e :scs find e <C-R>=expand("<cword>")<CR><CR>	
nmap <C-@>f :scs find f <C-R>=expand("<cfile>")<CR><CR>	
nmap <C-@>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>	
nmap <C-@>d :scs find d <C-R>=expand("<cword>")<CR><CR>	

" Hitting CTRL-space *twice* before the search type does a vertical 
" split instead of a horizontal one (vim 6 and up only)
"
" (Note: you may wish to put a 'set splitright' in your .vimrc
" if you prefer the new window on the right instead of the left

nmap <C-@><C-@>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-@><C-@>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-@><C-@>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-@><C-@>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-@><C-@>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-@><C-@>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>	
nmap <C-@><C-@>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>	
nmap <C-@><C-@>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>
nnoremap <ALT-n> :cn<CR>
nnoremap <ALT-b> :cb<CR>
"Folding
set foldenable
set fdm=syntax
"set fdm=indent
set foldlevel=99
set foldnestmax=10
nnoremap <space> za
"MISC
"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/ " Flag unneccessary white spcace
filetype indent on      " load filetype-specific indent files
set wildmenu
set showmatch

"toggle between number and relativenumber
set nu
function! ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
    else
        set relativenumber
    endif
endfunction
nnoremap <C-n> :call ToggleNumber()<CR>

"strips trailing whitespace at the end of files. this
" is called on buffer write in the autogroup above.
function! StripTrailingWhitespaces()
    " save last search & cursor position
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunction
nnoremap <leader>ds :call StripTrailingWhitespaces()<CR>

"Syntax highlight
syntax on
set hls
set showcmd             " show command in bottom bar

" CtrlP
"e - jump when <cr> is pressed, but only to windows in the current tab.
let g:ctrlp_switch_buffer = 'Et'
let g:ctrlp_working_path_mode = 'd' 
let g:ctrlp_mruf_max = 250
let g:ctrlp_reuse_window = 'netrw'
let g:mwDefaultHighlightingPalette = 'extended'
nnoremap <leader>b :CtrlPBuffer<CR>
if executable('rg')
      set grepprg=rg\ --color=never
      let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
      let g:ctrlp_use_caching = 0
 elseif 
    executable('ag')
     " Use ag over grep
     set grepprg=ag\ --nogroup\ --nocolor

    " Use ag in CtrlP for listing files. Lightning fast and respects
    " .gitignore
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

     " ag is fast enough that CtrlP doesn't need to cache
    let g:ctrlp_use_caching = 0 
else
endif
 " Excluding version control directories
" set wildinore+=*/.git/*,*/.hg/*,*/.svn/*        " Linux/MacOSX
set wildignore+=*\\.git\\*,*\\.hg\\*,*\\.svn\\*,*\\.out\\*  " Windows ('noshellslash')
 " File pattern ignor
 let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
"BUFFER
"Show buffer list
:nnoremap <F5> :buffers<CR>:buffer<Space>
:nnoremap <F6> :buffers<CR>:vsplit<Space>\|<Space>buffer<Space>
"Buffer swiching
"<CTRL-^>: pre
"<CTRL-6>: next
" Press F10 to open buffer menu and tab to select buffer
set wildchar=<Tab> wildmenu wildmode=full
set wildcharm=<C-Z>
nnoremap <F10> :b <C-Z>
"SERACH TEXT in MULTI FILE (directory )
"Silver searcher plugin
let g:ag_highlight=0
let g:ags_agcontext = 3


nnoremap <silent> <Esc> :let @/=""<CR>

" Copy to clipboard
nnoremap <leader>c "+yiw
vnoremap <leader>c "+y
nnoremap <leader>p <Esc>i<c-r>+<Esc>
" Move lines around easily
nnoremap <leader>k :m-2<cr>==
nnoremap <leader>j :m+<cr>==
xnoremap <leader>k :m-2<cr>gv=gv
xnoremap <leader>j :m'>+<cr>gv=gv
" Better find and replace
map <leader>fr :%s///g<left><left>
map <leader>frl :s///g<left><left>

" Enable rg seaching
set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
" find under current word
nnoremap <leader>fw :Ag! "<cword>" --ignore="*.out"<cr>
" find under selection
vnoremap <leader>fw y:Ag! <c-r>" --ignore="*.out"<cr>
nnoremap <leader>f :Ag!<space>

"Copy file name to clipboard
nmap <leader>yfp    :let @*=expand("%p")<CR>
nmap <leader>yfn    :let @*=expand("%:t")<CR>

" set open quickfix window
" Open left bottom
noremap <leader>qf :copen<CR>
noremap <leader>qn :cnext<CR>
noremap <leader>qp :cpre<CR>
