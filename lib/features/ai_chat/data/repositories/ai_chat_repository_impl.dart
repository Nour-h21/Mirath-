import '../../domain/repositories/ai_chat_repository.dart';
import '../datasources/ai_chat_remote_ds.dart';
import '../models/chat_message_model.dart';
import '../models/chat_model.dart';
import '../models/send_question_model.dart';


class AiChatRepositoryImpl
    implements AiChatRepository {
  final AiChatRemoteDataSource remoteDataSource;

  AiChatRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<SendQuestionModel> sendQuestion({
    required String question,
    int? chatId,
  }) {
    return remoteDataSource.sendQuestion(
      question: question,
      chatId: chatId,
    );
  }

    @override
  Future<List<ChatModel>> getChats() {
    return remoteDataSource.getChats();
  }
    @override
  Future<List<ChatMessageModel>>
      getChatMessages({
    required int chatId,
  }) {
    return remoteDataSource.getChatMessages(
      chatId: chatId,
    );
  }
}