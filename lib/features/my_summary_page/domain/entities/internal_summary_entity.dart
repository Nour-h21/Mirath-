class InternalSummaryEntity {
  final int id;
  final String chapterTitle;
  final String summaryTitle;
  final String contentPreview;
  final String createdAt;
  final bool edited;
  final String editedAt;

  const InternalSummaryEntity({
    required this.id,
    required this.chapterTitle,
    required this.summaryTitle,
    required this.contentPreview,
    required this.createdAt,
    required this.edited,
    required this.editedAt,
  });
}