# echo
# echo "What platform are you configuring?"
# echo "1) macOS"
# echo "2) unix"
# read -p "Enter [1/2] for setup else [Q/q] for exit" -n 1 -r -s 
# echo
# if [[ $REPLY =~ ^[Qq]$ ]]
# then
# 	exit 0 
# fi

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
	    echo $end
		
	    if [ -d $under ]; then
	       rm -rf $under 
            fi
            ln -s $start $end 
        fi
      fi
    done
fi

