import '../../domain/entities/chat_entity.dart';

class ChatModel extends ChatEntity {
  const ChatModel({
    required super.id,
    required super.title,
  });

  factory ChatModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return ChatModel(
      id: json['id'],
      title: json['title'] ?? '',
    );
  }
}