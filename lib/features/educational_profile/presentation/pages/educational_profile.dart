import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mirath/core/core.dart';
import 'package:mirath/features/educational_profile/presentation/bloc/bloc/educational_profile_bloc.dart';

import '../../../user_points/presentation/bloc/user_points_bloc.dart';
import '../../../user_points/presentation/bloc/user_points_state.dart';
import '../bloc/bloc/educational_profile_state.dart';
import '../widgets/educational_exams_list.dart';
import '../widgets/widgets.dart';

class EducationalProfile extends StatelessWidget {
  const EducationalProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: InBackgroundPage(
          labelAppBar: AppStrings.educationalProfile,
        
          child: BlocBuilder<EducationalProfileBloc, EducationalProfileState>(
            builder: (context, state) {
              if (state is EducationalProfileLoading) {
                return const Center(child: CircularProgressIndicator());
              }
        
              if (state is EducationalProfileError) {
                return Center(child: Text(state.message));
              }
        
              if (state is EducationalProfileLoaded) {
                final profile = state.statistics;
                final exams = state.lastExams;
        
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: context.h(5)),
                      BlocBuilder<UserPointsBloc, UserPointsState>(
                        builder: (context, state) {
                          return ProfileInfoSection(
                            userName: 'شهد الحمصي',
                            userPoints: state.points,
                            image: AppAssets.profile,
                          );
                        },
                      ),
        
                      SizedBox(height: context.h(4)),
        
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SectionTitle(
                            title: AppStrings.educationalProgress,
                          ),
                        ],
                      ),
                      SizedBox(height: context.h(2.5)),
                      CardContainer(
                        width: context.w(90),
                        height: context.h(25),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                              children: [
                                SmallStatisticCard(
                                  percentage: profile.hoursStudy.toString(),
                                  title: AppStrings.learningHours,
                                ),
                                SmallStatisticCard(
                                  percentage: profile.successfulExamsCount
                                      .toString(),
                                  title: AppStrings.completedExams,
                                ),
        
                                SmallStatisticCard(
                                  percentage: "${profile.averagePercentage}%",
                                  title: AppStrings.averageScore,
                                ),
                              ],
                            ),
        
                            SizedBox(height: context.h(4)),
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  AppStrings.tasks,
                                  style: AppTextStyles.cardTitle(context),
                                ),
                                SizedBox(width: context.w(1.5)),
                                Text(
                                  AppStrings.completedTasksMessage(
                                    completedTasks: profile.tasksCompleted,
                                  ),
                                  style: AppTextStyles.cardSubtitle(context),
                                ),
                              ],
                            ),
                            ProgressSlider(
                              value: profile.allTasks == 0
                                  ? 0
                                  : (profile.tasksCompleted /
                                            profile.allTasks) *
                                        100,
                            ),
                            // ProgressSlider(
                            //   value: user.progress.toDouble(),
                            // ),
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  AppStrings.progressCompletedMessage(
                                    percentage: profile.allTasks == 0
                                        ? 0
                                        : ((profile.tasksCompleted /
                                                      profile.allTasks) *
                                                  100)
                                              .round(),
                                  ),
                                  style: AppTextStyles.progressText(context),
                                ),
                                SizedBox(width: context.w(1)),
                                Text(
                                  AppStrings.remainingTasksMessage(
                                    remainingTasks:
                                        profile.allTasks -
                                        profile.tasksCompleted,
                                  ),
                                  style: AppTextStyles.progressText(context),
                                ),
                              ],
                            ),
                          ],
                        ).paddingAll(context, 0.5),
                      ),
        
                      // SizedBox(height: context.h(2),),
                      SizedBox(height: context.h(4)),
                      const SectionTitle(title: AppStrings.educationalTools),
        
                      SizedBox(height: context.h(2.5)),
        
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              EducationalCard(
                                title: AppStrings.summaries,
                                imagePath: AppAssets.summaries,
                                onTap: () {
                                  context.push("/summaries");
                                },
                              ),
        
                              SizedBox(width: context.w(3)),
                              EducationalCard(
                                title: AppStrings.revisionList,
                                imagePath: AppAssets.review,
                                onTap: () {
                                  context.push("/revision-section");
                                },
                              ),
                            ],
                          ),
        
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              // EducationalCard(
                              //   title: AppStrings.awards,
                              //   imagePath: AppAssets.prize,
                              //   onTap: () {
                              //     context.push(AppRoutes.awards);
                              //   },
                              // ),
                              EducationalCard(
                                title: AppStrings.awards,
                                imagePath: AppAssets.prize,
                                onTap: () {
                                  context.push(
                                    "/awards",
                                    extra: profile.points,
                                  );
                                },
                              ),
                              SizedBox(width: context.w(3)),
        
                              EducationalCard(
                                title: AppStrings.certificates,
                                imagePath: AppAssets.certificates,
                                onTap: () {
                                  print("ملخصاتي");
                                },
                              ),
                            ],
                          ).paddingOnlytop(context, 2),
                        ],
                      ),
        
                      SizedBox(height: context.h(4)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SectionTitle(
                            title: AppStrings.lastExamResults,
                          ),
        
                          TextButton(
                            onPressed: () {
                              GoRouter.of(context).push("/allExams");
                            },
                            child: Text(
                              AppStrings.showAll,
                              style: AppTextStyles.textButton(context),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: context.h(1.5)),
        
                      // ListView.separated(
                      //   shrinkWrap: true,
                      //   physics: const NeverScrollableScrollPhysics(),
                      //   itemCount: exams.length,
                      //   separatorBuilder: (_, __) =>
                      //       SizedBox(height: context.h(2)),
                      //   itemBuilder: (context, index) {
                      //     final exam = exams[index];
        
                      //     return EducationalExamsList(exams: exams);
                      //     //  EducationalProgressCard(
                      //     //   title: exam.bookName,
                      //     //   date: exam.date,
                      //     //   progress:
                      //     //       double.parse(
                      //     //         exam.scorePercentage.replaceAll(
                      //     //           '%',
                      //     //           '',
                      //     //         ),
                      //     //       ) /
                      //     //       100,
                      //     // );
                      //   },
                      // )
                      EducationalExamsList(
                        exams: exams,
                      ).paddingOnlyLR(context, 1, 1),
        
                      SizedBox(height: context.h(6)),
                    ],
                  ).paddingOnlyLR(context, 5, 5),
                );
              }
        
              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
