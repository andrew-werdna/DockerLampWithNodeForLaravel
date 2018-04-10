#!/bin/bash

echo -e "\n\ninstalling nvm\n\n"

wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash

echo -e "\n\ninstalled nvm successfully\n\n"

cat ~/.bashrc
