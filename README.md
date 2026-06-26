# 🏰 ansible-infra-lab2

> Configuration Management pour INFRA LAB — Proxmox homelab & Fedora laptop

---

## 🖥️ Fedora Laptop — Restauration après panne

> *Nouveau PC, disque cramé, install fraîche ? Tu remets tout en **1 commande**.*

### 📦 Prérequis

```bash
sudo dnf install -y git ansible-core
```

### 🚀 Restauration complète (post-crash)

```bash
# 1. Cloner le repo
git clone https://github.com/dahousse/ansible-infra-lab2.git
cd ansible-infra-lab2

# 2. Restauration complète (dotfiles + packages + navigateurs + configs)
ansible-playbook -i inventory playbook_restore_laptop.yml -k -K

# Mot de passe sudo demandé une seule fois, Ansible fait le reste.
```

### ✅ Ce qui est restauré

| Étape | Composant | Rôle |
|:---|---:|---|
| 1 | Dotfiles (.zshrc, .p10k, .gitconfig) | `dotfiles` |
| 2 | Watcher temps réel (systemd path unit) | `dotfiles` |
| 3 | **Paquets dnf** (4000+) | `laptop-restore` |
| 4 | **Flatpaks** (54) | `laptop-restore` |
| 5 | **Paquets Python** (401) | `laptop-restore` |
| 6 | **Firefox** — profils, marque-pages, mots de passe | `laptop-restore` |
| 7 | **Chromium** — historique, cookies, extensions | `laptop-restore` |
| 8 | **GNOME Shell** — dconf complet, extensions | `laptop-restore` |
| 9 | **VS Code** — settings, 74 extensions | `laptop-restore` |

> Les données viennent des backups automatiques du repo [dotfiles-fedora](https://github.com/dahousse/dotfiles-fedora) (watcher temps réel + backup quotidien).

### 📋 Playbooks disponibles

```bash
# Restaurer uniquement les dotfiles
ansible-playbook -i inventory playbook_dotfiles.yml

# Config laptop standard (dotfiles seulement)
ansible-playbook -i inventory playbook_laptop.yml

# Restauration complète après crash (dotfiles + packages + browsers + configs)
ansible-playbook -i inventory playbook_restore_laptop.yml -k -K
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
| `playbook_restore_laptop.yml` | 🖥️ **Restauration complète** post-crash (dotfiles + packages + navigateurs + configs) |
| `playbook_laptop.yml` | 🖥️ Laptop Fedora 44 (dotfiles seulement) |
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
| **v0.8.0** | **U2 — Backup restore laptop post-crash** | **2026-06-26** |
| v0.7.0 | U2 — Dotfiles Fedora 44 backup natif | 2026-06-26 |
| v0.6.0 | E1 — Ansible V2 full deployment (12/13 hosts) | 2026-06-26 |
| v0.5.0 | CI/CD pipelines finalisés | 2026-06-06 |
| v0.4.0 | I1 — Cycle TF→Ansible→Traefik | 2026-06-26 |

---

*INFRA LAB — Hasmi © 2026*
