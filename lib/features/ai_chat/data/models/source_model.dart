import '../../domain/entities/chat_source_entity.dart';

class SourceModel extends ChatSourceEntity {
  const SourceModel({
    required super.bookId,
    required super.chapterId,
    required super.chapterTitle,
    required super.videoYoutubeUrl,
  });

  factory SourceModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return SourceModel(
      bookId: json['book_id'] ?? '',
      chapterId: json['chapter_id'] ?? '',
      chapterTitle: json['chapter_title'] ?? '',
      videoYoutubeUrl:
          json['video_youtube_url'] ?? '',
    );
  }
}