import 'package:flutter/material.dart';
import '../models/contact_model.dart';

class ContactTile extends StatelessWidget {
  final ContactModel contact;
  final VoidCallback onTap;

  const ContactTile({
    super.key,
    required this.contact,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 25,
        backgroundImage: NetworkImage(contact.avatarUrl),
      ),
      title: Text(
        contact.name,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            contact.phone,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 14,
            ),
          ),
          if (contact.status != null)
            Text(
              contact.status!,
              style: TextStyle(
                color: Colors.grey[500],
                fontSize: 12,
              ),
            ),
        ],
      ),
      onTap: onTap,
    );
  }
}