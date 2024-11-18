upgrade() {
  omz update
  chezmoi -R update
  brew update
  brew upgrade
  brew autoremove
  brew cleanup
#  volta install node npm yarn
}
