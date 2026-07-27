import '../entities/revision_section_entity.dart';

abstract class ReviewListRepository {
  Future<ReviewListEntity> getReviewList();
  Future<void> deleteReviewChapter(int id);
}


