import 'package:dio/dio.dart';

import '../../domain/entities/user_points_entity.dart';
import '../models/user_points_model.dart';
import 'user_points_remote_ds.dart';

class UserPointsRemoteDataSourceImpl implements UserPointsRemoteDS {
  final Dio api;

  UserPointsRemoteDataSourceImpl(this.api);

  @override
  Future<UserPointsEntity> getUserPoints() async {
    final response = await api.get('getMyPoints');
    return UserPointsModel.fromJson(response.data["data"][0]);
  }
}
