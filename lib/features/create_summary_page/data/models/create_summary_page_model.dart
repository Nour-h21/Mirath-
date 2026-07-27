class CreateSummaryModel {
  final String title;
  final String content;

  CreateSummaryModel({
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