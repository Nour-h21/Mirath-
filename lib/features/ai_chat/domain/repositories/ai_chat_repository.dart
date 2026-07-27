import '../../data/models/chat_message_model.dart';
import '../../data/models/chat_model.dart';
import '../../data/models/send_question_model.dart';

abstract class AiChatRepository {
  Future<SendQuestionModel> sendQuestion({
    required String question,
    int? chatId,
  });

  Future<List<ChatModel>> getChats();

  Future<List<ChatMessageModel>>
      getChatMessages({
    required int chatId,
  });
}