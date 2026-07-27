import '../entities/external_summary_entity.dart';
import '../repositories/my_summary_page_repository.dart';

class GetExternalSummariesUseCase {

  final MySummaryRepository repository;

  GetExternalSummariesUseCase(this.repository);

  Future<List<ExternalSummaryEntity>> call() {
    return repository.getExternalSummaries();
  }
}