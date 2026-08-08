import 'package:dio/dio.dart';

import '../models/home_model.dart';

abstract class HomeRemoteDataSource {
  Future<HomeModel> getHome();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final Dio dio;

  HomeRemoteDataSourceImpl(this.dio);

  @override
  Future<HomeModel> getHome() async {
    final response = await dio.get('getHome');

    return HomeModel.fromJson(response.data["data"]);
  }
}