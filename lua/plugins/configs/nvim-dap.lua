local ok, dap = pcall(require, "dap")

if not ok then
    return
end

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

dap.adapters.nlua = function(callback, config)
  callback({ type = 'server', host = config.host or "127.0.0.1", port = config.port or 8088 })
end

