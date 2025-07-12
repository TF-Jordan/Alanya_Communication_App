import 'package:flutter/material.dart';
import '../models/status_model.dart';

class StatusTile extends StatelessWidget {
  final StatusModel status;
  final VoidCallback onTap;

  const StatusTile({
    super.key,
    required this.status,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: status.isViewed ? Colors.grey : Colors.green,
            width: 2,
          ),
        ),
        child: CircleAvatar(
          radius: 23,
          backgroundImage: NetworkImage(status.avatarUrl),
        ),
      ),
      title: Text(
        status.name,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      subtitle: Text(
        _formatTime(status.timestamp),
        style: TextStyle(
          color: Colors.grey[600],
          fontSize: 14,
        ),
      ),
      onTap: onTap,
    );
  }

  String _formatTime(DateTime timestamp) {
    final now = DateTime.now();
    final difference = now.difference(timestamp);

    if (difference.inDays > 0) {
      return 'il y a ${difference.inDays} jour${difference.inDays > 1 ? 's' : ''}';
    } else if (difference.inHours > 0) {
      return 'il y a ${difference.inHours} heure${difference.inHours > 1 ? 's' : ''}';
    } else if (difference.inMinutes > 0) {
      return 'il y a ${difference.inMinutes} minute${difference.inMinutes > 1 ? 's' : ''}';
    } else {
      return 'maintenant';
    }
  }
}