
import '../entities/book_dropdown_entity.dart';
import '../entities/chapter_dropdown_entity.dart';
import '../entities/classification_dropdown_entity.dart';

abstract class UploadSummaryRepository {
  Future<List<ClassificationDropDownEntity>> getClassifications();

  Future<List<BookDropDownEntity>> getBooks(int classificationId);

  Future<List<ChapterDropDownEntity>> getChapters(int bookId);

  Future<void> uploadSummary( int chapterId,  String filePath);
}
