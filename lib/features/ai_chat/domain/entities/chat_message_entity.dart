import 'chat_source_entity.dart';

enum MessageSender {
  user,
  assistant,
}

class ChatMessageEntity {
  final String message;
  final MessageSender sender;
  final DateTime time;
  final List<ChatSourceEntity> sources;

  const ChatMessageEntity({
    required this.message,
    required this.sender,
    required this.time,
    this.sources = const [],
  });
}