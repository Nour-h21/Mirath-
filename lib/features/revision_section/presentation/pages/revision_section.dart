import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mirath/core/core.dart';

import '../bloc/revision_section_bloc.dart';
import '../bloc/revision_section_state.dart';
import '../widgets/RevisionCourseCard.dart';

class ReviewListPage extends StatelessWidget {
  const ReviewListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: InBackgroundPage(
            labelAppBar: AppStrings.revisionList,
            child: BlocBuilder<ReviewListBloc, ReviewListState>(
              builder: (context, state) {
                if (state is ReviewListLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (state is ReviewListError) {
                  return Center(child: Text(state.message));
                }

                if (state is ReviewListLoaded) {
                  final review = state.reviewList;

                  return Column(
                    children: [
                      SizedBox(height: context.h(7)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppStrings.revisionDescription,
                            style: AppTextStyles.revisionDescription(context),
                          ),

                          CardGradientContainer(
                            width: context.w(20),
                            height: context.h(3),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x40000000),
                                offset: Offset(1, 2),
                                blurRadius: 2,
                                spreadRadius: 1,
                              ),
                            ],

                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  review.totalChaptersNum.toString(),
                                  style: AppTextStyles.revisionChapterCount(
                                    context,
                                  ),
                                ),
                                SizedBox(width: context.w(1)),
                                Text(
                                  AppStrings.chapter,
                                  style: AppTextStyles.revisionChapter(context),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ).paddingOnlyLR(context, 4, 4),

                      SizedBox(height: context.h(3)),

                      Expanded(
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: review.reviewList.length,
                          itemBuilder: (context, index) {
                            return RevisionCourseCard(
                              course: review.reviewList[index],
                            ).paddingOnly(context, 5, 5, 4, 4);
                          },
                        ),
                      ),
                    ],
                  );
                }

                return const SizedBox();
              },
            ),
          ),
        ),
      ),
    );
  }
}
