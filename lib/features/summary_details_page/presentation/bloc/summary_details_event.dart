abstract class SummaryDetailsEvent {}


// details ent & ext event
class GetSummaryDetailsEvent extends SummaryDetailsEvent {
  final int id;

  GetSummaryDetailsEvent(this.id);
}
 

// edit summary event
class EditSummaryEvent extends SummaryDetailsEvent {
  final int id;
  final String title;
  final String content;

  EditSummaryEvent({
    required this.id,
    required this.title,
    required this.content,
  });
}