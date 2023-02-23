echo
echo "You are about to install dotfiles."
echo "Relevant configuration files in .config will be overwitten. "
read -p "Are you Sure [Y/y]?" -n 1 -r -s
echo
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
	if [ ! -d "~/.config" ]; then
	    mkdir ~/.config >/dev/null 2>&1
	fi

    for dir in * ; do
      if [ -d "$dir" ]; then
        echo
        read -p "Do you want ${dir} files [Y/y]?" -n 1 -r -s
        echo
        if [[ $REPLY =~ ^[Yy]$ ]]
        then
            start="${PWD}/${dir}"
            end="$HOME/.config"
	    under="$end/${dir}"
		
	    if [ -d $under ]; then
	       rm -rf $under 
            fi
            ln -s $start $end 
        fi
      fi
    done
fi

