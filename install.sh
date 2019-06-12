#!/bin/bash
read -n 1 -p "This will replace your tmux.conf, bashrc, bash_profile, bash_aliases, profile, vim, and vimrc.\nAre you sure you want to do this?(y/N)" answer

echo -e "\n"

[ "$answer" != "y" -a "$answer" != "Y" ] && echo -e "Canceling..." && exit 1

CONFIG_PATH="~/.dotfiles"

for file in ".bashrc" ".bash_aliases" ".bash_profile" ".profile" ".vimrc" ".tmux.conf"; do
	if [ -h "$HOME/$file" ]; then
		! unlink "$HOME/$file" && echo "Afailure has occured unlinking $file. Exiting..." && exit 1
	elif [ -f  "$HOME/$file" ]; then
		! mv "$HOME/$file" "$HOME/${file}.old" && echo "A failure has occured moving $file. Exiting..." && exit 1
	fi
	! ln -s "$CONFIG_PATH/$file" "$HOME/$file" && echo "A failure has occured linking $file. Exiting..." && exit 1
done

read -n 1 -p "Do you want to in install vim-plug? If it's already present this is unnecessary. (y,N)" answer
echo -e "\n"
[ "$answer" == "y" -o "$answer" == "Y" ] && curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

if [ $(id -u) -ne 0 ]; then
	echo "This script must now be run as root to link into /etc"
	# sudo -i
	# [ $(id -u) -ne 0 ] && "Still not root. Exiting..." && exit 1
fi

echo "Finished. Exiting..." && exit 0
