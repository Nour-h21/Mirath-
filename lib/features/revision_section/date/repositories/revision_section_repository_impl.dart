import '../../domain/entities/revision_section_entity.dart';
import '../../domain/repositories/revision_section_repository.dart';
import '../datasources/revision_section_remote_ds.dart';

class ReviewListRepositoryImpl
    implements ReviewListRepository {

  final ReviewListRemoteDs remote;

  ReviewListRepositoryImpl(this.remote);

  @override
Future<ReviewListEntity> getReviewList() {
  return remote.getReviewList();
}

@override
Future<void> deleteReviewChapter(int id) {
  return remote.deleteReviewChapter(id);
}

}