import 'package:dio/dio.dart';

class BookmarkHelper {
  final Dio dio;
  BookmarkHelper(this.dio);

  Map<int, bool> bookmarkedMap = {};

  // Future<void> loadBookmarks(int bookId) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final saved = prefs.getStringList("bookmarks") ?? [];

  //   bookmarkedMap.clear();
  //   prefs.remove("bookmarks");

  //   for (var item in saved) {
  //     if (!item.contains("_")) {
  //       continue;
  //     }

  //     final parts = item.split("_");
  //     final savedBookId = int.parse(parts[0]);
  //     final chapterId = int.parse(parts[1]);

  //     if (savedBookId == bookId) {
  //       bookmarkedMap[chapterId] = true;
  //     }
  //   }
  // }

  Future<void> loadBookmarks() async {
  bookmarkedMap.clear();

  final response = await dio.get(
    '/getReviewList',
  );

  final reviewList = response.data['data']['review_list'];

  for (final item in reviewList) {
    bookmarkedMap[item['id']] = true;
  }
}

  Future<void> addBookmark(int chapterId) async {
    await dio.get(
      '/addChapterToReviewList/$chapterId',
      options: Options(
        headers: {
          "Authorization":
              "Bearer 5|Ze3K8bOfFlF659Ll0BNpnD4T6madFO4ii15iBUG5f1473d24",
        },
      ),
    );
  }

  Future<void> removeBookmark(int chapterId) async {
    await dio.get(
      '/removeChapterFromReviewList/$chapterId',
      options: Options(
        headers: {
          "Authorization":
              "Bearer 5|Ze3K8bOfFlF659Ll0BNpnD4T6madFO4ii15iBUG5f1473d24",
        },
      ),
    );
  }

  Future<void> toggleBookmark({
    required int bookId,

    required int chapterId,
  }) async {
    final isBookmarked = bookmarkedMap[chapterId] ?? false;

    if (isBookmarked) {
      await removeBookmark(chapterId);

      bookmarkedMap[chapterId] = false;
    } else {
      await addBookmark(chapterId);

      bookmarkedMap[chapterId] = true;
    }
  }
}
