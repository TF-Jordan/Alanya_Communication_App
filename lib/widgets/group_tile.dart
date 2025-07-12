import 'package:flutter/material.dart';
import '../models/group_model.dart';

class GroupTile extends StatelessWidget {
  final GroupModel group;
  final VoidCallback onTap;
  final VoidCallback? onDetailsPressed;

  const GroupTile({
    super.key,
    required this.group,
    required this.onTap,
    this.onDetailsPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 25,
        backgroundImage: NetworkImage(group.imageUrl),
      ),
      title: Text(
        group.name,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${group.members.length} membre${group.members.length > 1 ? 's' : ''}',
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 14,
            ),
          ),
          if (group.description != null)
            Text(
              group.description!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.grey[500],
                fontSize: 12,
              ),
            ),
        ],
      ),
      trailing: onDetailsPressed != null
          ? IconButton(
        icon: const Icon(Icons.info_outline),
        onPressed: onDetailsPressed,
      )
          : null,
      onTap: onTap,
    );
  }
}