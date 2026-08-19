import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../app/di/injection_container.dart';
import '../../../../core/core.dart';
import '../bloc/books_page_bloc.dart';
import '../bloc/books_page_event.dart';
import '../bloc/books_page_state.dart';
import '../widgets/book_card_widget.dart';

class BooksPage extends StatefulWidget {
  final int classificationId;

  const BooksPage({super.key, required this.classificationId});

  @override
  State<BooksPage> createState() => _BooksPageState();
}

class _BooksPageState extends State<BooksPage> {
  @override
  void initState() {
    super.initState();

    context.read<BooksBloc>().add(GetBooksEvent(widget.classificationId));
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: BlocConsumer<BooksBloc, BooksState>(
        listener: (context, state) {
          if (state is BooksError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          if (state is BooksLoading) {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(color: AppColors.primaryColor),
              ),
            );
          }
          if (state is BooksSuccess) {
            return InBackgroundPage(
              labelAppBar: state.data.bio,
              onBackPressed: () {
                GoRouter.of(context).push('/NavicationBar');
              },
              child: Column(
                children: [
                  SizedBox(height: context.h(5)),
                  Container(
                    constraints: BoxConstraints(maxHeight: context.h(20)),
                    width: double.infinity,
                    child: Scrollbar(
                      child: SingleChildScrollView(
                        child: RichText(
                          textDirection: TextDirection.rtl,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'نبذة المسار\n',
                                style: AppTextStyles.midDeepPrimaryColorStyle(
                                  context,
                                ).copyWith(fontSize: context.sp(4.4)),
                              ),
                              TextSpan(
                                text: state.data.bio,
                                style: AppTextStyles.smallBlack54Style(
                                  context,
                                ).copyWith(fontSize: context.sp(3.7)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: context.h(2)),
                  Divider(
                    thickness: 0.35,
                    indent: context.w(10),
                    endIndent: context.w(15),
                    color: AppColors.offPink,
                  ),
                  SizedBox(height: context.h(1.5)),
                  Row(
                    children: [
                      RichText(
                        textDirection: TextDirection.rtl,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'الكتب\n',
                              style: AppTextStyles.midDeepPrimaryColorStyle(
                                context,
                              ).copyWith(fontSize: context.sp(4.3)),
                            ),
                            TextSpan(
                              text:
                                  'الكتب مرتبة من الأبسط إلى الأعقد (من اليمين إلى اليسار).',
                              style: AppTextStyles.smallBlack54Style(
                                context,
                              ).copyWith(fontSize: context.sp(3.55)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: context.h(2)),
                  SizedBox(
                    height: context.h(57),
                    width: context.w(95),
                    child: GridView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: state.data.books.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.65,
                          ),
                      itemBuilder: (context, index) {
                        final book = state.data.books[index];

                        return BookCard(
                          image: book.photo,
                          title: book.title,
                          subtitle: book.authorName,
                          onPressd: () {
                            ///
                            final SharedPreferences prefs = getIt();
                            final classifId = widget.classificationId;
                            prefs.setInt("classifId", classifId);
                            prefs.setInt("bookId", book.id);
                            ////
                            GoRouter.of(context).push(
                              '/OneBookPage',
                              extra: BookDetailsArgs(
                                classificationId: widget.classificationId,
                                bookId: book.id,
                              ),
                            );
                          },
                        ).paddingAll(context, 0.6);
                      },
                    ),
                  ),
                ],
              ).paddingAll(context, 1.95),
            );
          }

          return const Scaffold(body: SizedBox());
        },
      ),
    );
  }
}

class BookDetailsArgs {
  final int classificationId;
  final int bookId;

  BookDetailsArgs({required this.classificationId, required this.bookId});
}
