echo
echo "You are about to install dotfiles."
echo "For correct installation you have to be inside the repo."
echo "Relevant configuration files in .config will be overwitten. "
read -p "Are you Sure [y]?" -n 1 -r -s
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
	if [ ! -d "~/.config" ]; then
    mkdir ~/.config >/dev/null 2>&1
	fi
  source_repo_path="${PWD}"

  for local_directory_name in *; do
    cd ~/.config
    if [ -d "$local_directory_name" ]; then
      read -p "Do you want to copy ${local_directory_name} [y]?" -n 1 -r -s
      echo
      if [[ $REPLY =~ ^[Yy]$ ]]; then
        # ln -s "$source_repo_path/$local_directory_name" .
        echo i dont do anything
      fi
    fi
  done
fi

echo "source ~/.config/bash/bashrc" >> ~/.bashrc
