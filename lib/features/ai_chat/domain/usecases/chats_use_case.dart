import '../../data/models/chat_model.dart';
import '../repositories/ai_chat_repository.dart';

class GetChatsUseCase {
  final AiChatRepository repository;

  GetChatsUseCase({
    required this.repository,
  });

  Future<List<ChatModel>> call() {
    return repository.getChats();
  }
}