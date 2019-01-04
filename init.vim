"---------------- Plugins -------------------
call plug#begin('~/.vim/plugged')

  " Make sure you use single quotes

  " Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
  Plug 'junegunn/vim-easy-align'

  " Any valid git URL is allowed
  Plug 'https://github.com/junegunn/vim-github-dashboard.git'

  " On-demand loading
  Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
  Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

  " Using a non-master branch
  Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

  " Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
  Plug 'fatih/vim-go', { 'tag': '*' }

  " Plugin options
  Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

  " Plugin outside ~/.vim/plugged with post-update hook
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }


  Plug 'vim-scripts/L9'
  Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
  Plug 'gmarik/Vundle.vim'

  " Navigation
  Plug 'bkad/CamelCaseMotion'
  Plug 'Lokaltog/vim-easymotion'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'rking/ag.vim'
  Plug 'majutsushi/tagbar'
  Plug 'matze/vim-move'

  " Correction
  Plug 'w0rp/ale'
  Plug 'ntpeters/vim-better-whitespace'
  Plug 'Raimondi/delimitMate'
  Plug 'reedes/vim-wordy'

  " Appearance
  Plug 'tomasr/molokai'
  Plug 'airblade/vim-gitgutter'
  Plug 'kshenoy/vim-signature'
  Plug 'Bling/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'gorodinskiy/vim-coloresque'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rhubarb'
  Plug 'skywind3000/asyncrun.vim'

  " Objects
  Plug 'kana/vim-textobj-user'
  Plug 'glts/vim-textobj-comment'

  " General editing
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-repeat'
  Plug 'tomtom/tcomment_vim'
  Plug 'mattn/emmet-vim'
  Plug 'mattn/webapi-vim'
  Plug 'mattn/gist-vim'

  " Languages
  Plug 'slim-template/vim-slim'
  Plug 'kchmck/vim-coffee-script'
  Plug 'chr4/nginx.vim'
  Plug 'zaiste/tmux.vim'
  Plug 'elzr/vim-json'
  Plug 'TAKAyukiatkwsk/vim-mongoid-syntax'
  Plug 'pangloss/vim-javascript'
  Plug 'mxw/vim-jsx'
  Plug 'plasticboy/vim-markdown'
  Plug 'aliva/vim-fish'

  " Terraform
  Plug 'hashivim/vim-terraform'
  Plug 'vim-syntastic/syntastic'
  Plug 'juliosueiras/vim-terraform-completion'

call plug#end()

