abstract class AwardsEvent {}

class GetLibraryBooksEvent extends AwardsEvent {}

class AddBookToCartEvent extends AwardsEvent {
  final int bookId;

  AddBookToCartEvent(this.bookId);
}