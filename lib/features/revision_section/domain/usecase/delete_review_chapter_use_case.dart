import '../repositories/revision_section_repository.dart';

class DeleteReviewChapterUseCase {
  final ReviewListRepository repository;

  DeleteReviewChapterUseCase(this.repository);

  Future<void> call(int id) {
    return repository.deleteReviewChapter(id);
  }
}