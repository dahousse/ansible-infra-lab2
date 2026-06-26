# 🏰 ansible-infra-lab2

> Configuration Management pour INFRA LAB — Proxmox homelab.

## 🚀 Quick Start

```bash
# Lancer un playbook sur une machine
ansible-playbook -i inventory playbook_first_install.yml --limit cockpit
ansible-playbook -i inventory playbook_traefik_config.yml --limit cockpit
ansible-playbook -i inventory playbook_base.yml --limit cockpit

# Tester la connexion
ansible cockpit -i inventory -m ping
```

## 📋 Playbooks

| Playbook | Description |
|:---|---|
| `playbook_first_install.yml` | 🐚 Setup initial (user infra, Zsh, outils) |
| `playbook_traefik_config.yml` | 🚦 Enregistre une VM dans Traefik |
| `playbook_base.yml` | 🧰 Configuration de base (logs, sécurité) |
| `playbook_node_exporter.yml` | 📡 Node Exporter |
| `playbook_prometheus.yml` | 📈 Prometheus |
| `playbook_grafana.yml` | 📉 Grafana |
| `playbook_uptimekuma.yml` | 🛎️ Uptime Kuma |
| `playbook_backup.yml` | 💾 Backup Proxmox |
| `playbook_ollama.yml` | 🤖 Ollama |

## 🔄 Cycle TF → Ansible → Traefik

Le déploiement d'une VM se fait automatiquement via Terraform :

```
terraform apply
├─ 1. Clone template Proxmox
├─ 2. Ajoute dans inventory Ansible
├─ 3. Attend SSH
├─ 4. Lance playbook_first_install.yml
└─ 5. Lance playbook_traefik_config.yml → Traefik reload (USR1)
```

Doc complète : [`infra-lab/docs/cycle-tf-ansible-traefik.md`](https://github.com/dahousse/infra-lab/blob/main/docs/cycle-tf-ansible-traefik.md)

## ✅ CI/CD

| Workflow | Runner |
|:---|---|
| `ansible-lint.yml` | ubuntu-latest (yamllint + syntax-check) |
| `ansible-dry-run.yml` | self-hosted (--check --diff) |

## 🏷️ Versionning

Même version que les autres repos du projet.

| Tag | Goal | Date |
|:---|---:|:---|
| v0.4.0 | I1 — Cycle TF→Ansible→Traefik | 2026-06-26 |

---

*INFRA LAB — Hasmi © 2026*
