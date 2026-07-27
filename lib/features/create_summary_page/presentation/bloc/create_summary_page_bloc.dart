import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecase/create_summary_page_usecase.dart';
import 'create_summary_page_event.dart';
import 'create_summary_page_state.dart';

class CreateSummaryBloc
    extends Bloc<CreateSummaryEvent, CreateSummaryState> {

  final AddSummaryUseCase addSummaryUseCase;

  CreateSummaryBloc(this.addSummaryUseCase)
      : super(CreateSummaryInitial()) {

    on<AddSummaryEvent>(_addSummary);
  }

  Future<void> _addSummary(
    AddSummaryEvent event,
    Emitter<CreateSummaryState> emit,
  ) async {

    emit(CreateSummaryLoading());

    try {

      final message = await addSummaryUseCase(
        chapterId: event.chapterId,
        title: event.title,
        content: event.content,
      );

      emit(CreateSummarySuccess(message));

    } catch (e) {

      emit(CreateSummaryFailure(e.toString()));

    }
  }
}