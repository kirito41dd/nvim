module = {}
-- 通用 在init.lua中被调用
function module.setup()
	local opt = { noremap = true, silent = true }
	local function merge_a2b(a, b)
		for k, v in pairs(a) do b[k] = v end
		return b
	end
	vim.g.mapleader = ","
	--在分割区域跳转
	vim.keymap.set("n", "<C-h>", "<C-w>h", opt)
	vim.keymap.set("n", "<C-j>", "<C-w>j", opt)
	vim.keymap.set("n", "<C-k>", "<C-w>k", opt)
	vim.keymap.set("n", "<C-l>", "<C-w>l", opt)
	--分割
	vim.keymap.set("n", "<Leader>v", "<C-w>v", merge_a2b(opt, { desc = "左右分割窗口" }))
	vim.keymap.set("n", "<Leader>s", "<C-w>s", merge_a2b(opt, { desc = "上下分割窗口" }))
	--智能gk gj 方便在自动换行的文本上移动
	--https://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
	vim.keymap.set("n", "j", [[v:count ? 'j' : 'gj']], { noremap = true, expr = true })
	vim.keymap.set("n", "k", [[v:count ? 'k' : 'gk']], { noremap = true, expr = true })
	--全选
	vim.keymap.set("n", "<Leader>a", "ggVG", merge_a2b(opt, { desc = "全选" }))
	--tree
	vim.keymap.set("n", "<Leader>t", ":NvimTreeToggle<CR>", merge_a2b(opt, { desc = "打开目录树" }))
	--lsp
	vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, merge_a2b(opt, { desc = "浮窗显示诊断信息" }))
	vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, merge_a2b(opt, { desc = "上一处错误" }))
	vim.keymap.set('n', ']d', vim.diagnostic.goto_next, merge_a2b(opt, { desc = "下一处错误" }))
	vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, merge_a2b(opt, { desc = "展示错误列表" }))
	--lsp format
	vim.keymap.set("n", "<Leader>=", ":lua vim.lsp.buf.format({async=true})<CR>",
		merge_a2b(opt, { desc = "lsp格式化文件" }))
	-- Use LspAttach autocommand to only map the following keys
	-- after the language server attaches to the current buffer
	vim.api.nvim_create_autocmd('LspAttach', {
		group = vim.api.nvim_create_augroup('UserLspConfig', {}),
		callback = function(ev)
			-- Enable completion triggered by <c-x><c-o>
			vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

			-- Buffer local mappings.
			-- See `:help vim.lsp.*` for documentation on any of the below functions
			local opts = { buffer = ev.buf }
			vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, merge_a2b(opts, { desc = "跳转到声明" }))
			vim.keymap.set('n', 'gd', vim.lsp.buf.definition, merge_a2b(opts, { desc = "跳转到定义" }))
			vim.keymap.set('n', 'K', vim.lsp.buf.hover, merge_a2b(opts, { desc = "显示提示" }))
			--vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, merge_a2b(opts, { desc = "跳转到实现" }))
			vim.keymap.set('n', '<space>sk', vim.lsp.buf.signature_help,
				merge_a2b(opts, { desc = "显示signature帮助" }))
			vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder,
				merge_a2b(opts, { desc = "添加工作目录" }))
			vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder,
				merge_a2b(opts, { desc = "移除工作目录" }))
			vim.keymap.set('n', '<space>wl', function()
				print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
			end, merge_a2b(opts, { desc = "列出工作目录" }))
			vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition,
				merge_a2b(opts, { desc = "跳转到类型定义" }))
			vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, merge_a2b(opts, { desc = "lsp重命名" }))
			vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action,
				merge_a2b(opts, { desc = "code action" }))
			local tb = require 'telescope.builtin'
			--vim.keymap.set('n', 'gr', vim.lsp.buf.references, merge_a2b(opts, { desc = "列出所有引用的地方" }))
			vim.keymap.set('n', 'gr', tb.lsp_references, merge_a2b(opts, { desc = "列出所有引用的地方" }))
			vim.keymap.set('n', 'gi', tb.lsp_implementations, merge_a2b(opts, { desc = "跳转到实现" }))
		end,
	})
	-- bufferline
	vim.keymap.set("n", "<space>h", ":BufferLineCyclePrev<CR>", merge_a2b(opt, { desc = "上一个tab" }))
	vim.keymap.set("n", "<space>l", ":BufferLineCycleNext<CR>", merge_a2b(opt, { desc = "下一个tab" }))
	--toggleterm
	vim.keymap.set("n", "<Leader>T", ":ToggleTerm<CR>", merge_a2b(opt, { desc = "打开终端" }))
	--dap
	vim.keymap.set("n", "<leader>dr", ":lua require'dap'.continue()<CR>", { desc = "开始调试" })
	vim.keymap.set("n", "<leader>db", ":lua require'dap'.toggle_breakpoint()<CR>", { desc = "设置断点" })
	vim.keymap.set("n", "<leader>dB", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint Condition: '))<CR>",
		{ desc = "设置条件断点" })
	vim.keymap.set("n", "<leader>dn", ":lua require'dap'.step_over()<CR>", { desc = "step over" })
	vim.keymap.set("n", "<leader>di", ":lua require'dap'.step_into()<CR>", { desc = "step into" })
	vim.keymap.set("n", "<leader>do", ":lua require'dap'.step_out()<CR>", { desc = "step out" })
	vim.keymap.set("n", "<leader>du", ":lua require'dapui'.toggle()<CR>", { desc = "展示ui" })
	vim.keymap.set("n", "<leader>dq", ":DapTerminate<CR>", { desc = "停止调试" })
	vim.keymap.set("n", "<leader>dR", ":DapRerun<CR>", { desc = "重启调试" })
end

-- rust-tools
function module.rust_tools(rt, bufnr)
	vim.keymap.set("n", "<Leader>rh", rt.hover_actions.hover_actions,
		{ buffer = bufnr, desc = "rust tool hover action" })
	vim.keymap.set("n", "<Leader>ra", rt.code_action_group.code_action_group,
		{ buffer = bufnr, desc = "rust tool code action" })
	vim.keymap.set("n", "<Leader>rm", rt.expand_macro.expand_macro,
		{ buffer = bufnr, desc = "rust tool 展开宏" })
end

function module.toggleterm()
	vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], { buffer = 0, desc = "终端进入命令模式" })
end

function module.neovide()
	vim.keymap.set("i", "<c-v>", "<c-r>+", { desc = "neovide下粘贴" })
	vim.keymap.set("c", "<c-v>", "<c-r>+", { desc = "neovide下粘贴" })
end

return module
