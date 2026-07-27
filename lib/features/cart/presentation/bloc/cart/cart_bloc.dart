import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecases/get_cart_usecase.dart';
import '../../../domain/usecases/redeem_books_use_case.dart';

import 'cart_event.dart';
import 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final GetCartUseCase getCartUseCase;
  final RedeemCartUseCase redeemCartUseCase;

  CartBloc(this.getCartUseCase, this.redeemCartUseCase)
    : super(CartState.initial()) {
    on<GetCartEvent>(_getCart);
    on<ToggleBookSelectionEvent>(_toggleSelection);
    on<SelectAllBooksEvent>(_selectAll);
    on<RedeemSelectedBooksEvent>(_redeem);
  }

  // ---------------- GET CART ----------------
  Future<void> _getCart(GetCartEvent event, Emitter<CartState> emit) async {
    emit(state.copyWith(isLoading: true, error: null));

    try {
      final cart = await getCartUseCase();

      emit(
        state.copyWith(
          isLoading: false,
          books: cart.items,
          totalPoints: cart.totalPoints,
          // selectedIds: [],
        ),
      );
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  // ---------------- TOGGLE ----------------
  void _toggleSelection(
  ToggleBookSelectionEvent event,
  Emitter<CartState> emit,
) {
  final ids = List<int>.from(state.selectedBookIds);

  // نحول cartItemId → bookId
  final bookId = state.books
      .firstWhere((e) => e.id == event.cartItemId)
      .book
      .id;

  if (ids.contains(bookId)) {
    ids.remove(bookId);
  } else {
    ids.add(bookId);
  }

  emit(state.copyWith(selectedBookIds: ids));
}
  // ---------------- SELECT ALL ----------------
 void _selectAll(
  SelectAllBooksEvent event,
  Emitter<CartState> emit,
) {
  if (state.isAllSelected) {
    emit(state.copyWith(selectedBookIds: []));
  } else {
    emit(
      state.copyWith(
        selectedBookIds: state.books.map((e) => e.book.id).toList(),
      ),
    );
  }
}

  // ---------------- REDEEM ----------------
// Future<void> _redeem(
//   RedeemSelectedBooksEvent event,
//   Emitter<CartState> emit,
// ) async {
//   final ids = state.selectedBookIds;

//   if (ids.isEmpty) return;

//   try {
//     emit(state.copyWith(isLoading: true));

//     // 🔥 هذا المطلوب من API
//      await redeemCartUseCase.call(ids);

//     final updatedBooks = state.books
//         .where((b) => !ids.contains(b.book.id))
//         .toList();

//    emit(
//   state.copyWith(
//     isLoading: false,
//     books: updatedBooks,
//     selectedBookIds: [],
//     redeemSuccess: true, // 🔥 أضفناها
//   ),
// );
//   } catch (e) {
//     emit(
//       state.copyWith(
//         isLoading: false,
//         error: "Redeem failed: ${e.toString()}",
//       ),
//     );
//   }
// }

Future<void> _redeem(
  RedeemSelectedBooksEvent event,
  Emitter<CartState> emit,
) async {
  final ids = List<int>.from(state.selectedBookIds);

  print('🟡 SELECTED BOOK IDS: $ids');

  if (ids.isEmpty) {
    print('🔴 IDS ARE EMPTY');
    return;
  }

  try {
    emit(
      state.copyWith(
        isLoading: true,
        error: null,
        redeemSuccess: false,
      ),
    );

    print('🟡 CALLING REDEEM API...');

    final response = await redeemCartUseCase.call(ids);

    print('🟢 API SUCCESS');
    print('🟢 STATUS: ${response.status}');
    print('🟢 MESSAGE: ${response.message}');
    print(
      '🟢 LOCATION: ${response.data.libraryLocation}',
    );
    print(
      '🟢 HOURS: ${response.data.workingHours}',
    );

    final updatedBooks = state.books
        .where(
          (cartItem) => !ids.contains(cartItem.book.id),
        )
        .toList();

    emit(
      state.copyWith(
        isLoading: false,
        books: updatedBooks,
        selectedBookIds: [],
        redeemSuccess: true,
        redemptionResponse: response,
      ),
    );

    print('🟢 SUCCESS STATE EMITTED');
  } catch (e, stackTrace) {
    print('🔴 REDEEM ERROR: $e');
    print('🔴 STACK TRACE: $stackTrace');

    emit(
      state.copyWith(
        isLoading: false,
        redeemSuccess: false,
        error: e.toString(),
      ),
    );
  }
}

}
