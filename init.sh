#!/bin/bash

# Download and install resticprofile
echo "Downloading resticprofile..."
wget -O /tmp/resticprofile.zip https://github.com/creativeprojects/resticprofile/releases/download/v0.31.0/resticprofile_0.31.0_linux_amd64.tar.gz
tar -xzf /tmp/resticprofile.zip -C /tmp/
sudo mv /tmp/resticprofile /usr/local/bin/
sudo chmod +x /usr/local/bin/resticprofile

# Download and install restic
echo "Downloading restic..."
wget -O /tmp/restic.bz2 https://github.com/restic/restic/releases/download/v0.18.0/restic_0.18.0_linux_amd64.bz2
bzip2 -d /tmp/restic.bz2
sudo mv /tmp/restic /usr/local/bin/
sudo chmod +x /usr/local/bin/restic

# Clean up temporary files
rm -f /tmp/resticprofile.zip /tmp/restic.bz2

echo "Installation completed successfully!"

# Generate key if it doesn't exist
if [ ! -f "local.key" ]; then
    echo "Generating encryption key..."
    resticprofile generate --random-key 36 > local.key
    echo "Key generated and saved to local.key"
fi
