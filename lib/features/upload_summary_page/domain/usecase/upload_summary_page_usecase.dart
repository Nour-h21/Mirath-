
import '../repositories/upload_summary_page_repository.dart';

class UploadSummaryUseCase {
  final UploadSummaryRepository repository;

  UploadSummaryUseCase(this.repository);

  Future<void> call(
     int chapterId,

     String path,
  ) {
    return repository.uploadSummary(chapterId, path);
  }
}
