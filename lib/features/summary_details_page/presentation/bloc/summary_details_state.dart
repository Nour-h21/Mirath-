
import '../../domain/entities/summary_details_entity.dart';

abstract class SummaryDetailsState {}


// Details ent & ext
class SummaryDetailsInitial extends SummaryDetailsState {}

class SummaryDetailsLoading extends SummaryDetailsState {}

class SummaryDetailsSuccess extends SummaryDetailsState {
  final SummaryDetailsEntity summary;

  SummaryDetailsSuccess(this.summary);
}

class SummaryDetailsFailure extends SummaryDetailsState {
  final String message;

  SummaryDetailsFailure(this.message);
}



// Edit summary
class EditSummaryLoading extends SummaryDetailsState {}

class EditSummarySuccess extends SummaryDetailsState {
  final String message;

  EditSummarySuccess(this.message);
}

class EditSummaryFailure extends SummaryDetailsState {
  final String message;

  EditSummaryFailure(this.message);
}