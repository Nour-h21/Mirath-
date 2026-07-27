class NotificationEntity {
  final int id;
  final int? userId;
  final String title;
  final String body;
  final String type;
  final Map<String, dynamic> data;
  final bool? isRead;
  final DateTime createdAt;
  final DateTime updatedAt;

  NotificationEntity({
    required this.id,
    this.userId,
    required this.title,
    required this.body,
    required this.type,
    required this.data,
    this.isRead,
    required this.createdAt,
    required this.updatedAt,
  });
}