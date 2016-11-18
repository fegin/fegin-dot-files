#!/usr/bin/env bash

# Install private repo
echo -n "Do you have a private repo to install first? (y/n) "
read answer
if [[ "$answer" == "y" || "$answer" == "Y" ]]; then
    echo -n "What's the path? "
    read private_path
    git clone $private_path private
fi

exit 0
# Install .gitconfig
echo -n "User name for GIT:"
read git_username
echo -n "Email for GIT:"
read git_email
cp gitconfig active_gitconfig
sed -i "s/NAME/${git_username}" active_gitconfig 
sed -i "s/EMAIL/${git_email}" active_gitconfig 
ln -s active_gitconfig ~/.gitconfig

# Install .tmux.conf
ln -s tmux.conf ~/.tmux.conf

# Install ZSH
ln -s zsh/zshrc ~/.zshrc
ln -s zsh/oh-my-zsh ~/.oh-my-zsh

# Install VIM dot files
git submodule update --init
vim +PluginInstall +qall
cd ~/.vim/bundle/YouCompleteMe
./install.sh --clang-completer
cd -
cd ~/.vim/bundle/vimproc.vim
make
cd -
