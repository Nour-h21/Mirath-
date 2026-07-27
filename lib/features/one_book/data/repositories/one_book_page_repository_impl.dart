import '../../domain/entities/one_book_page_entity.dart';
import '../../domain/repositories/one_book_page_repository.dart';
import '../datasources/one_book_page_remote_ds.dart';

class BookDetailsRepositoryImpl implements BookDetailsRepository {
  final BookDetailsRemoteDataSource remoteDataSource;

  BookDetailsRepositoryImpl(this.remoteDataSource);

  @override
  Future<BookDetailsEntity> getBookDetails(int id) async {
    final result = await remoteDataSource.getBookDetails(id);

    return BookDetailsEntity(
      photo: result.photo,

      title: result.title,

      authorName: result.authorName,

      totalPages: result.totalPages,

      totalChapters: result.totalChapters,

      bio: result.bio,

      chapters: result.chapters.map((e) {
        return ChapterEntity(
          id: e.id,

          title: e.title,

          status: e.status,

          examStatus: e.examStatus,

          studyProgress: e.studyProgress,
        );
      }).toList(),
    );
  }
}

