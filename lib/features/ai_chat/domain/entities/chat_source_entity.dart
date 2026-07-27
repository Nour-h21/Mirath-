class ChatSourceEntity {
  final String bookId;
  final String chapterId;
  final String chapterTitle;
  final String? videoYoutubeUrl;

  const ChatSourceEntity({
    required this.bookId,
    required this.chapterId,
    required this.chapterTitle,
    this.videoYoutubeUrl,
  });
}