import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mirath/core/constants/assets.dart';
import 'package:mirath/core/design/tokens/colors.dart';
import 'package:mirath/core/design/tokens/typography.dart';
import 'package:mirath/core/utils/extensions/context_extensions.dart';
import 'package:mirath/core/utils/extensions/widget_extensions.dart';
import 'package:mirath/features/home/presentation/widgets/catigories_card.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../app/di/injection_container.dart';
import '../../../../core/shared/page/background_page.dart';
import '../../../../core/shared/widgets/buttons/auth_button.dart';
import '../../../chapter_details_page/presentation/page/choose_study_way.dart';
import '../../../notifications/presentation/bloc/notifications_bloc.dart';
import '../../../notifications/presentation/bloc/notifications_event.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_state.dart';
import '../widgets/motivation_plan_card.dart';
import '../widgets/subject_card.dart';

// class HomePage extends StatelessWidget {
//   HomePage({super.key});
//   final cards = [
//     {"image": "assets/images/image3.png", "title": "إصلاحي"},
//     {"image": "assets/images/image2.png", "title": "سلوكي"},
//     {"image": "assets/images/image4.png", "title": "فكري"},
//     {"image": "assets/images/image1.png", "title": "شرعي"},
//   ];
//   final subCards = [
//     {
//       "image": AppAssets.ai,
//       "title": "مساعد ذكي يرافقك في التعلّم",
//       "subtitle":
//           "اسأل عمّا يشكل عليك،\nواحصل على إجابات مستندة إلى محتوى الكتاب",
//     },
//     {
//       "image": AppAssets.groupCall,
//       "title": "الجلسات الجماعية",
//       "subtitle":
//           "تعلّم ضمن خطة دراسية منظّمة،\nوتابع تقدّمك خطوة بخطوة حتى الإتقان",
//     },

