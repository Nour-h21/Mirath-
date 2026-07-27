abstract class UploadSummaryEvent {}

// جلب التصنيفات
class GetClassificationsDropDownEvent extends UploadSummaryEvent {}

// جلب الكتب
class GetBooksDropDownEvent extends UploadSummaryEvent {
  final int classificationId;

  GetBooksDropDownEvent(this.classificationId);
}

// جلب الشابترات
class GetChaptersDropDownEvent extends UploadSummaryEvent {
  final int bookId;

  GetChaptersDropDownEvent(this.bookId);
}

// رفع الملخص
class UploadedSummaryEvent extends UploadSummaryEvent {
  final int chapterId;

  final String filePath;

  UploadedSummaryEvent({required this.chapterId, required this.filePath});
}
