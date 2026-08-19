abstract class FeedbackEvent {}

class AddFeedbackEvent extends FeedbackEvent {
  final String feedback;

  AddFeedbackEvent({
    required this.feedback,
  });
}