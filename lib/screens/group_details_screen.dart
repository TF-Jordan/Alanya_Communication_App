import 'package:flutter/material.dart';
import '../models/group_model.dart';

class GroupDetailsScreen extends StatelessWidget {
  final GroupModel group;

  const GroupDetailsScreen({super.key, required this.group});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Infos du groupe'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              // Modifier le groupe
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // En-tête du groupe
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(group.imageUrl),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    group.name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Créé le ${_formatDate(group.createdAt)}',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                  if (group.description != null) ...[
                    const SizedBox(height: 16),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        group.description!,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ],
              ),
            ),
            const Divider(),
            // Actions du groupe
            ListTile(
              leading: const Icon(Icons.volume_up, color: Colors.grey),
              title: const Text('Notifications'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Paramètres de notification
              },
            ),
            ListTile(
              leading: const Icon(Icons.wallpaper, color: Colors.grey),
              title: const Text('Fond d\'écran'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Changer le fond d'écran
              },
            ),
            ListTile(
              leading: const Icon(Icons.save_alt, color: Colors.grey),
              title: const Text('Enregistrer dans la galerie'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Paramètres de sauvegarde
              },
            ),
            const Divider(),
            // Membres du groupe
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${group.members.length} participant${group.members.length > 1 ? 's' : ''}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.person_add),
                    onPressed: () {
                      // Ajouter un participant
                    },
                  ),
                ],
              ),
            ),
            ...group.members.map((member) => ListTile(
              leading: CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(member.avatarUrl),
              ),
              title: Text(member.name),
              subtitle: member.isAdmin ? const Text('Admin') : null,
              trailing: member.isAdmin
                  ? const Icon(Icons.star, color: Colors.orange)
                  : null,
              onTap: () {
                // Voir le profil du membre
              },
            )),
            const Divider(),
            // Actions dangereuses
            ListTile(
              leading: const Icon(Icons.exit_to_app, color: Colors.red),
              title: const Text('Quitter le groupe', style: TextStyle(color: Colors.red)),
              onTap: () {
                _showLeaveGroupDialog(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.report, color: Colors.red),
              title: const Text('Signaler le groupe', style: TextStyle(color: Colors.red)),
              onTap: () {
                // Signaler le groupe
              },
            ),
          ],
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  void _showLeaveGroupDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Quitter le groupe'),
        content: Text('Êtes-vous sûr de vouloir quitter "${group.name}" ?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Annuler'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
              // Logique pour quitter le groupe
            },
            child: const Text('Quitter', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}