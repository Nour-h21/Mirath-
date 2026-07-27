abstract class ReviewListEvent {}

class GetReviewListEvent extends ReviewListEvent {}

class DeleteReviewChapterEvent extends ReviewListEvent {
  final int id;

  DeleteReviewChapterEvent(this.id);
}