# 🏰 ansible-infra-lab2

> Configuration Management pour INFRA LAB — Proxmox homelab & Fedora laptop

---

## 🖥️ Fedora Laptop — Restauration après panne

> *Nouveau PC, disque cramé, install fraîche ? Tu déploies tout en **1 commande**.*

### 📦 Prérequis

```bash
# 1. Installer Ansible sur le nouveau PC
sudo dnf install -y ansible

# 2. Cloner ce repo
git clone https://github.com/dahousse/ansible-infra-lab2.git
cd ansible-infra-lab2

# 3. Activer SSH (si pas déjà fait)
sudo systemctl enable --now sshd
```

### 🚀 Restauration complète

```bash
ansible-playbook -i inventory playbook_laptop.yml --ask-pass -k
```

*Mot de passe sudo demandé une seule fois, Ansible fait le reste.*

### ✅ Ce qui est restauré

| Fichier | Destination | Description |
|:---|---:|---|
| `.zshrc` | `~/.zshrc` | Zsh config avec Powerlevel10k |
| `.p10k.zsh` | `~/.p10k.zsh` | Powerlevel10k theme |
| `.gitconfig` | `~/.gitconfig` | Git (user, email, credential) |
| `PATH` | `~/.zshrc` | `~/.local/bin` dans le PATH |
| `~/.local/bin/` | Créé | Dossier pour binaires locaux |

### 🔄 Mettre à jour la sauvegarde

```bash
cd ~/ansible-infra-lab2
cp ~/.zshrc roles/dotfiles/files/.zshrc
cp ~/.gitconfig roles/dotfiles/files/.gitconfig
cp ~/.p10k.zsh roles/dotfiles/files/.p10k.zsh
git add roles/dotfiles/files/
git commit -m "dotfiles: mise à jour $(date +%Y-%m-%d)"
git push
```

### 📋 Menu complet

```bash
# Restaurer uniquement les dotfiles
ansible-playbook -i inventory playbook_dotfiles.yml

# Restaurer les dotfiles + config système laptop
ansible-playbook -i inventory playbook_laptop.yml
```

---

## 🔄 Cycle TF → Ansible → Traefik

```
terraform apply
├─ 1. Clone template Proxmox
├─ 2. Ajoute dans inventory Ansible
├─ 3. Attend SSH
├─ 4. Lance playbook_first_install.yml
└─ 5. Lance playbook_traefik_config.yml → Traefik reload (USR1)
```

Doc : [`infra-lab/docs/cycle-tf-ansible-traefik.md`](https://github.com/dahousse/infra-lab/blob/main/docs/cycle-tf-ansible-traefik.md)

---

## 🚀 Quick Start (serveurs)

```bash
ansible cockpit -i inventory -m ping
ansible-playbook -i inventory playbook_first_install.yml --limit cockpit
```

## 📋 Playbooks

| Playbook | Description |
|:---|---|
| `playbook_laptop.yml` | 🖥️ Laptop Fedora 44 (dotfiles + config) |
| `playbook_dotfiles.yml` | 📋 Dotfiles uniquement |
| `playbook_first_install.yml` | 🐚 Setup initial (user infra, Zsh, outils) |
| `playbook_traefik_config.yml` | 🚦 Enregistre une VM dans Traefik |
| `playbook_base.yml` | 🧰 Configuration de base |
| `playbook_node_exporter.yml` | 📡 Node Exporter |
| `playbook_prometheus.yml` | 📈 Prometheus |
| `playbook_grafana.yml` | 📉 Grafana |
| `playbook_uptimekuma.yml` | 🛎️ Uptime Kuma |
| `playbook_backup.yml` | 💾 Backup Proxmox |
| `playbook_ollama.yml` | 🤖 Ollama |

## ✅ CI/CD

| Workflow | Runner |
|:---|---|
| `ansible-lint.yml` | ubuntu-latest |
| `ansible-dry-run.yml` | self-hosted (--check --diff) |

## 🏷️ Versionning

| Tag | Goal | Date |
|:---|---:|:---|
| v0.7.0 | U2 — Dotfiles Fedora 44 backup natif | 2026-06-26 |
| v0.6.0 | E1 — Ansible V2 full deployment (12/13 hosts) | 2026-06-26 |
| v0.5.0 | CI/CD pipelines finalisés | 2026-06-06 |
| v0.4.0 | I1 — Cycle TF→Ansible→Traefik | 2026-06-26 |

---

*INFRA LAB — Hasmi © 2026*
