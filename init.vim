call plug#begin('~/.config/nvim/plugged')

" Меню проекта и дополнения к нему
Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'scrooloose/nerdcommenter'
Plug 'ryanoasis/vim-devicons'

" Дополнение для Git
Plug 'airblade/vim-gitgutter'

" Линия статуса
Plug 'itchyny/lightline.vim'

" Тема
Plug 'joshdick/onedark.vim'

" Подсказки  
" Plug 'Shougo/deoplete.nvim', {'do': ':autocmd VimEnter * UpdateRemotePlugins'}
" Plug 'deoplete-plugins/deoplete-jedi'

" Python синтаксис
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}

" Скобки
Plug 'tpope/vim-surround'

" Плавная прокрутка
Plug 'psliwka/vim-smoothie'

call plug#end()


language en_US.utf8
set nocompatible
filetype plugin indent on
set encoding=utf-8
syntax enable

" Команды Vim в русской раскладке
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

" Нумерация строк
set number

" В нормальном режиме Ctrl+n вызывает :NERDTree
nmap <C-n> :NERDTreeToggle<CR>
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggl

" Стандартный фон терминала для любой цветовой схемы
au ColorScheme * hi Normal ctermbg=None

" Тема
let g:onedark_termcolors=256
colorscheme onedark

" Подсказки
let g:deoplete#enable_at_startup = 1
let g:jedi#completions_enabled = 0

" Автотабуляция
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" Для включения стандартного фона терминала в строке состояния
autocmd VimEnter * call SetupLightlineColors()
function SetupLightlineColors() abort
  let l:palette = lightline#palette()

  let l:palette.normal.middle = [ [ 'NONE', 'NONE', 'NONE', 'NONE' ] ]
  let l:palette.inactive.middle = l:palette.normal.middle
  let l:palette.tabline.middle = l:palette.normal.middle

  call lightline#colorscheme()
endfunction

" Тема статусбара
set noshowmode " Табличка --INSERT-- больше не выводится на экран
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'onedark',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }
