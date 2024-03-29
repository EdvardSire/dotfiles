FROM ubuntu:focal
ENV DEBIAN_FRONTEND=noninteractive
# LET THERE BE 4 LINES HERE
#
RUN apt update && apt install -y build-essential \
    git-core cmake unzip wget curl gettext sudo

RUN mkdir -p ~/.local_build && cd ~/.local_build && \
    git clone https://github.com/neovim/neovim && \
    cd neovim && git checkout stable && \
    make CMAKE_BUILD_TYPE=RelWithDebInfo && \
    make install -j$(nproc) -l$(nrpoc)

RUN git clone --depth 1 https://github.com/wbthomason/packer.nvim \
    ~/.local/share/nvim/site/pack/packer/start/packer.nvim

RUN cd && git clone https://github.com/EdvardSire/dotfiles.git && \
    mkdir -p ~/.config && \
    ln -s ~/dotfiles/nvim ~/.config/nvim
