import '../repositories/my_summary_page_repository.dart';

class DeleteSummaryUseCase {

  final MySummaryRepository repository;

  DeleteSummaryUseCase(this.repository);

  Future<String> call(int id) {
    return repository.deleteSummary(id);
  }
}