if [ ! -e ~/feginconf.sh ];
then
  echo "This server is not setup yet. The configurations will be soft linked to ~."
  echo ""
  git clone https://github.com/ohmyzsh/ohmyzsh && mv ohmyzsh ~/.oh-my-zsh
  git clone https://github.com/rupa/z && mv z/z.sh ~/z.sh
  rm -rf z
  cp ~/fbcode/scripts/chienchin/work_configs/candy.zsh-theme ~/.oh-my-zsh/themes
  rm -f ~/.tmux.conf
  ln -s ./tmux.conf ~/.tmux.conf
  rm -f ~/.vimrc
  ln -s ./vim/vimrc ~/.vimrc
  rm -f ~/.zshrc
  ln -s zshrc ~/.zshrc
  rm -f ~/.gitconfig
  ln -s ./gitconfig ~/.gitconfig
  mkdir -p ~/.vim/bundles
  # shellcheck disable=SC2046
  curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
  sh installer.sh ~/.vim/bundles > /dev/null && rm installer.sh
  vim +"call dein#install()" +qall
  echo ""
  echo "FeginConf is installed"
else
  echo "This server has already setup."
fi
