import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecase/meeting_usecase.dart';
import 'meeting_event.dart';
import 'meeting_state.dart';


class MeetingBloc extends Bloc<MeetingEvent, MeetingState> {
  final CreateMeetingUseCase createMeetingUseCase;
  final JoinMeetingUseCase joinMeetingUseCase;

  MeetingBloc({
    required this.createMeetingUseCase,
    required this.joinMeetingUseCase,
  }) : super(MeetingInitial()) {
    on<CreateMeetingEvent>(_createMeeting);
    on<JoinMeetingEvent>(_joinMeeting);
  }

  Future<void> _createMeeting(
    CreateMeetingEvent event,
    Emitter<MeetingState> emit,
  ) async {
    emit(MeetingLoading());

    try {
      final meeting = await createMeetingUseCase(
        title: event.title,
        description: event.description,
        type: event.type,
        scheduledDate: event.scheduledDate,
        scheduledTime: event.scheduledTime,
      );

      emit(
        MeetingSuccess(meeting),
      );
    } catch (e) {
      emit(
        MeetingFailure(
          e.toString(),
        ),
      );
    }
  }

  Future<void> _joinMeeting(
    JoinMeetingEvent event,
    Emitter<MeetingState> emit,
  ) async {
    emit(MeetingLoading());

    try {
      final meeting = await joinMeetingUseCase(
        meetingId: event.meetingId,
      );

      emit(
        JoinMeetingSuccess(meeting),
      );
    } catch (e) {
      emit(
        MeetingFailure(
          e.toString(),
        ),
      );
    }
  }
}