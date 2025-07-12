import 'package:flutter/material.dart';
import 'profile_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paramètres'),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage('assets/profile.jpg'),
            ),
            title: const Text('John Doe'),
            subtitle: const Text('Salut! Je suis en train d\'utiliser WhatsApp.'),
            trailing: const Icon(Icons.qr_code),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfileScreen()),
              );
            },
          ),
          const Divider(),
          _buildSettingsItem(
            context,
            Icons.key,
            'Compte',
            'Confidentialité, sécurité, changer le numéro',
          ),
          _buildSettingsItem(
            context,
            Icons.chat,
            'Discussions',
            'Thème, fonds d\'écran, historique des discussions',
          ),
          _buildSettingsItem(
            context,
            Icons.notifications,
            'Notifications',
            'Tonalité des messages, des groupes et des appels',
          ),
          _buildSettingsItem(
            context,
            Icons.data_usage,
            'Stockage et données',
            'Utilisation du réseau, téléchargement automatique',
          ),
          _buildSettingsItem(
            context,
            Icons.help,
            'Aide',
            'FAQ, nous contacter, politique de confidentialité',
          ),
          _buildSettingsItem(
            context,
            Icons.group,
            'Inviter des amis',
            '',
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsItem(
      BuildContext context,
      IconData icon,
      String title,
      String subtitle,
      ) {
    return ListTile(
      leading: Icon(icon, color: Colors.grey[600]),
      title: Text(title),
      subtitle: subtitle.isNotEmpty ? Text(subtitle) : null,
      onTap: () {
        // Navigation vers les sous-pages
      },
    );
  }
}