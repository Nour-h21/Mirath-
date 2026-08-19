import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecase/feedback_usecase.dart';
import 'feedback_event.dart';
import 'feedback_state.dart';

class FeedbackBloc extends Bloc<FeedbackEvent, FeedbackState> {
  final AddFeedbackUseCase addFeedbackUseCase;

  FeedbackBloc(this.addFeedbackUseCase)
      : super(FeedbackInitial()) {
    on<AddFeedbackEvent>(_addFeedback);
  }

  Future<void> _addFeedback(
    AddFeedbackEvent event,
    Emitter<FeedbackState> emit,
  ) async {
    emit(FeedbackLoading());

    try {
      final message = await addFeedbackUseCase(
        feedback: event.feedback,
      );

      emit(FeedbackSuccess(message));
    } catch (e) {
      emit(
        FeedbackFailure(
          e.toString(),
        ),
      );
    }
  }
}