import '../../data/models/chapter_details_model.dart';

abstract class ChapterDetailsRepository {

  Future<ChapterDetailsModel> getChapterDetails(int id);
  
//UpdateProgress
  Future<void> updateProgress({
    required int chapterId,
    required double progress,
  });
}
