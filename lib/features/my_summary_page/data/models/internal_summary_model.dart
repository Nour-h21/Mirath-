import '../../domain/entities/internal_summary_entity.dart';

class InternalSummaryModel extends InternalSummaryEntity {
  const InternalSummaryModel({
    required super.id,
    required super.chapterTitle,
    required super.summaryTitle,
    required super.contentPreview,
    required super.createdAt,
    required super.edited,
    required super.editedAt,
  });

  factory InternalSummaryModel.fromJson(Map<String, dynamic> json) {
    return InternalSummaryModel(
      id: json["id"],
      chapterTitle: json["chapter_title"],
      summaryTitle: json["summary_title"],
      contentPreview: json["content_preview"],
      createdAt: json["created_at"],
      edited: json["edited"],
      editedAt: json["edited_at"].toString(),
    );
  }
}