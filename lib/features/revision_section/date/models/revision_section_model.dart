import '../../domain/entities/revision_section_entity.dart';

class ReviewListModel extends ReviewListEntity {
  const ReviewListModel({
    required super.totalChaptersNum,
    required super.reviewList,
  });

  factory ReviewListModel.fromJson(Map<String, dynamic> json) {
    return ReviewListModel(
      totalChaptersNum: json['total_chapters_num'],
      reviewList: (json['review_list'] as List)
          .map((e) => ReviewItemModel.fromJson(e))
          .toList(),
    );
  }
}

class ReviewItemModel extends ReviewItemEntity {
  const ReviewItemModel({
    required super.id,
    required super.classification,
    required super.bookName,
    required super.chapterName,
    required super.image,
  });

  factory ReviewItemModel.fromJson(Map<String, dynamic> json) {
    return ReviewItemModel(
      id: json['id'],
      classification: json['classification'],
      bookName: json['book_name'],
      chapterName: json['chapter_name'],
      image: json['book_photo'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "classification": classification,
      "book_name": bookName,
      "chapter_name": chapterName,
      "book_photo":image,
    };
  }
}