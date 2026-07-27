class BookDetailsEntity {
  final String photo;

  final String title;

  final String authorName;

  final int totalPages;

  final int totalChapters;

  final String bio;

  final List<ChapterEntity> chapters;

  BookDetailsEntity({
    required this.photo,

    required this.title,

    required this.authorName,

    required this.totalPages,

    required this.totalChapters,

    required this.bio,

    required this.chapters,
  });
}

enum ChapterState { locked, completed, inProgress }

class ChapterEntity {
  final int id;

  final String title;

  final String status;

  final bool examStatus;

  final double studyProgress;

  ChapterEntity({
    required this.id,

    required this.title,

    required this.status,

    required this.examStatus,

    required this.studyProgress,
  });

  ChapterState get state {
    if (status == 'مغلق') {
      return ChapterState.locked;
    }

    if (status == 'مفتوح' && examStatus == true) {
      return ChapterState.completed;
    }

    return ChapterState.inProgress;
  }
}
