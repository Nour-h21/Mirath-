import '../../data/models/chapter_details_model.dart';
import '../../data/repositories/chapter_details_repository_impl.dart';

class GetChapterDetailsUseCase {
  final ChapterDetailsRepository repository;

  GetChapterDetailsUseCase(this.repository);

  Future<ChapterDetailsModel> call(int id) {
    return repository.getChapterDetails(id);
  }
}


class UpdateProgressUseCase {
  final ChapterDetailsRepository repository;

  UpdateProgressUseCase(this.repository);

  Future<void> call({
    required int chapterId,
    required double progress,
  }) {
    return repository.updateProgress(
      chapterId: chapterId,
      progress: progress,
    );
  }
}