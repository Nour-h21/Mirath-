
import '../../domain/entities/book_dropdown_entity.dart';
import '../../domain/entities/chapter_dropdown_entity.dart';
import '../../domain/entities/classification_dropdown_entity.dart';
import '../../domain/repositories/upload_summary_page_repository.dart';
import '../datasources/upload_summary_page_remote_ds.dart';

class UploadSummaryRepositoryImpl implements UploadSummaryRepository {
  final UploadSummaryPageRemoteDs remote;

  UploadSummaryRepositoryImpl(this.remote);

  @override
  Future<List<ClassificationDropDownEntity>> getClassifications() async {
    return await remote.getClassifications();
  }

  @override
  Future<List<BookDropDownEntity>> getBooks(int classificationId) async {
    return await remote.getBooks(classificationId);
  }

  @override
  Future<List<ChapterDropDownEntity>> getChapters(int bookId) async {
    return await remote.getChapters(bookId);
  }

  @override
  Future<void> uploadSummary(
     int chapterId,

     String path,
  ) async {
    return await remote.uploadSummary( chapterId,path);
  }
}
