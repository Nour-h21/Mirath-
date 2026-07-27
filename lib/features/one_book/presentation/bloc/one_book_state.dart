import '../../domain/entities/one_book_page_entity.dart';

abstract class BookDetailsState {}

class BookDetailsInitial extends BookDetailsState {}

class BookDetailsLoading extends BookDetailsState {}

class BookDetailsSuccess extends BookDetailsState {
  final BookDetailsEntity data;

  BookDetailsSuccess(this.data);
}

class BookDetailsError extends BookDetailsState {
  final String message;

  BookDetailsError(this.message);
}