//     {
//       "image": AppAssets.summary,
//       "title": "خلاصة الكتاب",
//       "subtitle": "استخلص زبدة المحتوى، ورتب أفكارك الرئيسية بطريقتك الخاصة",
//     },
//     {
//       "image": AppAssets.plan,
//       "title": "ابدأ رحلتك في طلب العلم",
//       "subtitle":
//           "تعلّم ضمن خطة دراسية منظّمة،\nوتابع تقدّمك خطوة بخطوة حتى الإتقان",
//     },
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       clipBehavior: Clip.none,
//       children: [
//         BackgroundPage(
//           image: AppAssets.homebackground,
//           top: context.h(0.001),
//           child: Directionality(
//             textDirection: TextDirection.rtl,
//             child: Column(
//               children: [
//                 SizedBox(
//                   height: context.h(2.5),
//                   child: Row(
//                     children: [
//                       PopupMenuButton(
//                         color: AppColors.offWhite,
//                         iconColor: AppColors.primaryColor,
//                         itemBuilder: (_) => [
//                           PopupMenuItem(
//                             // onTap: onDetails,
//                             child: Text(
//                               "التفاصيل",
//                               style: AppTextStyles.login3Style(context),
//                             ),
//                           ),
//                           PopupMenuItem(
//                             // onTap: onDelete,
//                             child: Text(
//                               "حذف",
//                               style: AppTextStyles.login3Style(context),
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(width: context.w(60)),
//                       IconButton(
//                         onPressed: () {},
//                         icon: Icon(
//                           Icons.search,
//                           color: AppColors.primaryColor,
//                           size: context.h(3.4),
//                         ),
//                       ),
//                       IconButton(
//                         onPressed: () {},
//                         icon: Icon(
//                           Icons.notifications,
//                           color: AppColors.primaryColor,
//                           size: context.h(3.4),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: context.h(5)),
//                 SizedBox(
//                   height: context.h(77),
//                   child: ListView(
//                     scrollDirection: Axis.vertical,
//                     children: [
//                       Row(
//                         children: [
//                           Text(
//                             'مرحباً,',
//                             style: AppTextStyles.midDeepPrimaryColorStyle(
//                               context,
//                             ).copyWith(color: AppColors.black),
//                           ).paddingOnlyRight(context, 1),
//                           Text(
//                             ' سندس',
//                             style: AppTextStyles.authbuttonStyle(
//                               context,
//                             ).copyWith(color: AppColors.primaryColor),
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: context.h(3.2)),
//                       Center(
//                         child: MotivationPlanCard(
//                           title: "حفّز نفسك",
//                           subtitle:
//                               "استمر بمتابعة أهدافك اليومية والإنجازات الخاصة بخطتك",
//                           progress: 0.3,
//                           onTapTasks: () {},
//                         ),
//                       ),
//                       SizedBox(height: context.h(3)),
//                       Row(
//                         children: [
//                           Text(
//                             'التصنيفات',
//                             style: AppTextStyles.midDeepPrimaryColorStyle(
//                               context,
//                             ).copyWith(fontSize: context.sp(4.2)),
//                           ),
//                           SizedBox(height: context.h(7)),
//                         ],
//                       ).paddingOnlyRight(context, 1.5),
//                       SizedBox(
//                         height: context.h(8),
//                         width: context.w(95),
//                         child: ListView.builder(
//                           scrollDirection: Axis.horizontal,
//                           itemCount: cards.length,
//                           itemBuilder: (context, index) {
//                             return CatigoriesCard(
//                               image: cards[index]["image"]!,
//                               title: cards[index]["title"]!,
//                             ).paddingAll(context, 0.6);
//                           },
//                         ),
//                       ),
//                       SizedBox(height: context.h(2.5)),
//                       Row(
//                         children: [
//                           Text(
//                             'استكشف الميزات',
//                             style: AppTextStyles.midDeepPrimaryColorStyle(
//                               context,
//                             ).copyWith(fontSize: context.sp(4.2)),
//                           ),
//                         ],
//                       ).paddingOnlyRight(context, 1.5),
//                       SizedBox(height: context.h(1.5)),
//                       SizedBox(
//                         height: context.h(34),
//                         width: context.w(95),
//                         child: ListView.builder(
//                           scrollDirection: Axis.horizontal,
//                           itemCount: subCards.length,
//                           itemBuilder: (context, index) {
//                             return SubjectCard(
//                               image: subCards[index]["image"]!,
//                               title: subCards[index]["title"]!,
//                               subtitle: subCards[index]["subtitle"]!,
//                             ).paddingAll(context, 0.6);
//                           },
//                         ),
//                       ),
//                       SizedBox(height: context.h(2.5)),
//                       Row(
//                         children: [
//                           Text(
//                             'آخر المقروءات',
//                             style: AppTextStyles.midDeepPrimaryColorStyle(
//                               context,
//                             ).copyWith(fontSize: context.sp(4.2)),
//                           ),
//                         ],
//                       ).paddingOnlyRight(context, 1.5),
//                       SizedBox(height: context.h(1.5)),
//                       Container(
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(15),
//                           color: AppColors.offWhite,
//                           gradient: LinearGradient(
//                             colors: [AppColors.baieg, AppColors.offWhite],
//                           ),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.grey,
//                               blurRadius: 5,
//                               offset: Offset(0, 2),
//                             ),
//                           ],
//                         ),
//                         child: ListTile(
//                           trailing: AuthButton(
//                             text: 'تابع القراءة',
//                             onPressed: () {},
//                             height: context.h(3.8),
//                             width: context.w(23),
//                             textStyle: AppTextStyles.authbuttonStyle(
//                               context,
//                             ).copyWith(fontSize: context.sp(3.2)),
//                           ),
//                           leading: Container(
//                             height: 45,
//                             width: 40,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(12),
//                               image: DecorationImage(
//                                 image: AssetImage(AppAssets.logo),
//                                 fit: BoxFit.cover,
//                               ),
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Colors.black26,
//                                   blurRadius: 2,
//                                   offset: Offset(0, 2),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           title: Row(
//                             children: [
//                               Text(
//                                 "اسم الكتاب",
//                                 style: AppTextStyles.login3Style(
//                                   context,
//                                 ).copyWith(),
//                               ),
//                               const SizedBox(width: 1.6),
//                               Text(
//                                 '(',
//                                 style: AppTextStyles.login3Style(context),
//                               ),
//                               Text(
//                                 'التصنيف',
//                                 style: AppTextStyles.googleLoginStyle(
//                                   context,
//                                 ).copyWith(fontSize: context.sp(3)),
//                               ),
//                               Text(
//                                 ')',
//                                 style: AppTextStyles.login3Style(context),
//                               ),
//                             ],
//                           ),
//                           subtitle: Text(
//                             'الباب الثامن',
//                             style: AppTextStyles.smallBlack54Style(
//                               context,
//                             ).copyWith(fontSize: context.sp(3.4)),
//                           ),
//                         ),
//                       ).paddingSymetricH(context, 3),
//                       SizedBox(height: context.h(1.5)),
//                     ],
//                   ).paddingSymetricH(context, 2.5),
//                 ),
//               ],
//             ).paddingSymetricH(context, 1),
//           ),
//         ),
//       ],
//     );
//   }
// }

