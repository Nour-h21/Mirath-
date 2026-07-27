import 'package:mirath/core/constants/urls.dart';

class ChapterDetailsModel {
  final String chapterTitle;
  final bool haveSummary;
  final ChapterFileModel pdf;
  final ChapterFileModel audio;
  final ChapterFileModel video;
  final int chapterNumber;

  ChapterDetailsModel({
    required this.chapterTitle,
    required this.haveSummary,
    required this.pdf,
    required this.audio,
    required this.video,
    required this.chapterNumber,
  });

  factory ChapterDetailsModel.fromJson(Map<String, dynamic> json) {
    final data = json['data'];

    return ChapterDetailsModel(
      chapterNumber: data['chapter_number'] ?? 0,
      chapterTitle: data['chapter_title'] ?? '',
      haveSummary: data['have_summary'] ?? false,
      pdf: ChapterFileModel.fromJson(data['pdf']),
      audio: ChapterFileModel.fromJson(data['audio']),
      video: ChapterFileModel.fromJson(data['video']),
    );
  }
}

class ChapterFileModel {
  final int id;
  final String url;
  final int progress;

  ChapterFileModel({
    required this.id,
    required this.url,
    required this.progress,
  });

  factory ChapterFileModel.fromJson(Map<String, dynamic> json) {
    return ChapterFileModel(
      id: json['id'],
      url: (json['url'] ?? '').replaceAll('localhost:8000', AppUrls.localhost),
      progress: json['progress'] ?? 0,
    );
  }
}

// UpdateProgress
class UpdateProgressRequest {
  final double progress;

  UpdateProgressRequest({required this.progress});

  Map<String, dynamic> toJson() {
    return {"progress": progress};
  }
}
