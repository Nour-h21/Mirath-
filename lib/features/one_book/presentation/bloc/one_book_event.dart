abstract class BookDetailsEvent {}

class GetBookDetailsEvent
    extends BookDetailsEvent {

  final int id;

  GetBookDetailsEvent(this.id);
  
}