class HomePage extends StatelessWidget {
  HomePage({super.key});
  // final cards = [
  //   {"image": "assets/images/image3.png", "title": "إصلاحي"},
  //   {"image": "assets/images/image2.png", "title": "سلوكي"},
  //   {"image": "assets/images/image4.png", "title": "فكري"},
  //   {"image": "assets/images/image1.png", "title": "شرعي"},
  // ];
  // final subCards = [
  //   {
  //     "image": AppAssets.ai,
  //     "title": "مساعد ذكي يرافقك في التعلّم",
  //     "subtitle":
  //         "اسأل عمّا يشكل عليك،\nواحصل على إجابات مستندة إلى محتوى الكتاب",
  //   },
  //   {
  //     "image": AppAssets.groupCall,
  //     "title": "الجلسات الجماعية",
  //     "subtitle":
  //         "تعلّم ضمن خطة دراسية منظّمة،\nوتابع تقدّمك خطوة بخطوة حتى الإتقان",
  //   },

  //   {
  //     "image": AppAssets.summary,
  //     "title": "خلاصة الكتاب",
  //     "subtitle": "استخلص زبدة المحتوى، ورتب أفكارك الرئيسية بطريقتك الخاصة",
  //   },
  //   {
  //     "image": AppAssets.plan,
  //     "title": "ابدأ رحلتك في طلب العلم",
  //     "subtitle":
  //         "تعلّم ضمن خطة دراسية منظّمة،\nوتابع تقدّمك خطوة بخطوة حتى الإتقان",
  //   },
  // ];

  static const Map<String, String> classificationImages = {
    "إصلاحي": "assets/images/image3.png",
    "سلوكي": "assets/images/image2.png",
    "فكري": "assets/images/image4.png",
    "شرعي": "assets/images/image1.png",
  };

  static Map<String, String> featureImages = {
    "إمكانية التواصل مع بوت ذكي": AppAssets.ai,
    "إمكانية إنشاء جلسات جماعية": AppAssets.groupCall,
    "إمكانية إنشاء تلخيص": AppAssets.summary,
    "إمكانية إنشاء خطة شخصية": AppAssets.plan,
  };

