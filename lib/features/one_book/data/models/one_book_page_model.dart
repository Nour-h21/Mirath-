import 'package:mirath/core/constants/urls.dart';

class BookDetailsModel {
  final String photo;

  final String title;

  final String authorName;

  final int totalPages;

  final int totalChapters;

  final String bio;

  final List<ChapterModel> chapters;

  BookDetailsModel({
    required this.photo,

    required this.title,

    required this.authorName,

    required this.totalPages,

    required this.totalChapters,

    required this.bio,

    required this.chapters,
  });

  factory BookDetailsModel.fromJson(Map<String, dynamic> json) {
    return BookDetailsModel(
      photo: json['data']['book']['photo'].replaceAll(
        'http://localhost:8000',
        AppUrls.localhost,
      ),

      title: json['data']['book']['title'],

      authorName: json['data']['book']['author_name'],

      totalPages: json['data']['book']['total_pages'],

      totalChapters: json['data']['book']['total_chapters'],

      bio: json['data']['book']['bio'],

      chapters: List<ChapterModel>.from(
        json['data']['chapters'].map((x) => ChapterModel.fromJson(x)),
      ),
    );
  }
}

class ChapterModel {
  final int id;

  final String title;

  final String status;

  final bool examStatus;

  final double studyProgress;

  ChapterModel({
    required this.id,

    required this.title,

    required this.status,

    required this.examStatus,

    required this.studyProgress,
  });

  factory ChapterModel.fromJson(Map<String, dynamic> json) {
    return ChapterModel(
      id: json['id'],

      title: json['title'],

      status: json['status'],

      examStatus: json['exam status'],

      studyProgress: (json['study_progress'] as num).toDouble(),
    );
  }
}
