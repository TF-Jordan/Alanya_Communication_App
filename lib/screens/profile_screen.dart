import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 40),
          Center(
            child: Stack(
              children: [
                const CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage('assets/profile.jpg'),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.camera_alt, color: Colors.white),
                      onPressed: () {
                        // Changer la photo de profil
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          _buildProfileItem(
            Icons.person,
            'Nom',
            'John Doe',
            'Ce nom sera visible par vos contacts WhatsApp.',
          ),
          _buildProfileItem(
            Icons.info,
            'À propos',
            'Salut! Je suis en train d\'utiliser WhatsApp.',
            'Vous pouvez ajouter quelques mots sur vous.',
          ),
          _buildProfileItem(
            Icons.phone,
            'Téléphone',
            '+33 6 12 34 56 78',
            'Vos contacts WhatsApp verront ce numéro.',
          ),
        ],
      ),
    );
  }

  Widget _buildProfileItem(
      IconData icon,
      String title,
      String value,
      String subtitle,
      ) {
    return ListTile(
      leading: Icon(icon, color: Colors.grey[600]),
      title: Text(title),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            value,
            style: const TextStyle(fontSize: 16, color: Colors.black87),
          ),
          Text(
            subtitle,
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
      trailing: const Icon(Icons.edit, color: Colors.grey),
      onTap: () {
        // Modifier le champ
      },
    );
  }
}