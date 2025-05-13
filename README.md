# 📞 Installation d'Asterisk 22.x depuis les sources

![Statut](https://img.shields.io/badge/statut-prêt%20à%20l'emploi-brightgreen)

## 🚀 Présentation

Ce script Bash automatise l'installation d'Asterisk 22.x depuis les sources sur un système Debian/Ubuntu. Il effectue les tâches suivantes :

* Vérification des privilèges root
* Mise à jour et nettoyage du système
* Téléchargement et extraction des sources Asterisk
* Installation des dépendances requises
* Compilation et installation d'Asterisk
* Configuration de base d'un PBX minimal
* Séparation des fichiers de configuration exemples
* Activation et démarrage du service systemd

## 🔧 Prérequis

Avant de lancer le script, assurez-vous d'avoir :

* Un accès root (ou sudo) sur le serveur
* Une distribution **Debian** ou **Ubuntu** à jour
* Une connexion Internet stable

## ⚙️ Installation du script

1. **Télécharger le script** :

   ```bash
   curl -O https://exemple.com/install_asterisk.sh
   ```

2. **Rendre le script exécutable** :

   ```bash
   chmod +x install_asterisk.sh
   ```

3. **Lancer l'installation** :

   ```bash
   sudo ./install_asterisk.sh
   ```

> 💡 *Le script prend en charge toutes les étapes automatiquement, y compris l'installation des dépendances.*

## 📝 Utilisation

Après l'installation :

```bash
sudo asterisk -r
```

Vous accéderez ainsi à l'interface CLI d'Asterisk. Pour quitter, tapez `exit`.

## 💡 Personnalisation

Vous pouvez adapter le script :

* Modifier la version d'Asterisk (changer l'URL du tarball)
* Ajouter des modules complémentaires (PJSIP, WebRTC, etc.)
* Intégrer des templates de configuration personnalisés
