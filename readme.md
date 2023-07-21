To apply the .vimrc file execute this command in neovim:
`:e $HOME/.config/nvim/.vimrc`

To get neovim working, you also need to install packer before sourcing the packer.lua file and running PackerSync.

Best way to do this:
1. Install packer
2. mv nvim to nvim.old
3. open nvim
4. mv nvim.old to nvim
5. source the packer.lua file
6. run :PackerSync
