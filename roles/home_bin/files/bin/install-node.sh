#!/usr/bin/env bash
# WARNING: This file is managed by Ansible.

VER=${1:-16.10.0}
DEST_DIR=/var/lib/node
DL=https://nodejs.org/dist/v${VER}/node-v${VER}-linux-x64.tar.xz
EXTRACTED_FOLDER=${DEST_DIR}/node-v${VER}-linux-x64

if [[ ! -d "${DEST_DIR}" ]]; then
    sudo mkdir -p ${DEST_DIR}
fi

if [[ ! -d "${EXTRACTED_FOLDER}" ]]; then
    echo "Downloading version..."
    wget -O /tmp/node.tar.xz ${DL}

    if [[ $? -ne 0 ]]; then
        echo "Error while downloading release"
        exit 1
    fi
    sudo tar -xf /tmp/node.tar.xz -C ${DEST_DIR} --no-same-owner
else
    echo "${VER} already downloaded"
fi

echo "Linking ${DEST_DIR}/current to ${EXTRACTED_FOLDER}"
[[ -L ${DEST_DIR}/current ]] && sudo unlink ${DEST_DIR}/current
sudo ln -fs ${EXTRACTED_FOLDER} ${DEST_DIR}/current

if [[ ! -f "${EXTRACTED_FOLDER}/bin/yarn" ]]; then
    echo "Installing yarn"
    sudo PATH=${EXTRACTED_FOLDER}/bin:$PATH ${EXTRACTED_FOLDER}/bin/npm install -g yarn
fi

echo
echo "Installation complete"
echo "... add ${DEST_DIR}/current/bin to your PATH"
