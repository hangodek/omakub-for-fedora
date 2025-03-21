cd /tmp
curl -L --output cursor.appimage https://downloader.cursor.sh/linux/x64
sudo mv cursor.appimage /opt/cursor.appimage
sudo chmod +x /opt/cursor.appimage
sudo dnf install -y fuse3

DESKTOP_FILE="/usr/share/applications/cursor.desktop"

sudo bash -c "cat > $DESKTOP_FILE" <<EOL
[Desktop Entry]
Name=Cursor
Comment=AI-powered code editor
Exec=/opt/cursor.appimage --no-sandbox
Icon=/home/$USER/.local/share/omakub/applications/icons/cursor.png
Type=Application
Categories=Development;IDE;
EOL

if [ -f "$DESKTOP_FILE" ]; then
	echo "cursor.desktop created successfully"
else
	echo "Failed to create cursor.desktop"
fi
