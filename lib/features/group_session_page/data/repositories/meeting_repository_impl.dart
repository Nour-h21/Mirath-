import '../../domain/entities/meeting_entity.dart';
import '../../domain/repositories/meeting_repository.dart';
import '../datasources/meeting_remote_ds.dart';

class MeetingRepositoryImpl implements MeetingRepository {
  final MeetingRemoteDataSource remoteDataSource;

  MeetingRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<MeetingEntity> createMeeting({
    required String title,
    required String description,
    required String type,
    String? scheduledDate,
    String? scheduledTime,
  }) async {
    return await remoteDataSource.createMeeting(
      title: title,
      description: description,
      type: type,
      scheduledDate: scheduledDate,
      scheduledTime: scheduledTime,
    );
  }

  @override
  Future<JoinMeetingEntity> joinMeeting({
    required int meetingId,
  }) async {
    return await remoteDataSource.joinMeeting(
      meetingId: meetingId,
    );
  }
}