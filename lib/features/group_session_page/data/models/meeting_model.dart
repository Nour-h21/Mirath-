import '../../domain/entities/meeting_entity.dart';

class MeetingModel extends MeetingEntity {
  const MeetingModel({
    required super.id,
    required super.title,
    required super.description,
    required super.meetingLink,
    required super.roomName,
    required super.type,
    super.scheduledDate,
    super.scheduledTime,
  });

  factory MeetingModel.fromJson(Map<String, dynamic> json) {
    return MeetingModel(
      id: json['id'],
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      meetingLink: json['meeting_link'] ?? '',
      roomName: json['room_name'] ?? '',
      type: json['type'] ?? '',
      scheduledDate: json['scheduled_date'],
      scheduledTime: json['scheduled_time'],
    );
  }
}



class JoinMeetingModel extends JoinMeetingEntity {
  const JoinMeetingModel({
    required super.id,
    required super.title,
    required super.roomName,
    required super.jitsiRoom,
    required super.jitsiToken,
    required super.serverUrl,
  });

  factory JoinMeetingModel.fromJson(Map<String, dynamic> json) {
    return JoinMeetingModel(
      id: json['id'],
      title: json['title'],
      roomName: json['room_name'],
      jitsiRoom: json['jitsi_room'],
      jitsiToken: json['jitsi_token'],
      serverUrl: json['server_url'],
    );
  }
}