abstract class ChapterDetailsEvent {}

class GetChapterDetailsEvent extends ChapterDetailsEvent {
  final int id;

  GetChapterDetailsEvent(this.id);
}

class UpdateProgressEvent extends ChapterDetailsEvent {
  final int chapterId;
  final double progress;

  UpdateProgressEvent({
    required this.chapterId,
    required this.progress,
  });
}