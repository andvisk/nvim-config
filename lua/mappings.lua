local ok, wk = pcall(require, "which-key")

if not ok then
    return
end

-- Space as leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local n_opts = {
    mode = "n",
    prefix = "",
    silent = true,
    noremap = true,
    nowait = true,
}

wk.register({

    ["<c-a>"] = { "<ESC>^", "Go to beginning of the line" },
    ["<c-s>"] = { "<ESC>$", "Go to end of line" },

    ["<s-Up>"] = { "<cmd>resize +2<cr>", "[WINDOW] Make window taller" },
    ["<s-Down>"] = { "<cmd>resize -2<cr>", "[WINDOW] Make window shorter" },
    ["<s-Left>"] = { "<cmd>vertical resize -2<cr>", "[WINDOW] Make window narrower" },
    ["<s-Right>"] = { "<cmd>vertical resize +2<cr>", "[WINDOW] Make window wider" },

    ["<c-h>"] = { "<c-w>h", "[WINDOW] Focus in left window" },
    ["<c-j>"] = { "<c-w>j", "[WINDOW] Focus in bottom window" },
    ["<c-k>"] = { "<c-w>k", "[WINDOW] Focus in top window" },
    ["<c-l>"] = { "<c-w>l", "[WINDOW] Focus in right window" },

    ["<s-l>"] = { "<cmd>bn<cr>", "[BUFFER] Go previous buffer" },
    ["<s-h>"] = { "<cmd>bp<cr>", "[BUFFER] Go next buffer" },
    ["<s-w>"] = { "<cmd>bp<bar>sp<bar>bn<bar>bd<CR>", "[BUFFER] Close current buffer" },

    ["<leader>f"] = {
        name = "[TELESCOPE]",
        f = { "<cmd>Telescope find_files hidden=false no_ignore=true<cr>", "[TELESCOPE] Find File" },
        g = { "<cmd>Telescope live_grep<cr>", "[TELESCOPE] Find File by live grep (search content inside file)" },
        b = { "<cmd>Telescope buffers<cr>", "[TELESCOPE] Find buffers" },
        dc = { "<cmd>Telescope dap configurations<cr>", "[TELESCOPE DAP] Debug configurations" },
        dv = { "<cmd>Telescope dap variables<cr>", "[TELESCOPE DAP] Varibles" },
    },
    
    ["<c-p>"] = { "<cmd>Telescope find_files hidden=true no_ignore=true<cr>", "[TELESCOPE] Find File" },

    ["<f1>"] = { "<cmd>NeoTreeShowToggle<cr>", "[NEOTREE] Toggle" },
    ["<f2>"] = { "<cmd>TroubleToggle<cr>", "[TROUBLE] Toggle" },
    ["<f3>"] = { "<cmd>AerialToggle<cr>", "[AERIAL] Toggle" },
    ["<f4>"] = { "<cmd>lua require'dapui'.toggle()<cr>", "[DAP UI] Toggle" },

    ["<leader>d"] = {
        name = "[DAP debug]",
        k = { "<cmd>DapTerminate<cr>", "[DAP] Terminate" },
        cb = { "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>",
            "[DAP] Set conditional breakpoint" },
        lb = { "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>",
            "[DAP] Set log point breakpoint" },
        r = { "<cmd>DapToggleRepl", "[DAP] Repl open" },
        l = { "<cmd>lua require'dap'.run_last()<cr>", "[DAP] Run last" },
    },
    ["<f8>"] = { "<cmd>DapToggleBreakpoint<cr>", "[DAP] Toggle breakpoint" },
    ["<f9>"] = { "<cmd>DapContinue<cr>", "[DAP] Start/continue debug" },
    ["<f10>"] = { "<cmd>lua require'dap'.step_over()<cr>", "[DAP] Step over" },
    ["<f11>"] = { "<cmd>lua require'dap'.step_into()<cr>", "[DAP] Step into" },
    ["<f12>"] = { "<cmd>lua require'dap'.step_out()<cr>", "[DAP] Step out" },

    ["<leader>c"] = {
        name = "[LSP]",
        r = { "<cmd>lua vim.lsp.buf.references()<cr>", "[LSP] Go to references" },
        t = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "[LSP] Go to declaration" },
        d = { "<cmd>lua vim.lsp.buf.definition()<cr>", "[LSP] Go to definition" },
        i = { "<cmd>lua vim.lsp.buf.implementation()<cr>", "[LSP] Go to implementation" },
        a = { "<cmd>Lspsaga code_action<cr>", "[LSP] Code actions" },
        v = { "<cmd>Lspsaga hover_doc<cr>", "[LSP] Hover" },
        h = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "[LSP] Signature help" },
        c = { "<cmd>lua vim.lsp.buf.format { async = true }<cr>", "[LSP] Format code" },
        n = { "<cmd>Lspsaga rename<cr>", "[LSP] Rename" },
    },
    ["<leader>j"] = {
        name = "[JDTLS]",
        o = { "<cmd>lua require'jdtls'.organize_imports()<cr>", "[JDLTS] Organize imports" },
    },

    ["<C-\\>"] = { "<cmd>ToggleTerm<cr>", "[TOGGLETERM] Open new terminal" },

    ["<leader>g"] = {
        name = "[GIT]",
        s = { "<cmd>Gitsigns toggle_signs<cr>", "[GIT] Toggle signs" },
        h = { "<cmd>Gitsigns preview_hunk<cr>", "[GIT] Preview hunk" },
        d = { "<cmd>Gitsigns diffthis<cr>", "[GIT] Diff" },
        n = { "<cmd>Gitsigns next_hunk<cr>", "[GIT] Next hunk" },
        p = { "<cmd>Gitsigns prev_hunk<cr>", "[GIT] Prev hunk" },
    },
}, n_opts)

local v_opts = {
    mode = "v",
    nowait = true,
    prefix = "",
    silent = true,
    noremap = true,
}
wk.register({
    ["jk"] = { "<Esc>", "Normal mode switch" },
    ["p"] = { '"_dP', "Paste without replacing what is was in clipboard" },
    ["<c-q>"] = { "iwo", "Select word backward" },
    ["<c-w>"] = { "iw", "Select word forward" },
    ["<"] = { "<gv", "[Indent] Indent left" },
    [">"] = { ">gv", "[Indent] Indent right" },
    ["<s-j>"] = { ":m '>+1<cr>gv=gv", "[MOVE] Move block down" },
    ["<s-k>"] = { ":m '<-2<cr>gv=gv", "[MOVE] Move block up" },
}, v_opts)

local i_opts = {
    mode = "i",
    prefix = "",
    silent = true,
    noremap = true,
    nowait = true,
}
wk.register({
    ["<c-a>"] = { "<ESC>I", "Go to beginning of the line" },
    ["<c-s>"] = { "<ESC>A", "Go to end of line" },
    ["<c-w>"] = { "<ESC><Space>Wi", "Forward a word" },
    ["<c-q>"] = { "<Esc>Bi", "Backward a word" },
    ["<c-e>"] = { "<ESC>dbi", "Delete a word (backward)" },
    ["<c-d>"] = { "<ESC>dwi", "Delete a word (forward)" },
}, i_opts)

wk.setup {}
