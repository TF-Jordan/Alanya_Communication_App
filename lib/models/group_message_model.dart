enum GroupMessageType {
  text,
  image,
  voice,
  video,
  document,
}

class GroupMessageModel {
  final String id;
  final String senderId;
  final String senderName;
  final String content;
  final DateTime timestamp;
  final String groupId;
  final GroupMessageType messageType;
  final String? imageUrl;
  final String? voiceUrl;
  final bool isMe;

  GroupMessageModel({
    required this.id,
    required this.senderId,
    required this.senderName,
    required this.content,
    required this.timestamp,
    required this.groupId,
    required this.messageType,
    this.imageUrl,
    this.voiceUrl,
    this.isMe = false,
  });

  static List<GroupMessageModel> generateDummyGroupMessages(String groupId) {
    return [
      GroupMessageModel(
        id: 'msg1',
        senderId: '1',
        senderName: 'Alice Martin',
        content: 'Salut tout le monde !',
        timestamp: DateTime.now().subtract(const Duration(hours: 2)),
        groupId: groupId,
        messageType: GroupMessageType.text,
        isMe: false,
      ),
      GroupMessageModel(
        id: 'msg2',
        senderId: 'me',
        senderName: 'Moi',
        content: 'Salut Alice ! Comment ça va ?',
        timestamp: DateTime.now().subtract(const Duration(hours: 1, minutes: 30)),
        groupId: groupId,
        messageType: GroupMessageType.text,
        isMe: true,
      ),
      GroupMessageModel(
        id: 'msg3',
        senderId: '2',
        senderName: 'Bob Dupont',
        content: 'Bonjour à tous, j\'espère que vous allez bien !',
        timestamp: DateTime.now().subtract(const Duration(hours: 1)),
        groupId: groupId,
        messageType: GroupMessageType.text,
        isMe: false,
      ),
      GroupMessageModel(
        id: 'msg4',
        senderId: 'me',
        senderName: 'Moi',
        content: 'Parfait Bob ! On se voit bientôt ?',
        timestamp: DateTime.now().subtract(const Duration(minutes: 30)),
        groupId: groupId,
        messageType: GroupMessageType.text,
        isMe: true,
      ),
    ];
  }
}