import 'package:dio/dio.dart';

import '../models/external_summary_model.dart';
import '../models/internal_summary_model.dart';

abstract class MySummaryRemoteDatasource {
  Future<List<InternalSummaryModel>> getInternalSummaries();

  Future<List<ExternalSummaryModel>> getExternalSummaries();

  Future<String> deleteSummary(int id);
}

class MySummaryRemoteDatasourceImpl implements MySummaryRemoteDatasource {
  final Dio dio;

  MySummaryRemoteDatasourceImpl(this.dio);

  @override
  Future<List<InternalSummaryModel>> getInternalSummaries() async {
    final response = await dio.get(
      '/allCreatedSummary',
      options: Options(
        headers: {
          "Authorization":
              "Bearer 5|Ze3K8bOfFlF659Ll0BNpnD4T6madFO4ii15iBUG5f1473d24",
        },
      ),
    );

    return (response.data["data"] as List)
        .map((e) => InternalSummaryModel.fromJson(e))
        .toList();
  }

  @override
  Future<List<ExternalSummaryModel>> getExternalSummaries() async {
    final response = await dio.get(
      '/allUploadedSummary',
      options: Options(
        headers: {
          "Authorization":
              "Bearer 5|Ze3K8bOfFlF659Ll0BNpnD4T6madFO4ii15iBUG5f1473d24",
        },
      ),
    );

    return (response.data["data"] as List)
        .map((e) => ExternalSummaryModel.fromJson(e))
        .toList();
  }

  @override
  Future<String> deleteSummary(int id) async {
    final response = await dio.get(
      '/deleteSummary/$id',
      options: Options(
        headers: {
          "Authorization":
              "Bearer 5|Ze3K8bOfFlF659Ll0BNpnD4T6madFO4ii15iBUG5f1473d24",
        },
      ),
    );

    return response.data["message"];
  }
}
