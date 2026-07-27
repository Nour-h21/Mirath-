import '../entities/book_dropdown_entity.dart';
import '../repositories/upload_summary_page_repository.dart';

class GetBooksDropDownUseCase {
  final UploadSummaryRepository repository;

  GetBooksDropDownUseCase(this.repository);

  Future<List<BookDropDownEntity>> call(int classificationId) {
    return repository.getBooks(classificationId);
  }
}
