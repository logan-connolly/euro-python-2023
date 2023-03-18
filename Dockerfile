# Docker file for Neovim configuration for Python development.
#
# @author Logan Connolly

# Base Linux image.
FROM archlinux:latest

# System dependencies:
#    exa:				improved listing of files
#    fish:			improved shell experience
#    gcc:				required by treesitter
#    git:				needed to clone plugins
#    neovim:		neovim editor
#    npm:				needed to install pyright LSP
#    python:		to run the hpsort project
#    ripgrep:		required by telescope
#    starship:	better shell prompt
RUN pacman -Syy --noconfirm \
  && pacman -S --noconfirm \
	  exa \
    fish \
    gcc \
    git \
    neovim \
    npm \
    python \
    ripgrep \
		starship \
	&& rm /var/cache/pacman/pkg/*

# Set fish as default shell.
RUN chsh -s /usr/bin/fish

# Set timezone.
RUN ln -sf /usr/share/zoneinfo/Europe/Prague /etc/localtime

# Copy Neovim configuration files.
RUN mkdir -p /root/.config/nvim
COPY ./nvim/ /root/.config/nvim/

# Copy Fish configuration file
RUN mkdir -p /root/.config/fish
COPY ./config.fish /root/.config/fish/config.fish

# Copy in sample python script.
COPY ./hpsort /usr/src/hpsort

# Set working directory to source directory.
WORKDIR /usr/src/hpsort

# Set the virtual env path to path.
ENV VIRTUAL_ENV=/usr/src/hpsort/.venv
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

# Setup virtual environment.
RUN python -m venv .venv

# Install python dependencies.
RUN pip install -r requirements.in

# Initialize repository.
RUN git init .

# Avoid container exit.
CMD ["tail", "-f", "/dev/null"]
