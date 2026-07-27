abstract class AnalyticalEvent {
  const AnalyticalEvent();
}

class LoadAnalyticalQuestionsEvent extends AnalyticalEvent {
  final int chapterId;

  const LoadAnalyticalQuestionsEvent(this.chapterId);
}

class NextQuestionEvent extends AnalyticalEvent {
  const NextQuestionEvent();
}

class PreviousQuestionEvent extends AnalyticalEvent {
  const PreviousQuestionEvent();
}

class ToggleAnswerEvent extends AnalyticalEvent {
  const ToggleAnswerEvent();
}