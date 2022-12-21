local ok, dap = pcall(require, "dap")

if not ok then
    return
end

dap.configurations.cpp = {
    {
        name = 'Launch file',
        type = 'codelldb',
        request = 'launch',
        host = "127.0.0.1",
        port = 11000,
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/build/' .. vim.fn.expand('%:t:r'), 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
        args = {},

        -- 💀
        -- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
        --
        --    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
        --
        -- Otherwise you might get the following error:
        --
        --    Error on launch: Failed to attach to the target process
        --
        -- But you should be aware of the implications:
        -- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
        -- runInTerminal = false,
    },
}

dap.configurations.c = dap.configurations.cpp

dap.configurations.java = {
    {
        type = 'java';
        request = 'attach';
        name = "Debug (Attach) - Remote";
        hostName = "127.0.0.1";
        port = 5005;
    },
    {
        type = 'java';
        request = 'attach';
        name = "Debug (Attach) - Remote, Wildfly";
        hostName = "127.0.0.1";
        port = 8787;
    }
}

dap.configurations.lua = {
    {
        type = 'nlua',
        request = 'attach',
        name = "Attach to running Neovim instance",
    }
}

dap.adapters.codelldb = function(callback, config)
    callback(
        {
            type = "server",
            host = config.host,
            port = config.port,
            executable = {
                command = os.getenv("HOME") .. "/.local/share/nvim/mason/packages/codelldb/codelldb",
                args = { "--port", config.port },

                -- On windows you may have to uncomment this:
                -- detached = false,
            }
        })
end

dap.adapters.nlua = function(callback, config)
    callback({ type = 'server', host = config.host or "127.0.0.1", port = config.port or 8088 })
end
