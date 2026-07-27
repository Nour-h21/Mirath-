abstract class AiChatEvent {}

class SendQuestionEvent extends AiChatEvent {
  final String question;

  SendQuestionEvent({
    required this.question,
  });
}

class StartNewChatEvent extends AiChatEvent {}

class GetChatsEvent extends AiChatEvent {}

class GetChatMessagesEvent extends AiChatEvent {}

class OpenConversationEvent extends AiChatEvent {
  final int conversationId;

  OpenConversationEvent({required this.conversationId});
}
