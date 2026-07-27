class BooksEntity {
  final String bio;

  final List<BookEntity> books;

  BooksEntity({required this.bio, required this.books});
}

class BookEntity {
  final int id;

  final String title;

  final String authorName;

  final String photo;

  BookEntity({
    required this.id,

    required this.title,

    required this.authorName,

    required this.photo,
  });
}
