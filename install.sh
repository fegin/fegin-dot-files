#!/usr/bin/env bash

OS=`uname`
git submodule update --init

# Install private repo
echo -n "Do you have a private repo to install first? (y/n) "
read answer
if [[ "$answer" == "y" || "$answer" == "Y" ]]; then
    echo -n "What's the path? "
    read private_path
    git clone $private_path private
fi

# Install .gitconfig
echo -n "User name for GIT: "
read git_username
echo -n "Email for GIT: "
read git_email
cp gitconfig active_gitconfig
if [[ "$OS" == "Darwin" ]]; then # MAC
    back_extension='.bak'
else
    back_extension=''
fi
sed -i $back_extension "s/NAME/${git_username}/g" active_gitconfig
sed -i $back_extension "s/EMAIL/${git_email}/g" active_gitconfig
rm active_gitconfig.bak
ln -s `pwd`/active_gitconfig ~/.gitconfig

# Install .tmux.conf
ln -s `pwd`/tmux.conf ~/.tmux.conf

# Install ZSH
ln -s `pwd`/zsh/zshrc ~/.zshrc
ln -s `pwd`/zsh/oh-my-zsh ~/.oh-my-zsh

# Install VIM dot files
ln -s `pwd`/vim ~/.vim
ln -s `pwd`/vim/vimrc ~/.vimrc
vim +"call dein#install()" +qall
#cd vim
#cd ~/.vim/bundle/YouCompleteMe
#./install.sh --clang-completer
#cd -
#cd ~/.vim/bundle/vimproc.vim
#make
#cd -
