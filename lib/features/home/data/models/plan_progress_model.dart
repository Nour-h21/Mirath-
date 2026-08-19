import '../../domain/entities/plan_progress_entity.dart';

class PlanProgressModel extends PlanProgressEntity {
  PlanProgressModel({
    required super.totalPages,
    required super.completdPages,
    required super.remainingPages,
    required super.percentage,
  });

  factory PlanProgressModel.fromJson(Map<String, dynamic> json) {
    return PlanProgressModel(
      totalPages: json['total_pages'],
      completdPages:  json['completed_pages'],
      remainingPages:  json['remaining_pages'],
      percentage: json['percentage'],
    );
  }
}
