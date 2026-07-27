import '../entities/chapter_dropdown_entity.dart';
import '../repositories/upload_summary_page_repository.dart';

class GetChaptersDropDownUseCase {
  final UploadSummaryRepository repository;

  GetChaptersDropDownUseCase(this.repository);

  Future<List<ChapterDropDownEntity>> call(int bookId) {
    return repository.getChapters(bookId);
  }
}
