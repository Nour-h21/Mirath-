import 'package:dio/dio.dart';

import '../models/summary_details_model.dart';
import '../models/summary_edit_model.dart';

abstract class SummaryDetailsRemoteDataSource {
  Future<SummaryDetailsModel> getSummaryDetails(int id);
  Future<String> editSummary({
  required int id,
  required EditSummaryModel model,
});
}

class SummaryDetailsRemoteDataSourceImpl
    implements SummaryDetailsRemoteDataSource {
  final Dio dio;

  SummaryDetailsRemoteDataSourceImpl(this.dio);

  @override
  Future<SummaryDetailsModel> getSummaryDetails(int id) async {
    final response = await dio.get(
      '/summaryDetails/$id',
      options: Options(
        headers: {
          "Authorization":
              "Bearer 5|Ze3K8bOfFlF659Ll0BNpnD4T6madFO4ii15iBUG5f1473d24",
        },
      ),
    );

    return SummaryDetailsModel.fromJson(response.data["data"]);
  }

   @override
  Future<String> editSummary({
    required int id,
    required EditSummaryModel model,
  }) async {
    final response = await dio.post(
      "/editSummary/$id",
      data: model.toJson(),
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