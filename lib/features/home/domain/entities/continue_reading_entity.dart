class ContinueReadingEntity {
  final String bookName;
  final String bookPhoto;
  final String classification;
  final String chapterTitle;
  final int chapterId;
  final int classificationId;
  final int bookId;
  final String authorName;

  ContinueReadingEntity(  {
    required this.bookName,
    required this.bookPhoto,
    required this.classification,
    required this.chapterTitle,
    required this.chapterId,
    required this.authorName,
    required this.classificationId,
    required this.bookId,
  });
}