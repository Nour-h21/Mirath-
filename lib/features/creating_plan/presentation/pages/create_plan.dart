import 'package:flutter/material.dart';
import 'package:mirath/core/utils/extensions/context_extensions.dart';
import 'package:mirath/core/utils/extensions/widget_extensions.dart';

import '../../../../core/shared/widgets/cards/base_card.dart';
import '../../../../core/shared/widgets/cards/book_card.dart';
import '../../../../core/design/tokens/colors.dart';
import '../../../../core/shared/page/InternetModeCard.dart';
import '../../../../core/shared/page/in_background.dart';
import '../../../../core/shared/widgets/buttons/auth_button.dart';
import '../widgets/amount_bottom_sheet.dart';
import '../widgets/card_selector.dart';
import '../widgets/custom_selectable_chips.dart';
import '../widgets/plan_type_button.dart';
import '../widgets/reminder_bottom_sheet_alarm.dart';
import 'test.dart';

class CreatePlan extends StatefulWidget {
  const CreatePlan({super.key});

  @override
  State<CreatePlan> createState() => _CreatePlanState();
}

class _CreatePlanState extends State<CreatePlan> {
  bool isDailyPlan = true;
  int selectedDailyWird = 0;
  int selectedDurationDays = 0;
  List<String> selectedCategories = [];
  List<int> selectedBooks = [];
  List<String> selectedDays = [];
  bool dailyStudy = false;
  TimeOfDay? selectedTime;
  bool isOnline = false;

  final List<String> categories = [
    "عقيدة",
    "فقه",
    "حديث",
    "سيرة",
    "تفسير",
    // "أصول",
  ];

  final List<String> days = [
    "السبت",
    "الأحد",
    "الاثنين",
    "الثلاثاء",
    "الأربعاء",
    "الخمميس",
    "الجمعة",
  ];

  final List<BookModel> books = [
    BookModel(
      id: 1,
      title: "العقيدة الواسطية",
      category: "عقيدة",
      chapters: 12,
      image: "https://images.unsplash.com/photo-1544717305-2782549b5136",
    ),
    BookModel(
      id: 2,
      title: "الأصول الثلاثة",
      category: "عقيدة",
      chapters: 8,
      image: "https://images.unsplash.com/photo-1512820790803-83ca734da794",
    ),
    BookModel(
      id: 3,
      title: "رياض الصالحين",
      category: "حديث",
      chapters: 25,
      image: "https://images.unsplash.com/photo-1521587760476-6c12a4b040da",
    ),
  ];

