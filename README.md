# 📱 Alanya — Application de messagerie mobile

> Une application de messagerie Flutter inspirée de WhatsApp, avec prise en charge des discussions privées, des groupes, des appels audio/vidéo, des statuts et bien plus.

---

## ✨ Fonctionnalités principales

- 💬 **Messagerie instantanée** : envoi de messages texte, vocaux, fichiers, images, vidéos.
- 👤 **Discussions individuelles** avec interface fluide et notifications de lecture.
- 👥 **Groupes** : création de groupes, gestion des membres, conversations groupées.
- 📞 **Appels audio & vidéo** (structure front-end prête à intégrer WebRTC).
- 📝 **Statuts temporaires** à la manière de WhatsApp (photos ou vidéos).
- 🔎 **Recherche de contacts** avec filtre dynamique.
- ⚙️ **Paramètres utilisateurs** : profil, confidentialité, apparence.
- 🧪 **Mode hors-ligne simulé** avec données factices (pas de backend encore).

---

## 📱 Captures d’écran

> *(Ajoute ici tes propres images dans un dossier `/assets/screenshots` par exemple)*

```markdown
![Home](assets/screenshots/home.png)
![Chat](assets/screenshots/chat.png)
![Groupes](assets/screenshots/groups.png)
![Profil](assets/screenshots/profile.png)


🧱 Architecture du projet
lib/
├── models/              # Modèles de données (User, Message, Group, etc.)
├── screens/             # Écrans (UI principale, chat, groupes, settings...)
│   ├── tabs/            # Onglets de l'interface (Chats, Status, Groups, Calls)
├── widgets/             # Widgets réutilisables (bulle de message, avatar, etc.)
├── main.dart            # Point d'entrée de l'application


🚀 Installation
git clone https://github.com/ton-utilisateur/alanya.git
cd alanya


Installe les dépendances :
flutter pub get


Lance l'application :
flutter run


⚙️ Principales dépendances
flutter/material – Composants UI

provider (à intégrer si logique d’état évolue)

flutter_webrtc (prévu pour appels audio/vidéo)

go_router (optionnel pour une navigation scalable)

