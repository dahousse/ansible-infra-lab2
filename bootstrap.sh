#!/bin/bash

set -e

echo "🚀 Installing Ansible..."

sudo dnf install -y ansible

echo "📦 Running restore playbook..."

ansible-playbook -i inventory playbooks/restore.yml
