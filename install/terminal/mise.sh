if [ "$OMAKUB_OS" = "ubuntu" ]; then
  # Install mise for managing multiple versions of languages. See https://mise.jdx.dev/
  sudo apt update -y && sudo apt install -y gpg wget curl
  sudo install -dm 755 /etc/apt/keyrings
  wget -qO - https://mise.jdx.dev/gpg-key.pub | gpg --dearmor | sudo tee /etc/apt/keyrings/mise-archive-keyring.gpg 1>/dev/null
  echo "deb [signed-by=/etc/apt/keyrings/mise-archive-keyring.gpg arch=$(dpkg --print-architecture)] https://mise.jdx.dev/deb stable main" | sudo tee /etc/apt/sources.list.d/mise.list
  sudo apt update
  sudo apt install -y mise
elif [ "$OMAKUB_OS" = "fedora" ]; then
  # Install mise for managing multiple versions of languages. See https://mise.jdx.dev/
  sudo dnf install -y gpg wget curl

  # Add the mise repository
  sudo dnf config-manager addrepo --from-repofile=https://mise.jdx.dev/rpm/mise.repo --overwrite
  sudo rpm --import https://mise.jdx.dev/gpg-key.pub

  # Install mise
  sudo dnf install -y mise
fi