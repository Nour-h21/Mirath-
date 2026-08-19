class MeetingEntity {
  final int id;
  final String title;
  final String description;
  final String meetingLink;
  final String roomName;
  final String type;
  final String? scheduledDate;
  final String? scheduledTime;

  const MeetingEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.meetingLink,
    required this.roomName,
    required this.type,
    this.scheduledDate,
    this.scheduledTime,
  });
}


class JoinMeetingEntity {
  final int id;
  final String title;
  final String roomName;
  final String jitsiRoom;
  final String jitsiToken;
  final String serverUrl;

  const JoinMeetingEntity({
    required this.id,
    required this.title,
    required this.roomName,
    required this.jitsiRoom,
    required this.jitsiToken,
    required this.serverUrl,
  });
}