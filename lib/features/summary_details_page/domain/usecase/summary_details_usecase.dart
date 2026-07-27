import '../entities/summary_details_entity.dart';
import '../repositories/summary_details_repository.dart';

class GetSummaryDetailsUseCase {
  final SummaryDetailsRepository repository;

  GetSummaryDetailsUseCase(this.repository);

  Future<SummaryDetailsEntity> call(int id) {
    return repository.getSummaryDetails(id);
  }
}