import '../entities/internal_summary_entity.dart';
import '../repositories/my_summary_page_repository.dart';

class GetInternalSummariesUseCase {

  final MySummaryRepository repository;

  GetInternalSummariesUseCase(this.repository);

  Future<List<InternalSummaryEntity>> call() {
    return repository.getInternalSummaries();
  }
}