# 🏰 ansible-infra-lab2

**Laboratoire Ansible pour mon homelab.**

Ce dépôt contient l'ensemble des playbooks, rôles et configurations Ansible pour provisionner et maintenir mon infrastructure sur Proxmox.

---

## 🗺️ Architecture du dépôt
ansible-infra-lab2/
├── playbooks/ # Playbooks individuels
├── group_vars/ # Variables par groupe d'inventaire
├── roles/ # Rôles Ansible réutilisables
├── inventory # Inventaire des machines
├── site.yml # Playbook principal d'orchestration
└── traefik/ # Configuration Traefik

text

---

## 🚀 Services Déployés

| Service | URL | Statut |
|---------|-----|--------|
| Traefik | `https://traefik.mysmihome.duckdns.org` | ✅ OK |
| Dashy | `https://dashy.mysmihome.duckdns.org` | ✅ OK |
| AdGuard Home | `https://adguard.mysmihome.duckdns.org` | ✅ OK |
| Home Assistant | `https://homeassistant.mysmihome.duckdns.org` | ✅ OK |
| Nextcloud | `https://cloud.mysmihome.duckdns.org` | ✅ OK |
| Proxmox | `https://homelab.mysmihome.duckdns.org` | ✅ OK |
| Portainer | `https://portainer.mysmihome.duckdns.org` | ✅ OK |
| Uptime Kuma | `https://uptime.mysmihome.duckdns.org` | ✅ OK |
| Prometheus | `http://192.168.1.36:9090` | ✅ OK |
| Grafana | `https://grafana.mysmihome.duckdns.org` | ✅ OK |

---

## 📋 Playbooks Ansible

| Playbook | Description |
|----------|-------------|
| `playbook_first_install.yml` | 🐚 Configuration universelle (Zsh, Oh My Zsh, outils, compte infra) |
| `playbook_base.yml` | 🧰 Configuration de base (outils, logs, sécurité) |
| `playbook_node_exporter.yml` | 📡 Déploiement de Node Exporter |
| `playbook_prometheus.yml` | 📈 Installation de Prometheus |
| `playbook_grafana.yml` | 📉 Installation de Grafana |
| `playbook_nextcloud.yml` | ☁️ Installation de Nextcloud |
| `playbook_uptimekuma.yml` | 🛎️ Déploiement d'Uptime Kuma |
| `playbook_glances.yml` | 🔍 Déploiement de Glances |
| `playbook_backup.yml` | 💾 Sauvegarde Proxmox via API |
| `playbook_traefik_config.yml` | 🚦 Déploiement de la configuration Traefik |
| `playbook_pull.yml` | 🧲 Amorce pour `ansible-pull` |
| `playbook_ollama.yml` | 🤖 Déploiement d'Ollama |

---

## 🧭 Guide de Poche Ansible

### 🚀 Commandes de Base

- **Lancer un playbook sur toutes les machines**
  ```bash
  ansible-playbook -i inventory site.yml
Lancer un playbook spécifique

bash
ansible-playbook -i inventory playbook_first_install.yml
ansible-playbook -i inventory playbook_base.yml
Vérifier la syntaxe d'un playbook sans l'exécuter

bash
ansible-playbook -i inventory playbook_base.yml --syntax-check
Simuler l'exécution d'un playbook (dry-run)

bash
ansible-playbook -i inventory playbook_base.yml --check
🎯 Cibler une Seule Machine
Lancer un playbook sur une machine spécifique

bash
ansible-playbook -i inventory playbook_first_install.yml --limit cockpit
ansible-playbook -i inventory playbook_base.yml --limit traefik
Exécuter une commande ad-hoc sur une machine

bash
ansible cockpit -i inventory -m ping
ansible traefik -i inventory -m shell -a "uptime"
🛠️ Commandes Utiles
Rafraîchir le cache APT d'une machine

bash
ansible traefik -i inventory -m apt -a "update_cache=yes"
Redémarrer un service sur une machine

bash
ansible traefik -i inventory -m systemd -a "name=nginx state=restarted"
Vérifier l'espace disque de toutes les machines

bash
ansible all -i inventory -m shell -a "df -h /"
Lister toutes les machines de l'inventaire

bash
ansible-inventory -i inventory --list
🔧 Maintenance
Sauvegarde du code : un script cron pousse le dépôt chaque soir à 22h.

Sauvegarde des VMs : playbook playbook_backup.yml.

Supervision : Uptime Kuma surveille tous les services en continu.

👤 Auteur
Hasmi - Passionné d'infrastructure et d'automatisation.
