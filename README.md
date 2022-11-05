# NVIM Configuration
    ```
git clone https://github.com/neovim/neovim.git
cd neovim
git checkout release-0.8
make CMAKE_BUILD_TYPE=Release
sudo make install

git clone https://github.com/magidc/nvim-config.git ~/.config/nvim
    
Run `nvim` and execute `:PackerInstall` command to install the plugins.<br>
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