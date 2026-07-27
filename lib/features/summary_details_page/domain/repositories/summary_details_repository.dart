import '../../data/models/summary_edit_model.dart';
import '../entities/summary_details_entity.dart';

abstract class SummaryDetailsRepository {
  Future<SummaryDetailsEntity> getSummaryDetails(int id);
 
 Future<String> editSummary({
  required int id,
  required EditSummaryModel model,
});
}