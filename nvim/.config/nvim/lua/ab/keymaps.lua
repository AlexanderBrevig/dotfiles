local function map(mode, l, r, desc)
	vim.keymap.set(mode, l, r, { desc = desc })
end

local function map_to_buf(mode, l, r, bufnr, desc)
	vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
end

-- General
map("n", "gl", "$", "Go to end of line")
map("n", "gh", "0", "Go to beginning of line")

map("i", "jk", "<ESC>", "Exit insert mode with jk")

map("n", "<Esc>", ":nohl<CR>", "Find clear highlight")

map("n", "<leader>+", "<C-a>", "Increment number")
map("n", "<leader>-", "<C-x>", "Decrement number")

-- Splits
map("n", "<leader>sv", "<C-w>v", "Split window vertically")
map("n", "<leader>sh", "<C-w>s", "Split window horizontally")
map("n", "<leader>se", "<C-w>=", "Split windows equal size")
map("n", "<leader>sx", ":close<CR>", "Split windows equal size")

-- Window navigation
map("n", "<leader>wh", "<C-w>h", "Window select left")
map("n", "<leader>wj", "<C-w>j", "Window select down")
map("n", "<leader>wk", "<C-w>k", "Window select up")
map("n", "<leader>wl", "<C-w>l", "Window select righgg")
map("n", "<leader>wo", "<C-w>o", "Window close others")

-- Tabs
map("n", "<leader>to", ":tabnew<CR>", "Tab open new")
map("n", "<leader>tx", ":tabclose<CR>", "Tab close current")
map("n", "<leader>tn", ":tabn<CR>", "Tab next")
map("n", "<leader>tp", ":tabp<CR>", "Tab previous")
map("n", "<leader>tt", ":tabnew %<CR>", "Tab this buffer")

-- Diagnostics
map("n", "[d", vim.diagnostic.goto_prev, "Go to previous [D]iagnostic message")
map("n", "]d", vim.diagnostic.goto_next, "Go to next [D]iagnostic message")
map("n", "<leader>d", vim.diagnostic.open_float, "Show diagnostic [E]rror messages")
map("n", "<leader>q", vim.diagnostic.setloclist, "Open diagnostic [Q]uickfix list")

-- Trouble
-- see ./plugins/trouble.lua

local M = {}

function M.telescope()
	local builtin = require("telescope.builtin")
	map("n", "<leader>f", builtin.find_files, "Fuzzy find files in cwd")
	map("n", "<leader>b", builtin.buffers, "Fuzzy find recent files")
	map("n", "<leader>/", builtin.live_grep, "Find string in cwd")
	map("n", "<leader>*", builtin.grep_string, "Find string under cursor in cwd")
	map("n", "<leader>ct", "<cmd>TodoTelescope<cr>", "Find todos")
	map("n", "<leader>oh", builtin.help_tags, "Open help tags")
	map("n", "<leader>od", builtin.diagnostics, "Open diagnostics")
	map("n", "<leader><leader>", builtin.resume, "Open previous telescope")
	map("n", "<leader>on", function()
		builtin.find_files({ cwd = vim.fn.stdpath("config") })
	end, "[S]earch [N]eovim files")
end

function M.lsp(ev)
	local keymap = vim.keymap
	local opts = { buffer = ev.buf, silent = true }

	-- GoTo
	opts.desc = "Show LSP references"
	keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

	opts.desc = "Go to declaration"
	keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

	opts.desc = "Show LSP definitions"
	keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

	opts.desc = "Show LSP implementations"
	keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

	opts.desc = "Show LSP type definitions"
	keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

	opts.desc = "See available code actions"
	keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

	opts.desc = "Smart rename"
	keymap.set("n", "<leader>lr", vim.lsp.buf.rename, opts) -- smart rename

	opts.desc = "Show buffer diagnostics"
	keymap.set("n", "<leader>lD", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

	opts.desc = "Show line diagnostics"
	keymap.set("n", "<leader>ld", vim.diagnostic.open_float, opts) -- show diagnostics for line

	opts.desc = "Go to previous diagnostic"
	keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

	opts.desc = "Go to next diagnostic"
	keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

	opts.desc = "Show documentation for what is under cursor"
	keymap.set("n", "<leader>k", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor
	opts.desc = "Show documentation (short K)"
	keymap.set("n", "<leader>lk", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

	opts.desc = "Restart LSP"
	keymap.set("n", "<leader>lx", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
end

function M.conform()
	local conform = require("conform")
	map({ "n", "v" }, "<leader>cf", function()
		conform.format({
			lsp_fallback = true,
			async = false,
			timeout_ms = 1000,
		})
	end, "Code format")
end

function M.lint()
	local lint = require("lint")
	map("n", "<leader>cl", function()
		lint.try_lint()
	end, "Code lint")
end

function M.gitsigns(bufnr)
	local gs = package.loaded.gitsigns
	-- Navigation
	map_to_buf("n", "]h", gs.next_hunk, bufnr, "Next Hunk")
	map_to_buf("n", "[h", gs.prev_hunk, bufnr, "Prev Hunk")

	-- Actions
	map_to_buf("n", "<leader>hs", gs.stage_hunk, bufnr, "Stage hunk")
	map_to_buf("n", "<leader>hr", gs.reset_hunk, bufnr, "Reset hunk")
	map_to_buf("v", "<leader>hs", function()
		gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
	end, bufnr, "Stage hunk")
	map_to_buf("v", "<leader>hr", function()
		gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
	end, bufnr, "Reset hunk")

	map_to_buf("n", "<leader>hS", gs.stage_buffer, bufnr, "Stage buffer")
	map_to_buf("n", "<leader>hR", gs.reset_buffer, bufnr, "Reset buffer")

	map_to_buf("n", "<leader>hu", gs.undo_stage_hunk, bufnr, "Undo stage hunk")

	map_to_buf("n", "<leader>hp", gs.preview_hunk, bufnr, "Preview hunk")

	map_to_buf("n", "<leader>hb", function()
		gs.blame_line({ full = true })
	end, bufnr, "Blame line")
	map_to_buf("n", "<leader>hB", gs.toggle_current_line_blame, bufnr, "Toggle line blame")

	map_to_buf("n", "<leader>hd", gs.diffthis, bufnr, "Diff this")
	map_to_buf("n", "<leader>hD", function()
		gs.diffthis("~")
	end, bufnr, "Diff this ~")

	-- Text object
	map_to_buf({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", bufnr, "Gitsigns select hunk")
end

function M.substitute()
	local substitute = require("substitute")
	map("n", "s", substitute.operator, "Substitute with motion")
	map("n", "ss", substitute.line, "Substitute line")
	map("n", "S", substitute.eol, "Substitute to end of line")
	map("x", "s", substitute.visual, "Substitute in visual mode")
end

function M.todo_comments()
	local todo_comments = require("todo-comments")

	map("n", "]t", function()
		todo_comments.jump_next()
	end, "Next todo comment")

	map("n", "[t", function()
		todo_comments.jump_prev()
	end, "Previous todo comment")
end

return M
