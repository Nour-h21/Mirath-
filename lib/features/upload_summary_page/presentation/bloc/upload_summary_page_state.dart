import '../../domain/entities/book_dropdown_entity.dart';
import '../../domain/entities/chapter_dropdown_entity.dart';
import '../../domain/entities/classification_dropdown_entity.dart';

abstract class UploadSummaryState {}

// الحالة الابتدائية
class UploadSummaryInitial extends UploadSummaryState {}

// تحميل
class UploadSummaryLoading extends UploadSummaryState {}

// الحالة الأساسية التي تحمل كل بيانات الصفحة
class UploadSummaryLoaded extends UploadSummaryState {
  final List<ClassificationDropDownEntity> classifications;

  final List<BookDropDownEntity> books;

  final List<ChapterDropDownEntity> chapters;

  UploadSummaryLoaded({
    this.classifications = const [],

    this.books = const [],

    this.chapters = const [],
  });

  UploadSummaryLoaded copyWith({
    List<ClassificationDropDownEntity>? classifications,

    List<BookDropDownEntity>? books,

    List<ChapterDropDownEntity>? chapters,
  }) {
    return UploadSummaryLoaded(
      classifications: classifications ?? this.classifications,

      books: books ?? this.books,

      chapters: chapters ?? this.chapters,
    );
  }
}

// نجاح الرفع
class UploadSummaryUploadSuccess extends UploadSummaryState {
  final String message;

  UploadSummaryUploadSuccess(this.message);
}

// الخطأ
class UploadSummaryError extends UploadSummaryState {
  final String message;

  UploadSummaryError(this.message);
}
