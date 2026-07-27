import '../entities/classification_dropdown_entity.dart';
import '../repositories/upload_summary_page_repository.dart';

class GetClassificationsDropDownUseCase {
  final UploadSummaryRepository repository;

  GetClassificationsDropDownUseCase(this.repository);

  Future<List<ClassificationDropDownEntity>> call() {
    return repository.getClassifications();
  }
}
