import '../../domain/entities/notification_entity.dart';

class NotificationModel extends NotificationEntity {
  NotificationModel({
    required super.id,
    super.userId,
    required super.title,
    required super.body,
    required super.type,
    required super.data,
    super.isRead,
    required super.createdAt,
    required super.updatedAt,
  });

  factory NotificationModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return NotificationModel(
      id: json['id'] as int,

      userId: json['user_id'] as int?,

      title: json['title']?.toString() ?? '',

      body: json['body']?.toString() ?? '',

      type: json['type']?.toString() ?? '',

      data: json['data'] is Map
          ? Map<String, dynamic>.from(
              json['data'],
            )
          : {},

      isRead: json['is_read'] ?? false,

      createdAt: DateTime.parse(
        json['created_at'].toString(),
      ),

      updatedAt: DateTime.parse(
        json['updated_at'].toString(),
      ),
    );
  }
}