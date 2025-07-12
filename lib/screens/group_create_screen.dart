// screens/group_create_screen.dart
import 'package:flutter/material.dart';
import '../widgets/contact_tile.dart';
import '../models/contact_model.dart';

class GroupCreateScreen extends StatefulWidget {
  const GroupCreateScreen({super.key});

  @override
  State<GroupCreateScreen> createState() => _GroupCreateScreenState();
}

class _GroupCreateScreenState extends State<GroupCreateScreen> {
  final List<ContactModel> _selectedContacts = [];
  final List<ContactModel> _contacts = ContactModel.generateDummyContacts();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Nouveau groupe'),
            Text(
              'Ajouter des participants',
              style: TextStyle(
                fontSize: 12,
                color: Colors.white.withOpacity(0.7),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: _selectedContacts.isEmpty
                ? null
                : () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => GroupInfoScreen(
                    selectedContacts: _selectedContacts,
                  ),
                ),
              );
            },
            child: Text(
              'SUIVANT',
              style: TextStyle(
                color: _selectedContacts.isEmpty
                    ? Colors.white.withOpacity(0.5)
                    : Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          if (_selectedContacts.isNotEmpty)
            Container(
              height: 90,
              padding: const EdgeInsets.all(8),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _selectedContacts.length,
                itemBuilder: (context, index) {
                  final contact = _selectedContacts[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            CircleAvatar(
                              radius: 25,
                              backgroundImage: NetworkImage(contact.avatarUrl),
                            ),
                            Positioned(
                              top: -5,
                              right: -5,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _selectedContacts.remove(contact);
                                  });
                                },
                                child: Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.red,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.close,
                                    color: Colors.white,
                                    size: 16,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          contact.name.split(' ')[0],
                          style: const TextStyle(fontSize: 12),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          const Divider(height: 1),
          Expanded(
            child: ListView.builder(
              itemCount: _contacts.length,
              itemBuilder: (context, index) {
                final contact = _contacts[index];
                final isSelected = _selectedContacts.contains(contact);

                return ContactTile(
                  contact: contact,
                  onTap: () {
                    setState(() {
                      if (isSelected) {
                        _selectedContacts.remove(contact);
                      } else {
                        _selectedContacts.add(contact);
                      }
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// screens/group_info_screen.dart
class GroupInfoScreen extends StatefulWidget {
  final List<ContactModel> selectedContacts;

  const GroupInfoScreen({super.key, required this.selectedContacts});

  @override
  State<GroupInfoScreen> createState() => _GroupInfoScreenState();
}

class _GroupInfoScreenState extends State<GroupInfoScreen> {
  final TextEditingController _groupNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nouveau groupe'),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () {
              print("Logique de creation de groupe dans group_Info_Screen ligne 26");
              Navigator.popUntil(context, (route) => route.isFirst);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Stack(
                  children: [
                    const CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.grey,
                      child: Icon(
                        Icons.group,
                        size: 40,
                        color: Colors.white,
                      ),
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
                          Icons.camera_alt,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    controller: _groupNameController,
                    decoration: const InputDecoration(
                      hintText: 'Nom du groupe',
                      border: UnderlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Text(
                  'Participants: ${widget.selectedContacts.length}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.selectedContacts.length,
              itemBuilder: (context, index) {
                final contact = widget.selectedContacts[index];
                return ContactTile(
                  contact: contact,
                  onTap: () {},
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}