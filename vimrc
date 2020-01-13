"
" vimrc
"

"""
""" INITIAL CONFIG
"""

" set leader key to comma
let mapleader=","

" set jk to escape in insert mode
inoremap jk <esc>

" set jk to escape in visual mode
vnoremap jk <esc>


"""
""" SPACES AND TABS
"""

" enable syntax processing
syntax enable

" fix syntax highlighting when it gets messed up
" Source: http://vi.stackexchange.com/questions/2172/why-i-am-losing-syntax-highlighting-when-folding-code-within-a-script-tag
" Source: https://bitbucket.org/sjl/dotfiles/src/603bb1ae9da27c6e08ab115df1cb5d8f6a1442c3/vim/vimrc?at=default&fileviewer=file-view-default#cl-445
nnoremap U :syntax sync fromstart<cr>:redraw!<cr>

" number of visual spaces per TAB
set tabstop=2

" width of indents
set shiftwidth=2

" number of spaces in tab when editing
" this value is the number of spaces inserted when you hit <TAB> and the number of spaces that are removed when you hit backspace
set softtabstop=2

" turn <TAB>s into spaces
set expandtab

" set auto indenting
set autoindent
"set cindent


"""
""" UI CONFIG
"""

" consistent colors for terminal emulators with and without the bce terminfo capability
" Source: https://unix.stackexchange.com/questions/348771/why-do-vim-colors-look-different-inside-and-outside-of-tmux
set background=light

" display file name in vim title
set title

" always show status line
set laststatus=2

" display full file path in the status line
set statusline="%F%l,%c"

" show line numbers
set number

" show last command entered in bottom right
set showcmd

" highlight current line
set cursorline

" visual autocomplete for command menu
set wildmenu

" highlight matching brackets, parenthesis, curly braces, etc.
set showmatch

" show current cursor position
set ruler

" show line numbers relative to cursor instead of line numbers relative to beginning of file
set relativenumber

" hide buffers when switching to new files instead of closing them
set hidden


"""
""" WILDMENU
"""

" set wildmenu behavior
set wildmode=list:full

" filter out the cruft
set wildignore=*.swp,*.bak
set wildignore+=*.pyc,*class,*.sln,*.Master,*.csproj,*.csproj.user,*.cache,*.dll,*.pdb,*.min.*
set wildignore+=*/.git/**/*,*/.hg/**/*,*/.svn/**/*
set wildignore+=tags
set wildignore+=*.tar.*


"""
""" SEARCHING
"""

" remove case sensitivity from search
set ignorecase

" make searches case-sensitive if any uppercase characters are used
set smartcase

" search as characters are entered
set incsearch

" highlight matches
set hlsearch

" user <leader><space> to hide search highlighting
nnoremap <leader><space> :noh<CR>


"""
""" FOLDING
"""

" enable folding
set foldenable

" open most folds by default
set foldlevelstart=10

" folds can be nested, so we will limit nested folding to only go 10 deep
set foldnestmax=10

" space opens and closes folds
nnoremap <space> za

" fold based on indent level
set foldmethod=indent


"""
""" MOVEMENT
"""

" move vertically by visual line
" if the line is wrapped, this will move it to the next part of the wrapped line rather than the next "real" line
nnoremap j gj
nnoremap k gk

" move to beginnging/end of line
nnoremap B ^
nnoremap E $

" make sure ^/$ don't do anything
"nnoremap ^ <nop>
"nnoremap $ <nop>

" highlight last inserted text
nnoremap gV `[v`]

" more natural split openings
set splitbelow
set splitright

" more convenient nagivation between splits
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>

" more convenient buffer splitting
nnoremap <leader>h :sp<CR>
nnoremap <leader>v :vsp<CR>


"""
""" LEADER SHORTCUTS
"""

" edit and load (aka source) vimrc bindings
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" create window splits
nnoremap <leader>swh :topleft vnew<CR>
nnoremap <leader>swl :botright vnew<CR>
nnoremap <leader>swk :topleft new<CR>
nnoremap <leader>swj :botright new<CR>

" create buffer splits
nnoremap <leader>sh :leftabove vnew<CR>
nnoremap <leader>sl :rightbelow vnew<CR>
nnoremap <leader>sk :leftabove new<CR>
nnoremap <leader>sj :rightbelow new<CR>


"""
""" BACKUPS
"""

" change backups (~file) to their own directory
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup


"""
""" CUSTOM FUNCTIONS
"""

" toggle between number and relativenumber
function! ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc


"""
""" AUTOCOMPLETION
"""

" If you prefer the Omni-Completion tip window to close when a selection is
" made, these lines close it on movement in insert mode or when leaving
" insert mode.
"autocmd CursorMovedI * if pumvisible() == 0 && bufname("%") != "[Command Line]"|pclose|endif
"autocmd InsertLeave * if pumvisible() == 0 && bufname("%") != "[Command Line]"|pclose|endif

" Remap autocomplete keys from <C-x><C-o> to <C-k>
"inoremap <C-k> <C-x><C-o>

" Remap autocomplete keys from <C-x><C-o> to <leader>, (,,)
"inoremap <leader>, <C-x><C-o>
"inoremap <C-j> <C-n>
"inoremap <C-k> <C-p>


"""
""" PATHOGEN PLUGIN
"""
"execute pathogen#infect()


"""
""" STUFF FOR GO
"""

" enable filetype plugin
"filetype plugin on
"let g:go_disable_autoinstall = 0

" highlighting for Go
"let g:go_highlight_functions = 1
"let g:go_highlight_methods = 1
"let g:go_highlight_structs = 1
"let g:go_highligh_interfaces = 1
"let g:go_highlight_operators = 1
"let g:go_highlight_build_constraints = 1


"""
""" STUFF FOR ARM ASSEMBLY
"""

" ARMv6 and ARMv7 assembly syntax highlighting.
"au BufNewFile,BufRead *.s,*.S set filetype=arm " arm = armv6/7
