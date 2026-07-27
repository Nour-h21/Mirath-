import '../../domain/entities/exam_entity.dart';

class ExamModel extends ExamEntity {
  const ExamModel({
    required super.scorePercentage,
    required super.date,
    required super.bookName,
  });

  factory ExamModel.fromJson(Map<String, dynamic> json) {
    return ExamModel(
      scorePercentage: json['score_percentage'] ?? '',
      date: json['date'] ?? '',
      bookName: json['book_name'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'score_percentage': scorePercentage,
      'date': date,
      'book_name':bookName,
    };
  }
}