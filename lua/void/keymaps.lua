-- local opts = function(desc)
--     desc = "No Description Available"
-- 	return { noremap = true, silent = true }
-- end

local opts = { noremap = true, silent = true }

-- Shorten function name
-- local keymap = vim.api.nvim_set_keymap
local keymap = vim.keymap.set

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "


-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",


-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts) -- Move to left window
keymap("n", "<C-j>", "<C-w>j", opts) -- Move to bottom window
keymap("n", "<C-k>", "<C-w>k", opts) -- Move to upper window
keymap("n", "<C-l>", "<C-w>l", opts) -- Move to right winodw


-- Clear highlights on search when pressing <Esc> in normal mode
keymap("n", "<Esc>", "<cmd>nohlsearch<CR>", opts)

-- Resize window using <ctrl> arrow keys
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)     -- Go to new buffer
keymap("n", "<S-h>", ":bprevious<CR>", opts) -- Go to previous buffer

-- Commenting
-- keymap("n", "gcn", "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx", opts)	-- Add Comment to current line
-- keymap("n", "gco", "o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", opts) -- Add Comment Below
-- keymap("n", "gcO", "O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", opts) -- Add Comment Above

-- Telescope
-- keymap("n", "<leader>sf",
-- 	"<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>",
-- 	opts)
-- keymap("n", "<c-t>", "<cmd>Telescope live_grep<cr>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)  -- Decrease indentiation
keymap("v", ">", ">gv", opts)  -- Increase indentiation

keymap("v", "p", '"_dP', opts) -- Stop yanking word when replacing the word

-- Visual Block Mode --
-- Move text up and down
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts) -- Press <Alt-j> to move text down
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts) -- Press <Alt-k> to move text up


keymap({ "n", "v", "i" }, "<C-s>", "<cmd>:w<cr>", opts) -- Save file using Ctrl-s
