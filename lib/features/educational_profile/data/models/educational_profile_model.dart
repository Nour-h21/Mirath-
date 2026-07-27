import '../../domain/entities/educational_profile_entity.dart';

class EducationalProfileModel extends EducationalProfileEntity {
  const EducationalProfileModel({
    required super.successfulExamsCount,
    required super.averagePercentage,
    required super.hoursStudy,
    required super.tasksCompleted,
    required super.allTasks,
    required super.points,
  });

  factory EducationalProfileModel.fromJson(Map<String, dynamic> json) {
    return EducationalProfileModel(
      successfulExamsCount: json["successful_exams_count"] ?? 0,
      averagePercentage: json["average_percentage"] ?? 0,
      hoursStudy: json["hours_study"] ?? 0,
      tasksCompleted: json["tasks_completed"] ?? 0,
      allTasks: json["all_tasks"] ?? 0,
      points: json["points"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "successful_exams_count": successfulExamsCount,
      "average_percentage": averagePercentage,
      "hours_study": hoursStudy,
      "tasks_completed": tasksCompleted,
      "all_tasks": allTasks,
      "points":points,
    };
  }
}