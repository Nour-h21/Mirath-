import '../../../../core/constants/urls.dart';
import '../../domain/entities/continue_reading_entity.dart';

class ContinueReadingModel extends ContinueReadingEntity {
  ContinueReadingModel({
    required super.bookName,
    required super.bookPhoto,
    required super.classification,
    required super.chapterTitle,
    required super.chapterId,
    required super.authorName,
    required super.classificationId,
    required super.bookId,
  });

  factory ContinueReadingModel.fromJson(Map<String, dynamic> json) {
    return ContinueReadingModel(
      bookName: json["book_name"],
      bookPhoto: json["book_photo"].replaceAll(
        'http://localhost:8000',
        AppUrls.localhost,
      ),
      classification: json["classification"],
      chapterTitle: json["chapter_title"],
      chapterId: json["chapter_id"],
      authorName: json["author_name"],
      classificationId: json['classification_id'],
      bookId: json['book_id'],
    );
  }
}
