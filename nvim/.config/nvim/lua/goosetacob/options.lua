-- avoid loading matchparen
vim.g.loaded_matchparen = true
-- netrw delete
vim.g.netrw_localrmdir = 'rm -r'
vim.g.grepprg = 'rg'

vim.g.skip_ts_context_commentstring_module = true

vim.opt.clipboard = 'unnamedplus'

vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.ruler = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = false

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv('XDG_DATA_HOME') .. '/nvim/undodir'
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = 'yes'
vim.opt.isfname:append('@-@')

-- default 4000 ms it too slow and noticeable
vim.opt.updatetime = 50 -- ms

vim.opt.colorcolumn = '80'

-- set hidden
-- set smartcase
-- set ignorecase
-- set noerrorbells
vim.opt.autoindent = true
vim.opt.backspace = 'indent,eol,start'
-- set list
-- set listchars=tab:→\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
vim.opt.ttyfast = true
-- " do not pass messages to |ins-completion-menu|
-- set shortmess+=c
-- More space for messages
vim.opt.cmdheight = 2
-- enable mouse support
vim.opt.mouse = 'a'
-- highlight current line
-- vim.opt.cursorline = true
