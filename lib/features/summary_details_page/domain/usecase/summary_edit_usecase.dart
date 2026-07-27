import '../../data/models/summary_edit_model.dart';
import '../repositories/summary_details_repository.dart';

class EditSummaryDetailsUseCase {
  final SummaryDetailsRepository repository;

  EditSummaryDetailsUseCase(this.repository);

  Future<String> call({
    required int id,
    required EditSummaryModel model,
  }) {
    return repository.editSummary(id: id, model: model);
  }
}