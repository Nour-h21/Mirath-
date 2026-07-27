import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/add_book_to_cart_usecase.dart';
import '../../domain/usecases/library_books_use_case.dart';
import 'awards_event.dart';
import 'awards_state.dart';

class AwardsBloc extends Bloc<AwardsEvent, AwardsState> {
  final GetLibraryBooksUseCase getLibraryBooksUseCase;
  final AddBookToCartUseCase addBookToCartUseCase;

  AwardsBloc(
    this.getLibraryBooksUseCase,
    this.addBookToCartUseCase,
  ) : super(AwardsInitial()) {
    on<GetLibraryBooksEvent>(_getBooks);
    on<AddBookToCartEvent>(_addBookToCart);
  }

  Future<void> _getBooks(
    GetLibraryBooksEvent event,
    Emitter<AwardsState> emit,
  ) async {
    emit(AwardsLoading());

    try {
      final books = await getLibraryBooksUseCase();

      emit(AwardsLoaded(books));
    } catch (e) {
      emit(
        AwardsError(e.toString()),
      );
    }
  }

  Future<void> _addBookToCart(
  AddBookToCartEvent event,
  Emitter<AwardsState> emit,
) async {

  // try {

  //   final result =
  //       await addBookToCartUseCase(event.bookId);
   
  //   emit(AddBookToCartSuccess(result.message));

  //   add(GetLibraryBooksEvent());

  // } catch (e) {

  //   emit(AwardsError(e.toString()));
  // }

  try {
  final result = await addBookToCartUseCase(event.bookId);

  if (result.status == 1) {
    emit(AddBookToCartSuccess(result.message));

    add(GetLibraryBooksEvent());
  } else {
    emit(AddBookToCartError(
      _getArabicMessage(result.message),
    ));
  }
} catch (e) {
  emit(AwardsError("حدث خطأ أثناء الاتصال بالخادم"));
}
}
}
String _getArabicMessage(String? message) {
  switch (message) {
    case "Book already exists in cart":
      return "الكتاب موجود بالفعل في السلة.";

    case "Insufficient points":
      return "لا تملك نقاطًا كافية.";

    default:
      return "حدث خطأ، يرجى المحاولة مرة أخرى.";
  }
}