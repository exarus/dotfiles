#!/bin/zsh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
(echo; echo 'eval "$(/usr/local/bin/brew shellenv)"') >> /Users/exarus/.zprofile
eval "$(/usr/local/bin/brew shellenv)"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
xcode-select --install
brew install bat bitwarden-cli chezmoi doctl editorconfig exa fd ffmpeg fnm fx htop gh gnupg micro pgsync \
  pinentry-mac ripgrep rsync starship teamookla/speedtest/speedtest thefuck trash yt-dlp
brew install --cask alt-tab android-file-transfer authy battle-net calibre discord docker elmedia-player fig figma \
  homebrew/cask-fonts/font-jetbrains-mono-nerd-font firefox google-chrome hstracker iterm2 jetbrains-toolbox keka \
  kekaexternalhelper kindle-previewer megasync messenger obs obsidian qbittorrent \
  raycast readdle-spark rectangle slack steam telegram ticktick tradingview visual-studio-code \
  homebrew/cask-drivers/logi-options-plus
  # balance-lock balenaetcher carbon-copy-cloner crossover lunar vlc homebrew/cask-drivers/logitech-g-hub (100% cpu issue)
# chezmoi (before all)
chezmoi init --apply git@github.com:exarus/dotfiles.git
exec zsh

open -W /usr/local/Caskroom/battle-net/latest/Battle.net-Setup.app # battle-net (interactive)
gh auth login -h github.com -p ssh # gh (interactive)
mkdir ~/MEGAsync # megasync

# google-chrome (interactive)
git clone git@github.com:iamadamdev/bypass-paywalls-chrome.git ~/Projects/utils/bypass-paywalls-chrome
open ~/Projects/utils/bypass-paywalls-chrome
# see https://github.com/iamadamdev/bypass-paywalls-chrome#installation-instructions

# keka (interactive)
open -W /Applications/KekaExternalHelper.app
brew uninstall --cask kekaexternalhelper

# logi-options-plus (interactive)
sudo open -W "$(brew info --cask logi-options-plus | sed -n 3p | cut -d ' ' -f1)/logioptionsplus_installer.app"

# fnm
fnm install --lts
npm up -g
corepack enable
corepack prepare yarn@stable --activate

# iterm2
git clone --depth 1 https://github.com/mbadolato/iTerm2-Color-Schemes.git
./iTerm2-Color-Schemes/tools/import-scheme.sh ./iTerm2-Color-Schemes/schemes/*
rm -rf ./iTerm2-Color-Schemes

# micro
micro -plugin install editorconfig
micro -plugin install wakatime
