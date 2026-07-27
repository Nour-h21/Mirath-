class EditSummaryModel {
  final String title;
  final String content;

  EditSummaryModel({
    required this.title,
    required this.content,
  });

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "content": content,
    };
  }
}