import '../../data/datasources/chapter_details_remote_ds.dart';
import '../../data/models/chapter_details_model.dart';
import '../../data/repositories/chapter_details_repository_impl.dart';

class ChapterDetailsRepositoryImpl implements ChapterDetailsRepository {
  final ChapterDetailsRemoteDataSource remoteDataSource;

  ChapterDetailsRepositoryImpl(this.remoteDataSource);

  @override
  Future<ChapterDetailsModel> getChapterDetails(int id) {
    return remoteDataSource.getChapterDetails(id);
  }

  
//UpdateProgress
  @override
  Future<void> updateProgress({
    required int chapterId,
    required double progress,
  }) {
    return remoteDataSource.updateProgress(
      chapterId: chapterId,
      progress: progress,
    );
  }
}
