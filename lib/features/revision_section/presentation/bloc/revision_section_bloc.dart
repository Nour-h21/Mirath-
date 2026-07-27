import 'package:bloc/bloc.dart';

import '../../domain/usecase/delete_review_chapter_use_case.dart';
import '../../domain/usecase/revision_section_use_case.dart';
import 'revision_section_event.dart';
import 'revision_section_state.dart';

class ReviewListBloc
    extends Bloc<ReviewListEvent, ReviewListState> {
  final GetReviewListUseCase getReviewList;
  final DeleteReviewChapterUseCase deleteReviewChapter;

  ReviewListBloc(this.getReviewList, this.deleteReviewChapter)
      : super(ReviewListInitial()) {
    on<GetReviewListEvent>(_getReviewList);
    on<DeleteReviewChapterEvent>(_deleteChapter);
  }

  Future<void> _getReviewList(
    GetReviewListEvent event,
    Emitter<ReviewListState> emit,
  ) async {
    emit(ReviewListLoading());

    try {
      final reviewList = await getReviewList();
  
      emit(
        ReviewListLoaded(reviewList,),
      );
    } catch (e) {
      emit(
        ReviewListError(e.toString()),
      );
    }
  }

  Future<void> _deleteChapter(
  DeleteReviewChapterEvent event,
  Emitter<ReviewListState> emit,
) async {
  try {
    await deleteReviewChapter(event.id);

    final review = await getReviewList();

    emit(
      ReviewListLoaded(review),
    );
  } catch (e) {
    emit(
      ReviewListError(e.toString()),
    );
  }
}
}