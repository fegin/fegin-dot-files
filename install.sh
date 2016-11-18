# Install .gitconfig
echo "User name for GIT:"
read $git_username
echo "Email for GIT:"
read $git_email
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
