import 'package:dio/dio.dart';

import '../models/nationality_model.dart';

abstract class NationalityRemoteDs {
  Future<List<NationalityModel>> getNationalities();
}

class NationalityRemoteDsImpl implements NationalityRemoteDs {
  final Dio dio;

  NationalityRemoteDsImpl(this.dio);

  @override
  Future<List<NationalityModel>> getNationalities() async {
    final response = await dio.get(
      "getNationalities",
    );

    final List data = response.data["data"];
print(data
        .map((e) => NationalityModel.fromJson(e))
        .toList(),);
    return data
        .map((e) => NationalityModel.fromJson(e))
        .toList();
        
  }
}