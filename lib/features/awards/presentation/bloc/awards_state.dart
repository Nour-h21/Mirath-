import '../../domain/entities/library_book_entity.dart';

abstract class AwardsState {}

class AwardsInitial extends AwardsState {}

class AwardsLoading extends AwardsState {}

class AwardsLoaded extends AwardsState {
  final List<LibraryBookEntity> books;

  AwardsLoaded(this.books);
}

class AwardsError extends AwardsState {
  final String message;

  AwardsError(this.message);
}

class AddBookToCartSuccess extends AwardsState {
  final String message;

  AddBookToCartSuccess(this.message);
}
class AddBookToCartError extends AwardsState {
  final String message;

  AddBookToCartError(this.message);
}