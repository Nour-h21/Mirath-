import '../../domain/entities/register_device_entity.dart';

class RegisterDeviceModel extends RegisterDeviceEntity {
  RegisterDeviceModel({
    required super.status,
    required super.message,
  });

  factory RegisterDeviceModel.fromJson(Map<String, dynamic> json) {
    return RegisterDeviceModel(
      status: json['status'] ?? 0,
      message: json['message'] ?? '',
    );
  }
}