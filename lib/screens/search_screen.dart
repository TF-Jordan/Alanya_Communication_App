import 'package:flutter/material.dart';
import '../widgets/contact_tile.dart';
import '../models/contact_model.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<ContactModel> contacts = [];
  List<ContactModel> filteredContacts = [];

  @override
  void initState() {
    super.initState();
    contacts = ContactModel.generateDummyContacts();
    filteredContacts = contacts;
  }

  void _filterContacts(String query) {
    setState(() {
      filteredContacts = contacts
          .where((contact) =>
      contact.name.toLowerCase().contains(query.toLowerCase()) ||
          contact.phone.contains(query))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          onChanged: _filterContacts,
          decoration: const InputDecoration(
            hintText: 'Rechercher...',
            hintStyle: TextStyle(color: Colors.white70),
            border: InputBorder.none,
          ),
          style: const TextStyle(color: Colors.white),
          autofocus: true,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () {
              _searchController.clear();
              _filterContacts('');
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: filteredContacts.length,
        itemBuilder: (context, index) {
          final contact = filteredContacts[index];
          return ContactTile(
            contact: contact,
            onTap: () {
              // Démarrer une conversation avec ce contact
              Navigator.pop(context);
            },
          );
        },
      ),
    );
  }
}
