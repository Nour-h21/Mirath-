abstract class QuizEvent {
  const QuizEvent();
}

class StartQuizEvent extends QuizEvent {
  final int chapterId;

  const StartQuizEvent(this.chapterId);
}

class SubmitAnswerEvent extends QuizEvent {
  final int choiceId;

  const SubmitAnswerEvent(this.choiceId);
}

class ContinueQuizEvent extends QuizEvent {
  const ContinueQuizEvent();
}

class EndQuizEvent extends QuizEvent {
  const EndQuizEvent();
}

class TickTimerEvent extends QuizEvent {
  const TickTimerEvent();
}

class TimeFinishedEvent extends QuizEvent {
  const TimeFinishedEvent();
}
