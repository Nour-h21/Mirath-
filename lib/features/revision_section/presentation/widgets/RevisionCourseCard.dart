import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../../core/core.dart';
import '../../domain/entities/revision_section_entity.dart';
import '../bloc/revision_section_bloc.dart';
import '../bloc/revision_section_event.dart';

class RevisionCourseCard extends StatelessWidget {
  final ReviewItemEntity course;

  const RevisionCourseCard({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.h(45),
      decoration: BoxDecoration(
        color: AppColors.offWhite,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Color(0x20000000),
            offset: Offset(0, 0),
            blurRadius: 2.5,
            spreadRadius: 2.5,
          ),
        ],
      ),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
                child: Image.network(
  course.image,
  fit: BoxFit.cover,
  errorBuilder: (context, error, stackTrace) {
    debugPrint('IMAGE URL: ${course.image}');
    debugPrint('IMAGE ERROR: $error');
    debugPrint('IMAGE STACK: $stackTrace');

    return const Icon(Icons.error);
  },
)
                // Image.network(
                //   // AppAssets.sss,
                //   course.image,
                //   height: context.h(24),
                //   width: double.infinity,
                //   fit: BoxFit.cover,
                // ),
              ),

              Positioned(
                top: context.h(1),
                left: context.w(2),
                child: GestureDetector(
                  onTap: () {
                    context.read<ReviewListBloc>().add(
                      DeleteReviewChapterEvent(course.id),
                    );
                  },
                  child: CircleAvatar(
                    radius: context.w(3.5),
                    backgroundColor: AppColors.primaryColor,
                    child: Icon(
                      Icons.delete,
                      color: AppColors.baieg,
                      size: context.sp(4),
                    ),
                  ),
                ),
              ),

              Positioned(
                bottom: context.h(1.5),
                right: context.w(2),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: context.w(2.5),
                    vertical: context.h(0.5),
                  ),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [Color(0XFFF5EADA), Color(0XFFDADADA)],
                    ),
                    borderRadius: BorderRadius.circular(context.w(5)),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x20000000),
                        offset: Offset(0, 0),
                        blurRadius: 2,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Text(
                    course.classification,
                    style: AppTextStyles.revisionClassification(context),
                  ),
                ),
              ),
            ],
          ),

          Padding(
            padding: EdgeInsets.all(context.w(3)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  course.bookName,
                  style: AppTextStyles.revisionBookName(context),
                ),

                SizedBox(height: context.h(0.5)),

                Text(
                  course.chapterName,
                  style: AppTextStyles.revisionChapterName(context),
                ),

                SizedBox(height: context.h(2.5)),

                Center(
                  child: SizedBox(
                    width: context.w(80),
                    height: context.h(5.5),
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(context.w(5)),
                        ),
                      ),
                      icon: Icon(
                        Icons.play_circle_outline,
                        color: AppColors.baieg,
                        size: context.sp(4.5),
                      ),
                      label: Text(
                        AppStrings.continueRevision,
                        style: AppTextStyles.revisionButton(context),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
