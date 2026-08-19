import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mirath/features/one_book/domain/entities/one_book_page_entity.dart';
import 'package:mirath/features/one_book/presentation/widgets/chapter_card.dart';
import 'package:mirath/features/one_book/presentation/widgets/info_container.dart';

import '../../../../app/di/injection_container.dart';
import '../../../../core/core.dart';
import '../../../../core/shared/widgets/dialogs/app_alert_dialog.dart';
import '../bloc/one_book_bloc.dart';
import '../bloc/one_book_event.dart';
import '../bloc/one_book_state.dart';
import '../helper/bookmark_helper.dart';

class OneBookPage extends StatefulWidget {
  final int bookId;
  final int classificationId;

  const OneBookPage({
    super.key,
    required this.bookId,
    required this.classificationId,
  });

  @override
  State<OneBookPage> createState() => _OneBookPageState();
}

class _OneBookPageState extends State<OneBookPage> {
  final bookmarkHelper = getIt<BookmarkHelper>();

  @override
  void initState() {
    super.initState();
    context.read<BookDetailsBloc>().add(GetBookDetailsEvent(widget.bookId));
    bookmarkHelper.loadBookmarks().then((_) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,

      child: BlocConsumer<BookDetailsBloc, BookDetailsState>(
        listener: (context, state) {
          if (state is BookDetailsError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          if (state is BookDetailsLoading) {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(color: AppColors.primaryColor),
              ),
            );
          }
          if (state is BookDetailsSuccess) {
            final book = state.data;
            return InBackgroundPage(
              labelAppBar: 'تفاصيل الكتاب',
              onBackPressed: () {
                // GoRouter.of(context).pop();
                GoRouter.of(
                  context,
                ).push('/BooksPage', extra: widget.classificationId);
              },
              child: ListView(
                children: [
                  SizedBox(height: context.h(5)),
                  Center(
                    child: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.001)
                        ..rotateY(-0.15),

                      child: Container(
                        width: context.w(50),
                        height: context.h(30),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.black.withOpacity(.35),
                              offset: const Offset(12, 12),
                              blurRadius: 0,
                            ),
                            BoxShadow(
                              color: AppColors.black.withOpacity(.12),
                              blurRadius: 25,
                            ),
                          ],
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(book.photo),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: context.h(4)),
                  Center(
                    child: RichText(
                      textAlign: TextAlign.center,
                      textDirection: TextDirection.rtl,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '${book.title}\n',
                            style: AppTextStyles.midDeepPrimaryColorStyle(
                              context,
                            ).copyWith(fontSize: context.sp(4)),
                          ),
                          TextSpan(
                            text: book.authorName,
                            style: AppTextStyles.smallBlack54Style(
                              context,
                            ).copyWith(fontSize: context.sp(3.7)),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: context.h(2)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InfoContainer(
                        title: 'عدد الصفحات',
                        subTitle: book.totalPages.toString(),
                      ),
                      SizedBox(width: context.w(25)),
                      InfoContainer(
                        title: 'عدد الأبواب',
                        subTitle: book.totalChapters.toString(),
                      ),
                    ],
                  ),
                  SizedBox(height: context.h(3)),
                  SizedBox(
                    height: context.h(14),
                    child: SingleChildScrollView(
                      child: RichText(
                        textDirection: TextDirection.rtl,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'نبذة الكتاب\n',
                              style: AppTextStyles.midDeepPrimaryColorStyle(
                                context,
                              ).copyWith(fontSize: context.sp(4)),
                            ),
                            TextSpan(
                              text: book.bio,
                              style: AppTextStyles.smallBlack54Style(
                                context,
                              ).copyWith(fontSize: context.sp(3.7)),
                            ),
                          ],
                        ),
                      ).paddingSymetricH(context, 1.5),
                    ),
                  ),
                  Divider(
                    thickness: 0.35,
                    indent: context.w(10),
                    endIndent: context.w(10),
                    color: AppColors.offPink,
                  ),
                  Row(
                    children: [
                      Text(
                        'الأبواب',
                        style: AppTextStyles.midDeepPrimaryColorStyle(
                          context,
                        ).copyWith(fontSize: context.sp(4.3)),
                      ),
                    ],
                  ).paddingAll(context, 1),
                  SizedBox(
                    height: context.h(28), //54
                    width: context.w(92),
                    child: ListView.builder(
                      itemCount: book.chapters.length,
                      itemBuilder: (context, index) {
                        final chapter = book.chapters[index];
                        final isBookmarked =
                            bookmarkHelper.bookmarkedMap[chapter.id] ?? false;
                        return ChapterCard(
                          key: ValueKey(chapter.id),
                          index: index + 1,
                          // index: chapter.id,
                          title: chapter.title,
                          progress: chapter.studyProgress / 100,
                          state: chapter.state,
                          isBookmarked: isBookmarked,

                          onBookmarkTap: () async {
                            try {
                              await bookmarkHelper.toggleBookmark(
                                bookId: widget.bookId,

                                chapterId: chapter.id,
                              );
                              setState(() {});
                            } catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: Colors.redAccent,
                                  content: Text(
                                    'لا يمكن إضافة باب مغلق إلى قائمة المراجعة',
                                    textDirection: TextDirection.rtl,
                                    style: AppTextStyles.authbuttonStyle(
                                      context,
                                    ).copyWith(fontSize: context.sp(3.55)),
                                  ),
                                ),
                              );
                            }
                          },
                          onPressed: () {
                            if (state.data.chapters[index].state ==
                                ChapterState.locked) {
                              AppAlertDialog.show(
                                context: context,
                                message:
                                    'هذا الباب مغلق ، عليك تجاوز اختبار الباب السابق أولاً لتتمكن من فتح هذا الباب',
                                onPressed: () {
                                  GoRouter.of(context).pop();
                                },
                              );
                            } else {
                              GoRouter.of(context).push(
                                '/ChooseStudyWay',
                                extra: ChooseStudyWayArgs(
                                  bookId: widget.bookId,
                                  chapterId: chapter.id,
                                  authorName: book.authorName,
                                  classificationId: widget.classificationId,
                                ),
                              );
                            }
                            // GoRouter.of(context).push(
                            //   '/SplitPdfAndSummaryPage',
                            //   extra: PdfPageArgs(
                            //     chapterId: chapter.id,
                            //     authorName: book.authorName,
                            //   ),
                            // );
                          },
                        );
                      },
                    ),
                  ),

                  SizedBox(height: context.h(1.5)),
                ],
              ).paddingAll(context, 1.8),
            );
          }
          return const Scaffold(body: SizedBox());
        },
      ),
    );
  }
}

// class PdfPageArgs {
//   final int chapterId;

//   final String authorName;

//   PdfPageArgs({required this.chapterId, required this.authorName});
// }

class ChooseStudyWayArgs {
  final int chapterId;
  final String authorName;
  final int bookId;
  final int classificationId;

  ChooseStudyWayArgs({
    required this.chapterId,
    required this.authorName,
    required this.bookId,
    required this.classificationId,
  });
}
