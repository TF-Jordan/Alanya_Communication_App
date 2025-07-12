class StatusModel {
  final String id;
  final String name;
  final String avatarUrl;
  final DateTime timestamp;
  final bool isViewed;
  final List<String> statusUrls;

  StatusModel({
    required this.id,
    required this.name,
    required this.avatarUrl,
    required this.timestamp,
    this.isViewed = false,
    required this.statusUrls,
  });

  static List<StatusModel> generateDummyStatuses() {
    return [
      StatusModel(
        id: '1',
        name: 'Alice Martin',
        avatarUrl: 'https://i.pravatar.cc/150?img=1',
        timestamp: DateTime.now().subtract(const Duration(hours: 2)),
        isViewed: false,
        statusUrls: ['https://picsum.photos/400/600?random=1'],
      ),
      StatusModel(
        id: '2',
        name: 'Bob Dupont',
        avatarUrl: 'https://i.pravatar.cc/150?img=2',
        timestamp: DateTime.now().subtract(const Duration(hours: 5)),
        isViewed: true,
        statusUrls: ['https://picsum.photos/400/600?random=2'],
      ),
    ];
  }
}