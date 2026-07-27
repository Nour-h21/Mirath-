import '../../data/models/chat_message_model.dart';
import '../repositories/ai_chat_repository.dart';

class GetChatMessagesUseCase {
  final AiChatRepository repository;

  GetChatMessagesUseCase({
    required this.repository,
  });

  Future<List<ChatMessageModel>> call({
    required int chatId,
  }) {
    return repository.getChatMessages(
      chatId: chatId,
    );
  }
}