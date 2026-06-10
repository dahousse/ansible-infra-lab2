# 🧠 Ansible Infra Lab2 — Recovery System

Ce repository contient un système Ansible permettant de **reconstruire automatiquement un environnement Fedora de développement**.

---

# 🚀 Objectif

Restaurer une machine complète après crash :

- packages système
- shell (zsh)
- dotfiles
- AI CLI (ai)
- outils dev

---

# ⚙️ Installation rapide

```bash
git clone https://github.com/dahousse/ansible-infra-lab2.git
cd ansible-infra-lab2
chmod +x bootstrap.sh
./bootstrap.sh
