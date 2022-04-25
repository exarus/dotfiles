upgrade() {
  omz update
  chezmoi -R apply
  source ~/.zshrc
  brew update
  brew upgrade
  fnm install --lts
  npm i -g npm corepack
  corepack enable
}
