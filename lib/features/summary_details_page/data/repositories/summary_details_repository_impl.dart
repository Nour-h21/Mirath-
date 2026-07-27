import '../../domain/entities/summary_details_entity.dart';
import '../../domain/repositories/summary_details_repository.dart';
import '../datasources/summary_details_remote_ds.dart';
import '../models/summary_edit_model.dart';

class SummaryDetailsRepositoryImpl
    implements SummaryDetailsRepository {
  final SummaryDetailsRemoteDataSource remoteDataSource;

  SummaryDetailsRepositoryImpl(this.remoteDataSource);

  @override
  Future<SummaryDetailsEntity> getSummaryDetails(int id) {
    return remoteDataSource.getSummaryDetails(id);
  }
 @override
  Future<String> editSummary({
    required int id,
    required EditSummaryModel model,
  }) {
    return remoteDataSource.editSummary(id: id, model: model);
  }
}