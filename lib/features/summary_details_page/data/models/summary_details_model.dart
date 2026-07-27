import '../../domain/entities/summary_details_entity.dart';

class SummaryDetailsModel extends SummaryDetailsEntity {
  const SummaryDetailsModel({
    required super.title,
    required super.content,
  });

  factory SummaryDetailsModel.fromJson(Map<String, dynamic> json) {
    return SummaryDetailsModel(
      title: json["title"],
      content: json["content"],
    );
  }
}