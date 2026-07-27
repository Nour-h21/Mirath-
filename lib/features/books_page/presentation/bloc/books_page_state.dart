import '../../domain/entities/books_page_entity.dart';

abstract class BooksState {}

class BooksInitial extends BooksState {}

class BooksLoading extends BooksState {}

class BooksSuccess extends BooksState {
  final BooksEntity data;

  BooksSuccess(this.data);
}

class BooksError extends BooksState {
  final String message;

  BooksError(this.message);
}
