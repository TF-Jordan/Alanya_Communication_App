class ContactModel {
  final String id;
  final String name;
  final String phone;
  final String avatarUrl;
  final String? status;

  ContactModel({
    required this.id,
    required this.name,
    required this.phone,
    required this.avatarUrl,
    this.status,
  });

  static List<ContactModel> generateDummyContacts() {
    return [
      ContactModel(
        id: '1',
        name: 'Alice Martin',
        phone: '+33 6 12 34 56 78',
        avatarUrl: 'https://i.pravatar.cc/150?img=1',
        status: 'Disponible',

      ),
      ContactModel(
        id: '2',
        name: 'Bob Dupont',
        phone: '+33 6 98 76 54 32',
        avatarUrl: 'https://i.pravatar.cc/150?img=2',
        status: 'Occupé',

      ),
      ContactModel(
        id: '3',
        name: 'Claire Moreau',
        phone: '+33 6 11 22 33 44',
        avatarUrl: 'https://i.pravatar.cc/150?img=3',
        status: 'En ligne',
      ),
    ];
  }
}
