import '../../domain/entities/chapter_dropdown_entity.dart';

class ChapterDropDownModel extends ChapterDropDownEntity {
  const ChapterDropDownModel({required super.id, required super.title});

  factory ChapterDropDownModel.fromJson(Map<String, dynamic> json) {
    return ChapterDropDownModel(id: json['id'], title: json['title']);
  }
}
