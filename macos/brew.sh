#!/usr/bin/env sh

# Update homebrew recipes
brew update

# Install GNU core utilities (those that come with macOS are outdated)
brew install coreutils
brew install gnu-sed
brew install gnu-tar
brew install gnu-indent
brew install gnu-which

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
brew install findutils

# Install Bash 4
brew install bash

# Taps
brew tap heroku/brew
brew tap homebrew-ffmpeg/ffmpeg

# Brew Packages
brew install ack \
  certbot \
  cmake \
  curl \
  dep \
  duti \
  homebrew-ffmpeg/ffmpeg/ffmpeg --with-fdk-aac --HEAD \
  fzf \
  fd \
  ghc \
  git \
  git-delta \
  gh \
  go \
  gpg \
  graphicsmagick \
  heroku \
  imagemagick \
  inetutils \
  jasper \
  libjpeg \
  libmemcached \
  llvm \
  macvim \
  mc \
  memcached \
  mercurial \
  mmv \
  mosh \
  mysql \
  ncdu \
  ngrok \
  node \
  npm \
  p7zip \
  pkg-config \
  postgresql \
  python \
  python3 \
  rclone \
  rename \
  ripgrep \
  rsync \
  slurm \
  spark \
  sphinx \
  stow \
  the_silver_searcher \
  tmux \
  tree \
  webp \
  wget \
  xz \
  youtube-dl \
  zsh \
  zsh-autosuggestions \
  zsh-syntax-highlighting

brew cleanup
