import 'package:dio/dio.dart';

import '../../../../app/di/injection_container.dart';
import '../../../../core/services/storage_service.dart';
import '../models/notification_model.dart';
import '../models/register_device_model.dart';

abstract class NotificationsRemoteDataSource {
  Future<RegisterDeviceModel> registerDevice({
    required String fcmToken,
    required String deviceType,
  });

  Future<List<NotificationModel>> getNotifications();
}

class NotificationsRemoteDataSourceImpl
    implements NotificationsRemoteDataSource {
  final Dio dio;

  NotificationsRemoteDataSourceImpl(this.dio);

  @override
  Future<RegisterDeviceModel> registerDevice({
    required String fcmToken,
    required String deviceType,
  }) async {

    print('REGISTER DEVICE fcmToken: $fcmToken');
    print('REGISTER DEVICE deviceType: $deviceType');
   try {
  final response = await dio.post(
    'saveDeviceToken',
    data: {
      'fcm_token': fcmToken,
      'device_type': deviceType,
    },
  );

  print('REGISTER DEVICE RESPONSE: ${response.data}');

  return RegisterDeviceModel.fromJson(response.data);
} on DioException catch (e) {
  print('STATUS: ${e.response?.statusCode}');
  print('DATA: ${e.response?.data}');
  print('BASE URL: ${dio.options.baseUrl}');
  rethrow;
}

    // return RegisterDeviceModel.fromJson(response.data);
  }


  @override
Future<List<NotificationModel>> getNotifications() async {
  print('🟡 GET NOTIFICATIONS DATASOURCE STARTED');

  final storage = getIt<StorageService>();

  final userId = storage.getUserId();

  print('👤 USER ID: $userId');

  if (userId == null) {
    throw Exception('User ID not found');
  }

  print(
    '🌐 REQUEST URL: getNotifications/$userId',
  );

  final response = await dio.get(
    'getNotifications/$userId',
  );

  print(
    '📥 NOTIFICATIONS RESPONSE: ${response.data}',
  );

  final List data = response.data['data'];

  return data
      .map(
        (e) => NotificationModel.fromJson(e),
      )
      .toList();
}
}