import '../../domain/entities/external_summary_entity.dart';

class ExternalSummaryModel extends ExternalSummaryEntity {
  const ExternalSummaryModel({
    required super.id,
    required super.chapterTitle,
    required super.summaryTitle,
    required super.createdAt,
  });

  factory ExternalSummaryModel.fromJson(
      Map<String, dynamic> json) {
    return ExternalSummaryModel(
      id: json["id"],
      chapterTitle: json["chapter_title"],
      summaryTitle: json["summary_title"],
      createdAt: json["created_at"],
    );
  }
}