upgrade() {
  omz update
  chezmoi -R apply
  source ~/.zshrc
  brew update
  brew upgrade
  brew autoremove
  fnm install --lts
  npm i -g npm corepack
  corepack enable
  corepack prepare yarn@stable --activate
}
