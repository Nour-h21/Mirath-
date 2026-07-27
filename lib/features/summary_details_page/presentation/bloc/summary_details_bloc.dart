import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mirath/features/summary_details_page/domain/usecase/summary_edit_usecase.dart';

import '../../data/models/summary_edit_model.dart';
import '../../domain/usecase/summary_details_usecase.dart';
import 'summary_details_event.dart';
import 'summary_details_state.dart';

class SummaryDetailsBloc
    extends Bloc<SummaryDetailsEvent, SummaryDetailsState> {
  final GetSummaryDetailsUseCase getSummaryDetailsUseCase;
  final EditSummaryDetailsUseCase editSummaryUseCase;
  SummaryDetailsBloc(this.getSummaryDetailsUseCase, this.editSummaryUseCase)
      : super(SummaryDetailsInitial()) {
    on<GetSummaryDetailsEvent>(_getSummaryDetails);
    on<EditSummaryEvent>(_editSummary);
  }

  Future<void> _getSummaryDetails(
    GetSummaryDetailsEvent event,
    Emitter<SummaryDetailsState> emit,
  ) async {
    emit(SummaryDetailsLoading());

    try {
      final summary =
          await getSummaryDetailsUseCase(event.id);

      emit(SummaryDetailsSuccess(summary));
    } catch (e) {
      emit(SummaryDetailsFailure(e.toString()));
    }
  }

  Future<void> _editSummary(
  EditSummaryEvent event,
  Emitter<SummaryDetailsState> emit,
) async {
  emit(EditSummaryLoading());

  try {
    final message = await editSummaryUseCase(
      id: event.id,
      model: EditSummaryModel(
        title: event.title,
        content: event.content,
      ),
    );

    emit(EditSummarySuccess(message));
  } catch (e) {
    emit(EditSummaryFailure(e.toString()));
  }
}
}