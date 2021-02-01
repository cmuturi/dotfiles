#!/bin/sh

#   #   #   #   #   #   #   #   #   #   #   #   #   #   
#
#           Things to do for new setup:
#
#   - zsh should be installed
         #sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
#   - nvim should be installed
         #brew install neovim       
#   - Tmux should be installed
#   - Install latest Universal Ctags
         #brew install --HEAD universal-ctags/universal-ctags/universal-ctags
#        Link: https://github.com/universal-ctags/ctags
#   - Rg to be installed
         #brew install ripgrep
#   - Bat to be installed
         #brew install bat    
#   *Pip3 in $PATH should installs Autopep8, flake8, yamllint
#       pylint, ansible-lint, ipython in case needed
#
#   #   #   #   #   #   #   #   #   #   #   #   #   # 

echo ""
echo "============= Dotfiles ============="
echo "" 

mkdir -p ~/.dotfiles_bak
mkdir -p ~/.vim/undodir
mkdir -p ~/.config/nvim

echo ""
echo "*** Backing up existing dotfiles"
echo "" 

cp ~/.tmux.conf ~/.dotfiles_bak
unlink ~/.tmux.conf 
cp ~/.vimrc ~/.dotfiles_bak
unlink ~/.vimrc
cp ~/.zshrc ~/.dotfiles_bak
unlink ~/.zshrc
cp ~/.config/nvim/init.vim ~/.dotfiles_bak
unlink ~/.config/nvim/init.vim
cp ~/.config/nvim/coc-settings.json ~/.dotfiles_bak
unlink ~/.config/nvim/coc-settings.json

echo ""
echo "*** Finished backing up"
echo "" 

echo ""
echo "============= Plugins ============="
echo "" 

 
export ZSH_CUSTOM=$HOME/.oh-my-zsh/custom
export SHELL=/bin/zsh

# Install custom themes
git clone https://github.com/art049/powerlevel420k.git $ZSH_CUSTOM/themes/powerlevel420k
curl -l https://raw.githubusercontent.com/AmrMKayid/KayidmacOS/master/kayid.zsh-theme -o \
    $ZSH_CUSTOM/themes/kayid.zsh-theme
curl -l https://raw.githubusercontent.com/dannynimmo/punctual-zsh-theme/master/punctual.zsh-theme -o \
    $ZSH_CUSTOM/themes/punctual.zsh-theme

# autojump
git clone git://github.com/wting/autojump.git $ZSH_CUSTOM/plugins/autojump 
cd  $ZSH_CUSTOM/plugins/autojump && ./uninstall.py && ./install.py
cd -

# zsh_autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
 
# zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

# k (directory details)
git clone https://github.com/supercrabtree/k $ZSH_CUSTOM/plugins/k

# fuzzy finder
git clone --depth 1 https://github.com/junegunn/fzf.git $ZSH_CUSTOM/plugins/fzf
cd $ZSH_CUSTOM/plugins/fzf && ./install
cd ~
 


echo ""
echo "*** Copying latest dotfiles"
echo "" 

ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/init.vim ~/.config/nvim/init.vim
ln -sf ~/dotfiles/coc-settings.json ~/.config/nvim/coc-settings.json

echo ""
echo "*** dotfiles are the latest now!"
echo "" 

# Install Vim Plug 
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install nodejs (for coc.nvim)
curl -sL install-node.now.sh/lts | bash

# Install Vundle PlugIns
echo | echo | vim +PlugInstall +CocInstall coc-python +qall
echo | echo | nvim +PlugInstall +CocInstall coc-python +qall

# Set ZSH to be default shell
chsh -s /bin/zsh

echo ""
echo "*** Finished. Please kill the terminal to reload config."
