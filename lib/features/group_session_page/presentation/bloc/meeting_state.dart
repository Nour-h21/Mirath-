import '../../domain/entities/meeting_entity.dart';

abstract class MeetingState {}

class MeetingInitial extends MeetingState {}

class MeetingLoading extends MeetingState {}

class MeetingSuccess extends MeetingState {
  final MeetingEntity meeting;

  MeetingSuccess(this.meeting);
}

class JoinMeetingSuccess extends MeetingState {
  final JoinMeetingEntity meeting;

  JoinMeetingSuccess(this.meeting);
}

class MeetingFailure extends MeetingState {
  final String message;

  MeetingFailure(this.message);
}