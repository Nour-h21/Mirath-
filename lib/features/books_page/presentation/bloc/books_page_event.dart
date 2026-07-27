abstract class BooksEvent {}

class GetBooksEvent extends BooksEvent {
  final int id;

  GetBooksEvent(this.id);
}
