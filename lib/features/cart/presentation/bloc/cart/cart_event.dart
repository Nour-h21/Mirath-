abstract class CartEvent {}

class GetCartEvent extends CartEvent {}

class ToggleBookSelectionEvent extends CartEvent {
  final int cartItemId;

  ToggleBookSelectionEvent(this.cartItemId);
}

class SelectAllBooksEvent extends CartEvent {}

class DeleteBookEvent extends CartEvent {
  final int cartItemId;

  DeleteBookEvent(this.cartItemId);
}

class RedeemSelectedBooksEvent extends CartEvent {}

