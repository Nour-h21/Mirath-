import '../../domain/entities/external_summary_entity.dart';
import '../../domain/entities/internal_summary_entity.dart';
import '../../domain/repositories/my_summary_page_repository.dart';
import '../datasources/my_summary_page_remote_ds.dart';

class MySummaryRepositoryImpl implements MySummaryRepository {
  final MySummaryRemoteDatasource remoteDatasource;

  MySummaryRepositoryImpl(this.remoteDatasource);

  @override
  Future<List<InternalSummaryEntity>> getInternalSummaries() {
    return remoteDatasource.getInternalSummaries();
  }

  @override
  Future<List<ExternalSummaryEntity>> getExternalSummaries() {
    return remoteDatasource.getExternalSummaries();
  }

  @override
  Future<String> deleteSummary(int id) {
    return remoteDatasource.deleteSummary(id);
  }
}