  static const Map<String, String> featureSubtitles = {
    "إمكانية التواصل مع بوت ذكي":
        "اسأل عمّا يشكل عليك،\nواحصل على إجابات مستندة إلى محتوى الكتاب",

    "إمكانية إنشاء جلسات جماعية":
        "أنشئ جلسات تعلم جماعية،وراجع الأبواب، واختبر تقدّمك بأسلوب محفّز وتفاعلي.",

    "إمكانية إنشاء تلخيص":
        "استخلص زبدة المحتوى، ورتب أفكارك الرئيسية بطريقتك الخاصة",

    "إمكانية إنشاء خطة شخصية":
        "تعلّم ضمن خطة دراسية منظّمة،\nوتابع تقدّمك خطوة بخطوة حتى الإتقان",
  };

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is HomeLoading) {
          return Center(
            child: CircularProgressIndicator(color: AppColors.primaryColor),
          );
        }

        if (state is HomeFailure) {
          return Center(child: Text(state.message));
        }

        if (state is HomeSuccess) {
  //         getIt<NotificationsBloc>().add(
  //   RegisterCurrentDeviceEvent(),
  // );
          // GoRouter.of(context).go('/home');
        
          final home = state.home;
          return Stack(
            clipBehavior: Clip.none,
            children: [
              BackgroundPage(
                image: AppAssets.homebackground,
                top: context.h(0.001),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Column(
                    children: [
                      SizedBox(
                        height: context.h(2.5),
                        child: Row(
                          children: [
                            PopupMenuButton(
                              color: AppColors.offWhite,
                              iconColor: AppColors.primaryColor,
                              itemBuilder: (_) => [
                                PopupMenuItem(
                                  // onTap: onDetails,
                                  child: Text(
                                    "التفاصيل",
                                    style: AppTextStyles.login3Style(context),
                                  ),
                                ),
                                PopupMenuItem(
                                  // onTap: onDelete,
                                  child: Text(
                                    "حذف",
                                    style: AppTextStyles.login3Style(context),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: context.w(60)),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.search,
                                color: AppColors.primaryColor,
                                size: context.h(3.4),
                              ),
                            ),
                            IconButton(
                              onPressed: () {context.go("/NotificationsPage");
        },
                              icon: Icon(
                                Icons.notifications,
                                color: AppColors.primaryColor,
                                size: context.h(3.4),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: context.h(5)),
                      SizedBox(
                        height: context.h(77),
                        child: ListView(
                          scrollDirection: Axis.vertical,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'مرحباً,',
                                  style: AppTextStyles.midDeepPrimaryColorStyle(
                                    context,
                                  ).copyWith(color: AppColors.black),
                                ).paddingOnlyRight(context, 1),
                                Text(
                                  ' سندس',
                                  style: AppTextStyles.authbuttonStyle(
                                    context,
                                  ).copyWith(color: AppColors.primaryColor),
                                ),
                              ],
                            ),
                            SizedBox(height: context.h(3.2)),
                            Center(
                              child: MotivationPlanCard(
                                title: "حفّز نفسك",
                                subtitle:
                                    "استمر بمتابعة أهدافك اليومية والإنجازات الخاصة بخطتك",
                                progress: 0.3,
                                onTapTasks: () {},
                              ),
                            ),
                            SizedBox(height: context.h(3)),
                            Row(
                              children: [
                                Text(
                                  'التصنيفات',
                                  style: AppTextStyles.midDeepPrimaryColorStyle(
                                    context,
                                  ).copyWith(fontSize: context.sp(4.2)),
                                ),
                                SizedBox(height: context.h(7)),
                              ],
                            ).paddingOnlyRight(context, 1.5),
                            SizedBox(
                              height: context.h(8),
                              width: context.w(95),
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: home.classifications.length,
                                itemBuilder: (context, index) {
                                  final SharedPreferences prefs = getIt();
                                  final classifId = home.classifications[index].id;
                                  prefs.setInt("classifId",classifId);
                                  return CatigoriesCard(
                                    image:
                                        classificationImages[home
                                            .classifications[index]
                                            .classification] ??
                                        AppAssets.logo,
                                    title: home
                                        .classifications[index]
                                        .classification,
                                    onTap: () {
                                      GoRouter.of(context).push(
                                        '/BooksPage',
                                        extra: home.classifications[index].id,
                                      );
                                    },
                                  ).paddingAll(context, 0.6);
                                },
                              ),
                            ),
                            SizedBox(height: context.h(2.5)),
                            Row(
                              children: [
                                Text(
                                  'استكشف الميزات',
                                  style: AppTextStyles.midDeepPrimaryColorStyle(
                                    context,
                                  ).copyWith(fontSize: context.sp(4.2)),
                                ),
                              ],
                            ).paddingOnlyRight(context, 1.5),
                            SizedBox(height: context.h(1.5)),
                            SizedBox(
                              height: context.h(34),
                              width: context.w(95),
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: home.features.length,
                                itemBuilder: (context, index) {
                                  return SubjectCard(
                                    image:
                                        featureImages[home
                                            .features[index]
                                            .feature] ??
                                        AppAssets.logo,

                                    title: home.features[index].feature,

                                    subtitle:
                                        featureSubtitles[home
                                            .features[index]
                                            .feature] ??
                                        "",
                                    onTap: () {
                                      // GoRouter.of(context).push(
                                      //   '/BooksPage',
                                      //   extra: home.features[index].id,
                                      // );
                                    },
                                  ).paddingAll(context, 0.6);
                                },
                              ),
                            ),
                            SizedBox(height: context.h(2.5)),
                            Row(
                              children: [
                                Text(
                                  'آخر المقروءات',
                                  style: AppTextStyles.midDeepPrimaryColorStyle(
                                    context,
                                  ).copyWith(fontSize: context.sp(4.2)),
                                ),
                              ],
                            ).paddingOnlyRight(context, 1.5),
                            SizedBox(height: context.h(1.5)),
                            home.continueReading == null
                                ? Center(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                        vertical: context.h(2),
                                      ),
                                      child: Text(
                                        "لا يوجد كتاب تتابع قراءته حالياً",
                                        style: AppTextStyles.smallBlack54Style(
                                          context,
                                        ),
                                      ),
                                    ),
                                  )
                                : Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: AppColors.offWhite,
                                      gradient: LinearGradient(
                                        colors: [
                                          AppColors.baieg,
                                          AppColors.offWhite,
                                        ],
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 5,
                                          offset: Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                    child: ListTile(
                                      trailing: AuthButton(
                                        text: 'تابع القراءة',
                                        onPressed: () {
                                          GoRouter.of(context).push(
                                            '/SplitPdfAndSummaryPage',
                                            extra: PdfPageArgs(
                                              chapterId: home
                                                  .continueReading!
                                                  .chapterId,
                                              authorName: home
                                                  .continueReading!
                                                  .bookName,
                                            ),
                                          );
                                        },
                                        height: context.h(3.8),
                                        width: context.w(18),
                                        textStyle:
                                            AppTextStyles.authbuttonStyle(
                                              context,
                                            ).copyWith(
                                              fontSize: context.sp(3.2),
                                            ),
                                      ),

                                      leading: Container(
                                        height: context.h(6.6),
                                        width: context.w(10.4),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                          image: DecorationImage(
                                            image: NetworkImage(
                                              home.continueReading!.bookPhoto,
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),

                                      title: Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              home.continueReading!.bookName,
                                              style:
                                                  AppTextStyles.login3Style(
                                                    context,
                                                  ).copyWith(
                                                    fontSize: context.sp(3.4),
                                                  ),
                                            ),
                                          ),
                                          SizedBox(width: context.w(0.2)),
                                          Text(
                                            "(",
                                            style: AppTextStyles.login3Style(
                                              context,
                                            ),
                                          ),

                                          Text(
                                            home
                                                .continueReading!
                                                .classification,
                                            style:
                                                AppTextStyles.googleLoginStyle(
                                                  context,
                                                ).copyWith(
                                                  fontSize: context.sp(2.85),
                                                ),
                                          ),

                                          Text(
                                            ")",
                                            style: AppTextStyles.login3Style(
                                              context,
                                            ),
                                          ),
                                        ],
                                      ),

                                      subtitle: Text(
                                        home.continueReading!.chapterTitle,
                                        style: AppTextStyles.smallBlack54Style(
                                          context,
                                        ).copyWith(fontSize: context.sp(3.4)),
                                      ),
                                    ),
                                  ).paddingSymetricH(context, 3),

                            SizedBox(height: context.h(1.5)),
                          ],
                        ).paddingSymetricH(context, 2.5),
                      ),
                    ],
                  ).paddingSymetricH(context, 1),
                ),
              ),
            ],
          );
        }
        return SizedBox();
      },
    );
  }
}
