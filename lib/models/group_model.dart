class GroupModel {
  final String groupId;
  final String name;
  final String imageUrl;
  final List<GroupMember> members;
  final DateTime createdAt;
  final String? description;

  GroupModel({
    required this.groupId,
    required this.name,
    required this.imageUrl,
    required this.members,
    required this.createdAt,
    this.description,
  });

  static List<GroupModel> generateDummyGroups() {
    return [
      GroupModel(
        groupId: 'group1',
        name: 'Famille',
        imageUrl: 'https://i.pravatar.cc/150?img=10',
        members: [
          GroupMember(id: '1', name: 'Alice Martin', avatarUrl: 'https://i.pravatar.cc/150?img=1'),
          GroupMember(id: '2', name: 'Bob Dupont', avatarUrl: 'https://i.pravatar.cc/150?img=2'),
          GroupMember(id: '3', name: 'Claire Moreau', avatarUrl: 'https://i.pravatar.cc/150?img=3'),
        ],
        createdAt: DateTime.now().subtract(const Duration(days: 30)),
        description: 'Groupe de famille',
      ),
      GroupModel(
        groupId: 'group2',
        name: 'Équipe Projet',
        imageUrl: 'https://i.pravatar.cc/150?img=11',
        members: [
          GroupMember(id: '4', name: 'David Lambert', avatarUrl: 'https://i.pravatar.cc/150?img=4'),
          GroupMember(id: '5', name: 'Emma Rousseau', avatarUrl: 'https://i.pravatar.cc/150?img=5'),
        ],
        createdAt: DateTime.now().subtract(const Duration(days: 15)),
        description: 'Équipe de développement',
      ),
      GroupModel(
        groupId: 'group3',
        name: 'Amis du Lycée',
        imageUrl: 'https://i.pravatar.cc/150?img=12',
        members: [
          GroupMember(id: '6', name: 'Felix Bernard', avatarUrl: 'https://i.pravatar.cc/150?img=6'),
          GroupMember(id: '7', name: 'Gabrielle Petit', avatarUrl: 'https://i.pravatar.cc/150?img=7'),
          GroupMember(id: '8', name: 'Hugo Roux', avatarUrl: 'https://i.pravatar.cc/150?img=8'),
        ],
        createdAt: DateTime.now().subtract(const Duration(days: 7)),
        description: 'Groupe des anciens du lycée',
      ),
    ];
  }
}

class GroupMember {
  final String id;
  final String name;
  final String avatarUrl;
  final bool isAdmin;

  GroupMember({
    required this.id,
    required this.name,
    required this.avatarUrl,
    this.isAdmin = false,
  });
}