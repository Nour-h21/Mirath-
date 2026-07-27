import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecase/one_book_page_usecase.dart';
import 'one_book_event.dart';
import 'one_book_state.dart';

class BookDetailsBloc extends Bloc<BookDetailsEvent, BookDetailsState> {
  final GetBookDetailsUseCase useCase;

  BookDetailsBloc(this.useCase) : super(BookDetailsInitial()) {
    on<GetBookDetailsEvent>(_getBookDetails);
    
  }

  Future<void> _getBookDetails(
    GetBookDetailsEvent event,

    Emitter<BookDetailsState> emit,
  ) async {
    emit(BookDetailsLoading());

    try {
      final result = await useCase(event.id);

      emit(BookDetailsSuccess(result));
    } on DioException catch (e) {
      emit(BookDetailsError(e.response?.data['message'] ?? 'حدث خطأ'));
    }
  }
}

