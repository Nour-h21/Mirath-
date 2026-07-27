import '../entities/internal_summary_entity.dart';
import '../entities/external_summary_entity.dart';

abstract class MySummaryRepository {
  Future<List<InternalSummaryEntity>> getInternalSummaries();

  Future<List<ExternalSummaryEntity>> getExternalSummaries();

  Future<String> deleteSummary(int id);
}
