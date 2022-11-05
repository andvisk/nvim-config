# NVIM Configuration<br>
```

Linux {
	git clone https://github.com/neovim/neovim.git
	cd neovim
	git checkout release-0.8
	make CMAKE_BUILD_TYPE=Release
	sudo make install
	
	git clone https://github.com/andvisk/nvim-config.git ~/.config/nvim
}

Windows {
	Run as administrator powershell
	Install choco: Installing Chocolatey - in powershell enter:

	Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

	choco install neovim
	
	choco install mingw
	
	choco install wget
	
	cd ~
	
	git clone https://github.com/andvisk/nvim-config.git AppData\Local\nvim
	
}
    
Run `nvim` and execute `:PackerInstall` command to install the plugins.
Exit 'nvim' and execute again `:PackerInstall` command
`:TSUpdate`
`:MasonInstall jdtls java-debug-adapter java-test lua-language-server`


Depending on OS -> ~/.config/nvim/lua/lsp/configs/jdtls.lua 
	find line: '-configuration', LSP_ROOT_PATH .. '/jdtls/config_mac'
								     ^^^
								     Change to one of `linux`, `win` or `mac`

Custom mappings -> ~/.config/nvim/lua/mappings.lua

DAP config -> ~/.config/nvim/lua/plugins/configs/nvim-dap.lua

Neovim debugging -> https://github.com/jbyuki/one-small-step-for-vimkind/blob/main/doc/osv.txt
```
