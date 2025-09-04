# Setup Automation Project

This project automates the setup of a development environment using Ansible. It includes roles for package installation and repository cloning.

## Prerequisites

Run the installation script to set up Ansible and its dependencies:

```bash
# Make the script executable
chmod +x ansible_installation.sh

# Run the installation script
./ansible_installation.sh
```

## Setup Instructions

### 1. Install Required Project Packages

Run the packages role to install all necessary system packages:

```bash
ansible-playbook project_setup.yml --tags "packages" --ask-become-pass
```

### 2. Set Up SSH Key for GitHub
1. Copy your public key

2. Add the SSH key to your GitHub account:
   - Go to GitHub → Settings → SSH and GPG keys → New SSH key
   - Paste your public key and save

### 3. Clone Repositories

1. Go to roles/clone/vars/main.yml and update the github_repos list with your repositories.
a. Repositories: 
 - git@github.com:myorg/repo-1.git
 - git@github.com:myorg/repo-2.git


2. Run the clone role to clone your repositories:

```bash
ansible-playbook project_setup.yml --tags "clone" --ask-become-pass
```