#!/usr/bin/env bash
set -e

echo "🔍 Detecting OS..."

OS="$(uname -s)"

install_mac() {
  echo "macOS detected"


  if ! command -v brew &> /dev/null; then
    echo "🍺 Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> "$HOME/.zprofile"
    eval "$(/opt/homebrew/bin/brew shellenv)"
  fi


  if ! command -v python3 &> /dev/null; then
    echo "⚙️ Installing Python3..."
    brew install python
  fi

 
  if ! command -v pipx &> /dev/null; then
    echo "📦 Installing pipx..."
    brew install pipx
    pipx ensurepath
  fi

  if ! command -v git &> /dev/null; then
    echo "⚙️ Installing Git..."
    brew install git
  fi
}

install_linux() {
  echo "🐧 Linux/WSL2 detected"
  sudo apt update
  if ! command -v python3 &> /dev/null; then
    echo "⚙️ Installing Python3..."
    sudo apt install -y python3 python3-pip pipx
    pipx ensurepath
  fi

  if ! command -v git &> /dev/null; then
    echo "⚙️ Installing Git..."
    sudo apt install -y git
  fi

  if ! command -v pipx &> /dev/null; then
    echo "📦 Installing pipx..."
    sudo apt install -y pipx
    pipx ensurepath
  fi
}

install_ansible() {
  if ! command -v ansible &> /dev/null; then
    echo "⚙️ Installing Ansible with pipx..."
    pipx install ansible-core
    pipx inject ansible-core ansible
  else
    echo "✅ Ansible already installed"
  fi
}

install_ansible
echo "🎉 All done!"
ansible --version