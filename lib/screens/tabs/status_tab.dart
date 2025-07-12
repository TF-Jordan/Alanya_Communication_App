import 'package:flutter/material.dart';
import '../../widgets/status_tile.dart';
import '../../models/status_model.dart';

class StatusTab extends StatelessWidget {
  const StatusTab({super.key});

  @override
  Widget build(BuildContext context) {
    final statuses = StatusModel.generateDummyStatuses();

    return ListView.builder(
      itemCount: statuses.length + 1,
      itemBuilder: (context, index) {
        if (index == 0) {
          return const MyStatusTile();
        }

        final status = statuses[index - 1];
        return StatusTile(
          status: status,
          onTap: () {
            // Naviguer vers la vue du statut
          },
        );
      },
    );
  }
}

class MyStatusTile extends StatelessWidget {
  const MyStatusTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Stack(
        children: [
          const CircleAvatar(
            radius: 25,
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
              child: const Icon(
                Icons.add,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ],
      ),
      title: const Text(
        'Mon statut',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: const Text('Appuyez pour ajouter une mise à jour'),
      onTap: () {
        // Action pour ajouter un statut
      },
    );
  }
}
