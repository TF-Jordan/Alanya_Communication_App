enum MessageType {
  text,
  image,
  voice,
  video,
  document,
}

class MessageModel {
  final String id;
  final String text;
  final DateTime timestamp;
  final bool isMe;
  final MessageType messageType;
  final String? imageUrl;
  final String? voiceUrl;
  final bool isRead;

  MessageModel({
    required this.id,
    required this.text,
    required this.timestamp,
    required this.isMe,
    required this.messageType,
    this.imageUrl,
    this.voiceUrl,
    this.isRead = false,
  });

  static List<MessageModel> generateDummyMessages() {
    return [
      MessageModel(
        id: '1',
        text: 'Salut! Comment ça va?',
        timestamp: DateTime.now().subtract(const Duration(minutes: 30)),
        isMe: false,
        messageType: MessageType.text,
        isRead: true,
      ),
      MessageModel(
        id: '2',
        text: 'Ça va bien, merci! Et toi?',
        timestamp: DateTime.now().subtract(const Duration(minutes: 25)),
        isMe: true,
        messageType: MessageType.text,
        isRead: true,
      ),
      MessageModel(
        id: '3',
        text: 'Parfait! Tu fais quoi ce weekend?',
        timestamp: DateTime.now().subtract(const Duration(minutes: 20)),
        isMe: false,
        messageType: MessageType.text,
        isRead: true,
      ),
      MessageModel(
        id: '4',
        text: 'J\'ai prévu d\'aller au cinéma, tu veux venir?',
        timestamp: DateTime.now().subtract(const Duration(minutes: 15)),
        isMe: true,
        messageType: MessageType.text,
        isRead: false,
      ),
    ];
  }
}