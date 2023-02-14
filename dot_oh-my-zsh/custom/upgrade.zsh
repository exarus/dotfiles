upgrade() {
  omz update
  chezmoi -R apply
  source ~/.zshrc
  brew update
  brew upgrade
  brew autoremove
  fnm install --lts
  fnm alias $(node -v) default
  npm i -g npm@latest corepack@latest
  corepack enable
  corepack prepare yarn@stable --activate
}
