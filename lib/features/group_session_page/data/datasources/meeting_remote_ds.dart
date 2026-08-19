import 'package:dio/dio.dart';

import '../models/meeting_model.dart';

abstract class MeetingRemoteDataSource {
  Future<MeetingModel> createMeeting({
    required String title,
    required String description,
    required String type,
    String? scheduledDate,
    String? scheduledTime,
  });
   Future<JoinMeetingModel> joinMeeting({
    required int meetingId,
  });
}



class MeetingRemoteDataSourceImpl
    implements MeetingRemoteDataSource {
  final Dio dio;

  MeetingRemoteDataSourceImpl({
    required this.dio,
  });

  @override
  Future<MeetingModel> createMeeting({
    required String title,
    required String description,
    required String type,
    String? scheduledDate,
    String? scheduledTime,
  }) async {
    final response = await dio.post(
      '/create_meet',
      data: {
        'title': title,
        'description': description,
        'type': type,
        'scheduled_date': scheduledDate,
        'scheduled_time': scheduledTime,
      },
    );

    final responseData = response.data;

    if (responseData['status'] != 1) {
      throw Exception(
        responseData['message'] ?? 'فشل إنشاء الجلسة',
      );
    }

    return MeetingModel.fromJson(
      responseData['data'],
    );
  }

  @override
  Future<JoinMeetingModel> joinMeeting({
    required int meetingId,
  }) async {
    final response = await dio.get(
      '/join_meet/$meetingId',
    );

    final responseData = response.data;

    if (responseData['status'] != 1) {
      throw Exception(
        responseData['message'] ?? 'فشل الانضمام إلى الجلسة',
      );
    }

    return JoinMeetingModel.fromJson(
      responseData['data'],
    );
  }
}