import 'dart:io';

class ReviewListEntity {
  final int totalChaptersNum;
  final List<ReviewItemEntity> reviewList;

  const ReviewListEntity({
    required this.totalChaptersNum,
    required this.reviewList,
  });
}

class ReviewItemEntity {
  final int id;
  final String classification;
  final String bookName;
  final String chapterName;
  final String image;

  const ReviewItemEntity({
    required this.id,
    required this.classification,
    required this.bookName,
    required this.chapterName,
    required this.image,
  });
}
