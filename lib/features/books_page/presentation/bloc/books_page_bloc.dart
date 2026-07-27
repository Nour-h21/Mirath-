import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecase/books_page_usecase.dart';
import 'books_page_event.dart';
import 'books_page_state.dart';

class BooksBloc extends Bloc<BooksEvent, BooksState> {
  final GetBooksUseCase getBooksUseCase;

  BooksBloc(this.getBooksUseCase) : super(BooksInitial()) {
    on<GetBooksEvent>(_getBooks);
  }

  Future<void> _getBooks(GetBooksEvent event, Emitter<BooksState> emit) async {
    emit(BooksLoading());

    try {
      final result = await getBooksUseCase(event.id);

      emit(BooksSuccess(result));
    } on DioException catch (e) {
      emit(BooksError(e.response?.data['message'] ?? 'حدث خطأ'));
    }
  }
}
