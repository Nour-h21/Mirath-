import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecase/delete_summary_usecase.dart';
import '../../domain/usecase/external_summary_usecase.dart';
import '../../domain/usecase/internal_summary_usecase.dart';
import 'my_summary_page_event.dart';
import 'my_summary_page_state.dart';

class MySummaryBloc extends Bloc<MySummaryEvent, MySummaryState> {
  final GetInternalSummariesUseCase getInternalSummariesUseCase;
  final GetExternalSummariesUseCase getExternalSummariesUseCase;
  final DeleteSummaryUseCase deleteSummaryUseCase;

  MySummaryBloc(
    this.getInternalSummariesUseCase,
    this.getExternalSummariesUseCase,
    this.deleteSummaryUseCase,
  ) : super(MySummaryInitial()) {
    on<GetInternalSummariesEvent>(_getInternalSummaries);

    on<GetExternalSummariesEvent>(_getExternalSummaries);

    on<DeleteSummaryEvent>(_deleteSummary);
  }

  Future<void> _getInternalSummaries(
    GetInternalSummariesEvent event,
    Emitter<MySummaryState> emit,
  ) async {
    emit(MySummaryLoading());

    try {
      final summaries = await getInternalSummariesUseCase();

      emit(InternalSummarySuccess(summaries));
    } catch (e) {
      emit(MySummaryFailure(e.toString()));
    }
  }

  Future<void> _getExternalSummaries(
    GetExternalSummariesEvent event,
    Emitter<MySummaryState> emit,
  ) async {
    emit(MySummaryLoading());

    try {
      final summaries = await getExternalSummariesUseCase();

      emit(ExternalSummarySuccess(summaries));
    } catch (e) {
      emit(MySummaryFailure(e.toString()));
    }
  }

  Future<void> _deleteSummary(
    DeleteSummaryEvent event,
    Emitter<MySummaryState> emit,
  ) async {
    try {
      await deleteSummaryUseCase(event.id);
    } catch (e) {
      emit(MySummaryFailure(e.toString()));
    }
  }
}
