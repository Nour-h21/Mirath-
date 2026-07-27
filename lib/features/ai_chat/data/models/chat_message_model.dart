import '../../domain/entities/chat_message_entity.dart';
import 'source_model.dart';

class ChatMessageModel extends ChatMessageEntity {
  const ChatMessageModel({
    required super.message,
    required super.sender,
    required super.time,
    required super.sources,
  });

  factory ChatMessageModel.fromJson(Map<String, dynamic> json) {
    final role = json['role'];

    final List<dynamic> sourcesJson = json['sources'] ?? [];

    final sources = sourcesJson
        .map((source) => SourceModel.fromJson(source))
        .toList();

    return ChatMessageModel(
      message: json['message'] ?? '',
      sender: role == 'user' ? MessageSender.user : MessageSender.assistant,
      time: DateTime.now(),
      sources: sources,
    );
  }
}
