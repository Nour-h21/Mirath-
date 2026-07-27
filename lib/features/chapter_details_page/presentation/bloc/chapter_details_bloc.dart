import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecase/chapter_details_usecase.dart';
import 'chapter_details_event.dart';
import 'chapter_details_state.dart';

class ChapterDetailsBloc
    extends Bloc<ChapterDetailsEvent, ChapterDetailsState> {
  final GetChapterDetailsUseCase useCase;
  final UpdateProgressUseCase updateProgressUseCase;

  ChapterDetailsBloc(this.useCase, this.updateProgressUseCase)
    : super(ChapterDetailsInitial()) {
    on<GetChapterDetailsEvent>(_onGetDetails);
    on<UpdateProgressEvent>((event, emit) async {
      await updateProgressUseCase(
        chapterId: event.chapterId,
        progress: event.progress,
      );
    });
  }

  Future<void> _onGetDetails(
    GetChapterDetailsEvent event,
    Emitter<ChapterDetailsState> emit,
  ) async {
    try {
      emit(ChapterDetailsLoading());

      final result = await useCase(event.id);

      emit(ChapterDetailsSuccess(result));
    } catch (e) {
      emit(ChapterDetailsError(e.toString()));
    }
  }
}
