import '../entities/register_device_entity.dart';
import '../repositories/notifications_repository.dart';

class RegisterDeviceUseCase {
  final NotificationsRepository repository;

  RegisterDeviceUseCase(this.repository);

  Future<RegisterDeviceEntity> call({
    required String fcmToken,
    required String deviceType,
  }) {
    return repository.registerDevice(
      fcmToken: fcmToken,
      deviceType: deviceType,
    );
  }
}