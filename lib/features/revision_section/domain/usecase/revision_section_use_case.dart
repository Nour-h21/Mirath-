import '../entities/revision_section_entity.dart';
import '../repositories/revision_section_repository.dart';

class GetReviewListUseCase {
  final ReviewListRepository repository;

  GetReviewListUseCase(this.repository);

  Future<ReviewListEntity> call() {
    return repository.getReviewList();
  }
}