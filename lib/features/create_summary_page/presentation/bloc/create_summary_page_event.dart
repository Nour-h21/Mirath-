abstract class CreateSummaryEvent {}

class AddSummaryEvent extends CreateSummaryEvent {

  final int chapterId;
  final String title;
  final String content;

  AddSummaryEvent({
    required this.chapterId,
    required this.title,
    required this.content,
  });
}