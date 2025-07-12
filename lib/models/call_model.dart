enum CallType {
  incoming,
  outgoing,
  missed,
}

enum CallMode {
  audio,
  video,
}

class CallModel {
  final String id;
  final String name;
  final String avatarUrl;
  final DateTime timestamp;
  final CallType callType;
  final CallMode callMode;

  CallModel({
    required this.id,
    required this.name,
    required this.avatarUrl,
    required this.timestamp,
    required this.callType,
    required this.callMode,
  });

  static List<CallModel> generateDummyCalls() {
    return [
      CallModel(
        id: '1',
        name: 'Alice Martin',
        avatarUrl: 'https://i.pravatar.cc/150?img=1',
        timestamp: DateTime.now().subtract(const Duration(hours: 1)),
        callType: CallType.incoming,
        callMode: CallMode.video,
      ),
      CallModel(
        id: '2',
        name: 'Bob Dupont',
        avatarUrl: 'https://i.pravatar.cc/150?img=2',
        timestamp: DateTime.now().subtract(const Duration(hours: 3)),
        callType: CallType.outgoing,
        callMode: CallMode.audio,
      ),
      CallModel(
        id: '3',
        name: 'Maman',
        avatarUrl: 'https://i.pravatar.cc/150?img=3',
        timestamp: DateTime.now().subtract(const Duration(days: 1)),
        callType: CallType.missed,
        callMode: CallMode.audio,
      ),
    ];
  }
}