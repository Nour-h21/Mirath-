abstract class MySummaryEvent {}

class GetInternalSummariesEvent extends MySummaryEvent {}

class GetExternalSummariesEvent extends MySummaryEvent {}

class DeleteSummaryEvent extends MySummaryEvent {
  final int id;
  DeleteSummaryEvent(this.id);
}
