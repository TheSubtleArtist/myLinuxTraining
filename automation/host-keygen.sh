#!/usr/bin/env bash

# This script generates an SSH key pair for Vagrant and starts the Vagrant environment.

set -euo pipefail

KEY_DIR="vagrant/bootstrap-keys"
KEY_FILE="${KEY_DIR}/bootstrap_id_rsa"

mkdir -p "${KEY_DIR}"

if [ ! -f "${KEY_FILE}" ]; then
  ssh-keygen -t rsa -b 2048 -f "${KEY_FILE}" -N ""
fi

cd automation/vagrant
vagrant up