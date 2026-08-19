import '../entities/meeting_entity.dart';

abstract class MeetingRepository {
  Future<MeetingEntity> createMeeting({
    required String title,
    required String description,
    required String type,
    String? scheduledDate,
    String? scheduledTime,
  });

  Future<JoinMeetingEntity> joinMeeting({
    required int meetingId,
  });
}