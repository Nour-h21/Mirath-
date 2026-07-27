import '../../domain/entities/internal_summary_entity.dart';
import '../../domain/entities/external_summary_entity.dart';

abstract class MySummaryState {}

class MySummaryInitial extends MySummaryState {}

class MySummaryLoading extends MySummaryState {}

// class MySummarySuccess extends MySummaryState {
//   final List<InternalSummaryEntity> internalSummaries;
//   final List<ExternalSummaryEntity> externalSummaries;

//   MySummarySuccess({
//     required this.internalSummaries,
//     required this.externalSummaries,
//   });
// }

class MySummaryFailure extends MySummaryState {
  final String message;

  MySummaryFailure(this.message);
}

class InternalSummarySuccess extends MySummaryState {
  final List<InternalSummaryEntity> summaries;

  InternalSummarySuccess(this.summaries);
}

class ExternalSummarySuccess extends MySummaryState {
  final List<ExternalSummaryEntity> summaries;

  ExternalSummarySuccess(this.summaries);
}