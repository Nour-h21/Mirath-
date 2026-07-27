import '../../domain/entities/revision_section_entity.dart';

abstract class ReviewListState {}

class ReviewListInitial extends ReviewListState {}

class ReviewListLoading extends ReviewListState {}

class ReviewListLoaded extends ReviewListState {
  final ReviewListEntity reviewList;

  ReviewListLoaded(this.reviewList);
}

class ReviewListError extends ReviewListState {
  final String message;

  ReviewListError(this.message);
}

class DeleteReviewChapterLoading extends ReviewListState {}

class DeleteReviewChapterSuccess extends ReviewListState {}

class DeleteReviewChapterError extends ReviewListState {
  final String message;

  DeleteReviewChapterError(this.message);
}