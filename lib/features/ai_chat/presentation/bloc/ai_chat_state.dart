import '../../data/models/chat_model.dart';
import '../../domain/entities/chat_message_entity.dart';

abstract class AiChatState {}

class AiChatInitial extends AiChatState {}

class AiChatLoading extends AiChatState {
  final List<ChatMessageEntity> messages;
  final int? chatId;

  AiChatLoading({
    required this.messages,
    required this.chatId,
  });
}

class AiChatLoaded extends AiChatState {
  final List<ChatMessageEntity> messages;
  final int? chatId;

  AiChatLoaded({
    required this.messages,
    required this.chatId,
  });
}

class AiChatError extends AiChatState {
  final String message;
  final List<ChatMessageEntity> messages;
  final int? chatId;

  AiChatError({
    required this.message,
    required this.messages,
    required this.chatId,
  });


}
  class ChatsLoading extends AiChatState {}

class ChatsLoaded extends AiChatState {
  final List<ChatModel> chats;

  ChatsLoaded({required this.chats});
}

class ChatsError extends AiChatState {
  final String message;

  ChatsError({required this.message});
}


class ChatMessagesLoading extends AiChatState {}

class ChatMessagesLoaded extends AiChatState {
  final List<ChatMessageEntity> messages;
  final int chatId;

  ChatMessagesLoaded({required this.messages, required this.chatId});
}

class ChatMessagesError extends AiChatState {
  final String message;

  ChatMessagesError({required this.message});
}
