import '../../domain/entities/chat_message_entity.dart';
import '../../domain/entities/chat_source_entity.dart';

class SendQuestionModel {
  final int chatId;
  final String answer;
  final List<ChatSourceEntity> sources;

  const SendQuestionModel({
    required this.chatId,
    required this.answer,
    required this.sources,
  });

  factory SendQuestionModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return SendQuestionModel(
      chatId: json['chat_id'],
      answer: json['answer'] ?? '',
      sources: (json['sources'] as List? ?? [])
          .map(
            (source) => ChatSourceEntity(
              bookId: source['book_id'] ?? '',
              chapterId: source['chapter_id'] ?? '',
              chapterTitle: source['chapter_title'] ?? '',
              videoYoutubeUrl:
                  source['video_youtube_url'],
            ),
          )
          .toList(),
    );
  }
}