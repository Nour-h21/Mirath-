abstract class MeetingEvent {}

class CreateMeetingEvent extends MeetingEvent {
  final String title;
  final String description;
  final String type;
  final String? scheduledDate;
  final String? scheduledTime;

  CreateMeetingEvent({
    required this.title,
    required this.description,
    required this.type,
    this.scheduledDate,
    this.scheduledTime,
  });
}

class JoinMeetingEvent extends MeetingEvent {
  final int meetingId;

  JoinMeetingEvent({
    required this.meetingId,
  });
}