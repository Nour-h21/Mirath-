abstract class CreateSummaryState {}

class CreateSummaryInitial extends CreateSummaryState {}

class CreateSummaryLoading extends CreateSummaryState {}

class CreateSummarySuccess extends CreateSummaryState {

  final String message;

  CreateSummarySuccess(this.message);
}

class CreateSummaryFailure extends CreateSummaryState {

  final String error;

  CreateSummaryFailure(this.error);
}