class ChatModel {
  final String id;
  final String name;
  final String lastMessage;
  final String avatarUrl;
  final DateTime timestamp;
  final int unreadCount;
  final bool isOnline;

  ChatModel({
    required this.id,
    required this.name,
    required this.lastMessage,
    required this.avatarUrl,
    required this.timestamp,
    this.unreadCount = 0,
    this.isOnline = false,
  });

  static List<ChatModel> generateDummyChats() {
    return [
      ChatModel(
        id: '1',
        name: 'Alice Martin',
        lastMessage: 'Salut! Comment ça va?',
        avatarUrl: 'https://i.pravatar.cc/150?img=1',
        timestamp: DateTime.now().subtract(const Duration(minutes: 5)),
        unreadCount: 2,
        isOnline: true,
      ),
      ChatModel(
        id: '2',
        name: 'Bob Dupont',
        lastMessage: 'On se voit demain?',
        avatarUrl: 'https://i.pravatar.cc/150?img=2',
        timestamp: DateTime.now().subtract(const Duration(hours: 1)),
        unreadCount: 0,
      ),
      ChatModel(
        id: '3',
        name: 'Groupe Famille',
        lastMessage: 'Maman: N\'oubliez pas le repas dimanche!',
        avatarUrl: 'https://i.pravatar.cc/150?img=3',
        timestamp: DateTime.now().subtract(const Duration(hours: 2)),
        unreadCount: 5,
      ),
    ];
  }
}