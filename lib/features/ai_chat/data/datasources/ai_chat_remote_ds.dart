import 'package:dio/dio.dart';

import '../models/chat_message_model.dart';
import '../models/chat_model.dart';
import '../models/send_question_model.dart';

abstract class AiChatRemoteDataSource {
  Future<SendQuestionModel> sendQuestion({
    required String question,
    int? chatId,
  });
    Future<List<ChatModel>> getChats();
    Future<List<ChatMessageModel>> getChatMessages({
    required int chatId,
  });
  }

  class AiChatRemoteDataSourceImpl
    implements AiChatRemoteDataSource {
  final Dio dio;

  AiChatRemoteDataSourceImpl({
    required this.dio,
  });

  @override
  Future<SendQuestionModel> sendQuestion({
    required String question,
    int? chatId,
  }) async {
    final response = await dio.post(
      'chat',
      data: {
        'question': question,
        'chat_id': chatId,
      },
    );

    return SendQuestionModel.fromJson(
      response.data['data'],
    );
  }

   @override
  Future<List<ChatModel>> getChats() async {
    final response = await dio.get(
      'getAllChats',
    );

    final List<dynamic> data =
        response.data['data'];

    return data
        .map(
          (json) => ChatModel.fromJson(json),
        )
        .toList();
  }

   @override
  Future<List<ChatMessageModel>>
      getChatMessages({
    required int chatId,
  }) async {
    final response = await dio.get(
      "getChatMessages/$chatId",
    );

    final List<dynamic> data =
        response.data['data'];

    return data
        .map(
          (json) =>
              ChatMessageModel.fromJson(json),
        )
        .toList();
  }
}

