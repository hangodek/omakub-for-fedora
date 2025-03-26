if [ -f /etc/os-release ]; then
    . /etc/os-release
    OMAKUB_OS="$ID"
else
    echo "Error: Cannot detect Linux distribution"
    exit 1
fi

if [ "$OMAKUB_OS" = "ubuntu" ]; then
  sudo apt remove -y gh
elif [ "$OMAKUB_OS" = "fedora" ]; then
  sudo dnf remove -y gh
fi