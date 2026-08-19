import '../entities/meeting_entity.dart';
import '../repositories/meeting_repository.dart';

class CreateMeetingUseCase {
  final MeetingRepository repository;

  CreateMeetingUseCase({
    required this.repository,
  });

  Future<MeetingEntity> call({
    required String title,
    required String description,
    required String type,
    String? scheduledDate,
    String? scheduledTime,
  }) async {
    return await repository.createMeeting(
      title: title,
      description: description,
      type: type,
      scheduledDate: scheduledDate,
      scheduledTime: scheduledTime,
    );
  }
}

class JoinMeetingUseCase {
  final MeetingRepository repository;

  JoinMeetingUseCase({
    required this.repository,
  });

  Future<JoinMeetingEntity> call({
    required int meetingId,
  }) async {
    return await repository.joinMeeting(
      meetingId: meetingId,
    );
  }
}