-- ==============================================================================
-- 1. 기본 설정 (User Settings)
-- ==============================================================================
local opt = vim.opt
local g = vim.g

g.mapleader = " " -- Leader 키 스페이스바
vim.keymap.set({ "i", "v" }, "df", "<Esc>")

opt.clipboard = "unnamed"
opt.cursorline = true
opt.showmatch = true
opt.splitbelow = true
opt.splitright = true
opt.modifiable = true
opt.colorcolumn = "80"
opt.backspace = "indent,eol,start"

opt.shell = "/bin/zsh"
opt.shellcmdflag = "-ic"
opt.mouse = "a"
opt.number = true
opt.ignorecase = true

opt.softtabstop = 4
opt.shiftwidth = 4
opt.tabstop = 4
opt.expandtab = true
opt.hlsearch = false
opt.updatetime = 100 -- gitgutter/gitsigns 속도

-- ==============================================================================
-- 2. 단축키 설정 (Keymaps)
-- ==============================================================================
local map = vim.keymap.set

-- 종료 및 저장
map("n", "<leader>q1", ":q!<CR>")
map("n", "<leader>qq", ":q<CR>")
map("n", "<leader>qa", ":qa<CR>")
map("n", "<leader>wq", ":wq<CR>")
map("n", "<leader>W", ":w<CR>")
map("n", "<leader>wa", ":wa<CR>")

map("v", "<leader>q1", "<esc>:q!<CR>")
map("v", "<leader>wq", "<esc>:wq<CR>")
map("v", "<leader>ww", "<esc>:w<CR>")

-- 화면 분할
map("n", "<leader>sp", ":split<CR>")
map("n", "<leader>vs", ":vsplit<CR>")

-- 커스텀 매핑 (주석 라인 생성)
map("n", "<leader>ann", "79i#<esc>YpO#<Space>")

-- 블랙홀 레지스터 삭제 (d, x, s가 클립보드를 오염시키지 않음)
map("n", "d", '"_d')
map("n", "D", '"_D')
map("n", "x", '"_x')
map("v", "x", '"_x')
map("n", "s", '"_s')

-- 들여쓰기 유지
map("n", ">", ">>")
map("n", "<", "<<")
map("v", ">", ">gv")
map("v", "<", "<gv")


vim.opt.autoread = true
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
  command = "if mode() != 'c' | checktime | endif",
  pattern = { "*" },
})

-- ==============================================================================
-- 3. 플러그인 매니저 설치 (lazy.nvim)
-- ==============================================================================
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- ==============================================================================
-- 4. 플러그인 (lua/plugins/ 에서 자동 로드)
-- ==============================================================================
require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
})
