import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecase/book_dropdown_usecase.dart';
import '../../domain/usecase/chapter_dropdown_usecase.dart';
import '../../domain/usecase/classification_dropdown_usecase.dart';
import '../../domain/usecase/upload_summary_page_usecase.dart';
import 'upload_summary_page_event.dart';
import 'upload_summary_page_state.dart';

class UploadSummaryBloc extends Bloc<UploadSummaryEvent, UploadSummaryState> {
  final GetClassificationsDropDownUseCase getClassifications;

  final GetBooksDropDownUseCase getBooks;

  final GetChaptersDropDownUseCase getChapters;

  final UploadSummaryUseCase uploadSummary;

  UploadSummaryBloc( {
    required this.getClassifications,

    required this.getBooks,

    required this.getChapters,

    required this.uploadSummary,
  }) : super(UploadSummaryInitial()) {
    on<GetClassificationsDropDownEvent>(_getClassifications);

    on<GetBooksDropDownEvent>(_getBooks);

    on<GetChaptersDropDownEvent>(_getChapters);

    on<UploadedSummaryEvent>(_uploadSummary);
  }

  // =============================
  // جلب التصنيفات
  // =============================

  Future<void> _getClassifications(
    GetClassificationsDropDownEvent event,

    Emitter<UploadSummaryState> emit,
  ) async {
    emit(UploadSummaryLoading());

    try {
      final classifications = await getClassifications();

      emit(UploadSummaryLoaded(classifications: classifications));
    } catch (e) {
      emit(UploadSummaryError(e.toString()));
    }
  }

  // =============================
  // جلب الكتب
  // =============================

  Future<void> _getBooks(
    GetBooksDropDownEvent event,

    Emitter<UploadSummaryState> emit,
  ) async {
    try {
      final books = await getBooks(event.classificationId);

      final currentState = state;

      if (currentState is UploadSummaryLoaded) {
        emit(
          currentState.copyWith(
            books: books,

            // عند تغيير التصنيف نمسح الشابترات
            chapters: [],
          ),
        );
      }
    } catch (e) {
      emit(UploadSummaryError(e.toString()));
    }
  }

  // =============================
  // جلب الشابترات
  // =============================

  Future<void> _getChapters(
    GetChaptersDropDownEvent event,

    Emitter<UploadSummaryState> emit,
  ) async {
    try {
      final chapters = await getChapters(event.bookId);

      final currentState = state;

      if (currentState is UploadSummaryLoaded) {
        emit(currentState.copyWith(chapters: chapters));
      }
    } catch (e) {
      emit(UploadSummaryError(e.toString()));
    }
  }

  // =============================
  // رفع الملخص
  // =============================

  Future<void> _uploadSummary(
    UploadedSummaryEvent event,

    Emitter<UploadSummaryState> emit,
  ) async {
    emit(UploadSummaryLoading());

    try {
      await uploadSummary(event.chapterId, event.filePath);

      emit(UploadSummaryUploadSuccess("تم رفع الملخص بنجاح"));
    } catch (e) {
      emit(UploadSummaryError(e.toString()));
    }
  }
}
