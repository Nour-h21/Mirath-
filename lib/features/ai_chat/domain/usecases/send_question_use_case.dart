import '../../data/models/send_question_model.dart';
import '../repositories/ai_chat_repository.dart';

class SendQuestionUseCase {
  final AiChatRepository repository;

  SendQuestionUseCase({
    required this.repository,
  });

  Future<SendQuestionModel> call({
    required String question,
    int? chatId,
  }) {
    return repository.sendQuestion(
      question: question,
      chatId: chatId,
    );
  }
}