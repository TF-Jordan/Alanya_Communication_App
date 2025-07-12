import 'package:flutter/material.dart';
import '../models/call_model.dart';

class CallTile extends StatelessWidget {
  final CallModel call;
  final VoidCallback onTap;

  const CallTile({
    super.key,
    required this.call,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 25,
        backgroundImage: NetworkImage(call.avatarUrl),
      ),
      title: Text(
        call.name,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: call.callType == CallType.missed ? Colors.red : Colors.black,
        ),
      ),
      subtitle: Row(
        children: [
          Icon(
            _getCallIcon(),
            size: 16,
            color: call.callType == CallType.missed ? Colors.red : Colors.green,
          ),
          const SizedBox(width: 4),
          Text(
            _formatTime(call.timestamp),
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 14,
            ),
          ),
        ],
      ),
      trailing: IconButton(
        icon: Icon(
          call.callMode == CallMode.video ? Icons.videocam : Icons.call,
          color: Colors.green,
        ),
        onPressed: onTap,
      ),
    );
  }

  IconData _getCallIcon() {
    switch (call.callType) {
      case CallType.incoming:
        return Icons.call_received;
      case CallType.outgoing:
        return Icons.call_made;
      case CallType.missed:
        return Icons.call_received;
    }
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