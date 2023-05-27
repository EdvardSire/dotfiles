choice=""
echo
echo "You are about to install dotfiles."
echo "For correct installation you have to be inside the repo."
echo "Relevant configuration files in .config will be overwitten. "
read -p "Are you Sure [y]?" -s -n1  choice 
echo

if [[ $choice =~ ^[Yy]$ ]]; then
	if [ ! -d "~/.config" ]; then
    mkdir ~/.config >/dev/null 2>&1
	fi
  source_repo_path="${PWD}/"
  config_path="$HOME/.config/"

  for local_directory_name in *; do
    if [ -d "$local_directory_name" ]; then
      choice=""
      read -p "Do you want to copy ${local_directory_name} [y]?" -s -n1 choice
      echo
      if [[ $choice =~ ^[Yy]$ ]]; then
        # mv "$config_path$local_directory_name" "${config_path}old_$local_directory_name"
        # ln -s "$source_repo_path$local_directory_name" "$config_path$local_directory_name"
        echo i dont do anything
      fi
    fi
  done
fi

echo "source ~/.config/bash/bashrc" >> ~/.bashrc