  List<BookModel> get filteredBooks {
    if (selectedCategories.isEmpty) {
      return books;
    }

    return books
        .where((book) => selectedCategories.contains(book.category))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: InBackgroundPage(
            labelAppBar: "أنشئ خطتك",
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Container(
                  //   height: context.h(80),
                  //   decoration: BoxDecoration(
                  //         color: Colors.white,
                  //         borderRadius: BorderRadius.circular(
                  //           context.w(5),
                  //         ),
                  //         border: Border.all(
                  //           color: AppColors.offPink,
                  //         ),
                  //       ),
                  // child:
                  // Text(
                  //   'نوع الخطة',
                  //   style: TextStyle(
                  //     color: AppColors.deepPrimaryColor,
                  //     fontSize: context.sp(4),
                  //     fontFamily: 'Tajawal',
                  //     fontWeight: FontWeight.w800,
                  //   ),
                  // ),
                  // SizedBox(height: context.h(2)),
                  Text(
                    'حدد نوع الخطة',
                    style: TextStyle(
                      color: AppColors.deepPrimaryColor,
                      fontSize: context.sp(4),
                      fontFamily: 'Tajawal',
                      fontWeight: FontWeight.w800,
                    ),
                  ).paddingOnly(context, 65, 0, 0, 0),
                  SizedBox(height: context.h(2)),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      PlanTypeButton(
                        title: "ورد يومي",
                        selected: isDailyPlan,
                        subtitle: "تحديد عدد الأبواب يومياً",
                        onTap: () {
                          setState(() {
                            isDailyPlan = true;
                          });
                        },
                      ),
                      SizedBox(width: context.w(3)),
                      PlanTypeButton(
                        title: "مدة معينة",
                        selected: !isDailyPlan,
                        subtitle: "تحديد عدد الأيام",
                        onTap: () {
                          setState(() {
                            isDailyPlan = false;
                          });
                        },
                      ),
                    ],
                  ),

                  SizedBox(height: context.h(2)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        child: CardSelector(
                          title: isDailyPlan
                              ? "مقدار الورد اليومي"
                              : "مدة الخطة",

                          value: isDailyPlan
                              ? (selectedDailyWird > 0
                                    ? "$selectedDailyWird باب"
                                    : null)
                              : (selectedDurationDays > 0
                                    ? "$selectedDurationDays يوم"
                                    : null),

                          onTap: () async {
                            final value = await showAmountBottomSheet(
                              context,
                              title: isDailyPlan
                                  ? "مقدار الورد اليومي"
                                  : "مدة الخطة",
                              initialValue: isDailyPlan
                                  ? (selectedDailyWird == 0
                                        ? 1
                                        : selectedDailyWird)
                                  : (selectedDurationDays == 0
                                        ? 1
                                        : selectedDurationDays),
                              maxValue: isDailyPlan ? 50 : 365,
                            );

                            if (value != null) {
                              setState(() {
                                if (isDailyPlan) {
                                  selectedDailyWird = value;
                                } else {
                                  selectedDurationDays = value;
                                }
                              });
                            }
                          },
                        ),
                      ),

                      // SizedBox(height: context.h(1.5)),
                      BaseCard(
                        width: context.w(44),
                        borderColor: AppColors.primaryColor,
                        gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [AppColors.baieg, AppColors.offWhite],
                        ),
                        child: Row(
                          children: [
                            Text(
                              isDailyPlan
                                  ? "عدد الأيام المتوقع"
                                  : "عدد الأبواب المطلوب",
                              style: TextStyle(
                                fontSize: context.sp(3),
                                fontWeight: FontWeight.w500,
                              ),
                            ),

                            const Spacer(),

                            Text(
                              isDailyPlan
                                  ? (selectedDailyWird > 0
                                        ? "${60 ~/ selectedDailyWird} يوم"
                                        : "-")
                                  : (selectedDurationDays > 0
                                        ? "${(60 / selectedDurationDays).ceil()} باب"
                                        : "-"),
                              style: TextStyle(
                                color: AppColors.deepPrimaryColor,
                                fontSize: context.sp(3.3),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: context.h(1.5)),

                  ReminderSelectorCard(
                    selectedTime: selectedTime,

                    onAddOrEdit: () async {
                      final picked = await showTimePicker(
                        context: context,
                        initialTime: selectedTime ?? TimeOfDay.now(),
                      );

                      if (picked != null) {
                        setState(() {
                          selectedTime = picked;
                        });
                      }
                    },

                    onDelete: () {
                      setState(() {
                        selectedTime = null;
                      });
                    },
                  ),

                  SizedBox(height: context.h(1.5)),
                  InternetModeCard(
                    isOnline: isOnline,
                    onChanged: (value) {
                      setState(() {
                        isOnline = value;
                      });
                    },
                  ),
                  SizedBox(height: context.h(5)),
                  Text(
                    'حدد التصنيف',
                    style: TextStyle(
                      color: AppColors.deepPrimaryColor,
                      fontSize: context.sp(4),
                      fontFamily: 'Tajawal',
                      fontWeight: FontWeight.w800,
                    ),
                  ).paddingOnly(context, 68, 0, 0, 0),

                  SizedBox(height: context.h(2)),

                  CustomSelectableChips(
                    items: categories,
                    selectedItems: selectedCategories,
                    onTap: (category) {
                      setState(() {
                        selectedCategories.contains(category)
                            ? selectedCategories.remove(category)
                            : selectedCategories.add(category);
                      });
                    },
                  ),
                  SizedBox(height: context.h(2)),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: context.h(1)),
                    height: 1,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.transparent,
                          AppColors.primaryColor.withOpacity(.3),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: context.h(3)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'اختر الكتب',
                        style: TextStyle(
                          color: AppColors.deepPrimaryColor,
                          fontSize: context.sp(4),
                          fontFamily: 'Tajawal',
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(width: context.w(2)),
                      Text(
                        '${filteredBooks.length} متاحة',
                        style: TextStyle(
                          color: AppColors.deepPrimaryColor,
                          fontSize: context.sp(3.1),
                          fontFamily: 'Tajawal',
                          fontWeight: FontWeight.w500,
                        ),
                      ).paddingOnly(context, 2, 0, 0, 0),
                    ],
                  ),
                  SizedBox(height: context.h(2)),
                  ...filteredBooks.map(
                    (book) => BookCard(
                      title: book.title,
                      image: book.image,
                      subtitle: book.category,

                      trailing: InkWell(
                        onTap: () {
                          setState(() {
                            selectedBooks.contains(book.id)
                                ? selectedBooks.remove(book.id)
                                : selectedBooks.add(book.id);
                          });
                        },
                        child: Icon(
                          selectedBooks.contains(book.id)
                              ? Icons.check_circle
                              : Icons.circle_outlined,
                          color: AppColors.primaryColor,
                          size: context.w(5),
                        ),
                      ),
                    ).paddingOnly(context, 3, 3, 0, 3),
                  ),
                  SizedBox(height: context.h(5)),

                  // Column(
                  //   children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'حدد أيام الدراسة',
                        style: TextStyle(
                          color: AppColors.deepPrimaryColor,
                          fontSize: context.sp(4),
                          fontFamily: 'Tajawal',
                          fontWeight: FontWeight.w800,
                        ),
                      ),

                      Row(
                        children: [
                          Text(
                            "يومياً",
                            style: TextStyle(
                              color: AppColors.deepPrimaryColor,
                              fontSize: context.sp(3.2),
                              fontFamily: 'Tajawal',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(width: context.w(2)),
                          Transform.scale(
                            scale: 0.8,
                            child: Switch(
                              value: dailyStudy,
                              // 👇 لون عند التشغيل
                              activeColor: AppColors.offWhite,
                              activeTrackColor:
                                  AppColors.primaryColor, // الخلفية لما ON
                              // 👇 لون عند الإطفاء
                              inactiveThumbColor: AppColors.grey,
                              inactiveTrackColor: AppColors.transparent,
                              // activeColor: AppColors.primaryColor,
                              onChanged: (value) {
                                setState(() {
                                  dailyStudy = value;

                                  if (value) {
                                    selectedDays = List.from(days);
                                  } else {
                                    selectedDays.clear();
                                  }
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  SizedBox(height: context.h(2)),

                  CustomSelectableChips(
                    items: days,
                    selectedItems: selectedDays,
                    spacing: context.w(1.4),
                    runSpacing: context.h(0.8),
                    onTap: (day) {
                      setState(() {
                        selectedDays.contains(day)
                            ? selectedDays.remove(day)
                            : selectedDays.add(day);

                        dailyStudy = selectedDays.length == days.length;
                      });
                    },
                  ).paddingOnly(context, 0.3, 0.2, 0, 0),

                  SizedBox(height: context.h(2)),

                  SizedBox(height: context.h(5)),
                  Center(
                    child: AuthButton(
                      text: 'إنشاء الخطة',
                      onPressed: () {},
                      height: context.h(5),
                      width: context.w(60),
                    ),
                  ),
                ],
              ).paddingOnly(context, 4, 4, 0, 8),
            ),
          ),
        ),
      ),
    );
  }
}
