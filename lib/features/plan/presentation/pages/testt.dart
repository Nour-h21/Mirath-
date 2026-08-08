// import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:mirath/core/design/tokens/colors.dart';
import 'package:mirath/core/shared/widgets/buttons/auth_button.dart';
import 'package:mirath/core/utils/extensions/context_extensions.dart';
import 'package:mirath/core/utils/extensions/widget_extensions.dart';

import '../../../../core/shared/page/in_background.dart';
import '../../../../core/shared/widgets/buttons/in_button.dart';

class DailySchedulePage extends StatelessWidget {
  const DailySchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const DailyScheduleView();
  }
}

class DailyScheduleView extends StatefulWidget {
  const DailyScheduleView({super.key});

  @override
  State<DailyScheduleView> createState() => _DailyScheduleViewState();
}

class _DailyScheduleViewState extends State<DailyScheduleView> {
  DateTime selectedDate = DateTime.now();

  final Map<String, List<TaskItem>> tasks = {
    "2026-08-20": [
      TaskItem(
        title: "الباب الثالث: العقد المدني",
        subtitle: "تفسير الميسر - 15 دقيقة",
      ),
      TaskItem(
        title: "حفظ 5 أحاديث جديدة",
        subtitle: "الأربعون النووية - 20 دقيقة",
        done: true,
      ),
    ],
    "2026-08-21": [
      TaskItem(
        title: "الباب الثالث: العقد المدني",
        subtitle: "تفسير الميسر - 15 دقيقة",
      ),
      TaskItem(
        title: "حفظ 5 أحاديث جديدة",
        subtitle: "الأربعون النووية - 20 دقيقة",
        done: true,
      ),
    ],
  };

  String format(DateTime d) =>
      "${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}";

  @override
  Widget build(BuildContext context) {
    final key = format(selectedDate);
    final dayTasks = tasks[key] ?? [];

    final hasSession = dayTasks.isNotEmpty; // شرط الجلسة

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFF6F6F6),
        // appBar: AppBar(
        //   title: const Text("مهامي اليومية"),
        //   centerTitle: true,
        //   backgroundColor: Colors.white,
        //   foregroundColor: Colors.black,
        //   elevation: 0,
        // ),
        body: InBackgroundPage(
          labelAppBar: "مهامي اليومية",
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ScheduleCalendarWidget(
                selectedDate: selectedDate,
                onDateChanged: (date) {
                  setState(() {
                    selectedDate = date;
                    print(selectedDate);
                  });
                },
              ),

              SizedBox(height: context.h(4)),

              SessionCardWidget(
                sessionText: hasSession ? "9:30 مساء - نقاش المتن" : null,
              ),
              SizedBox(height: context.h(4)),
              Row(
                children: [
                  // Icon(),
                  Text(
                    'مهام اليوم التعليمية',
                    style: TextStyle(
                      color: AppColors.deepPrimaryColor,
                      fontSize: context.sp(4),
                      fontFamily: 'Tajawal',
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),

              Expanded(
                child: dayTasks.isEmpty
                    ? const Center(child: Text("لا توجد مهام لهذا اليوم"))
                    : ListView.builder(
                        padding: const EdgeInsets.all(16),
                        itemCount: dayTasks.length,
                        itemBuilder: (context, index) {
                          final task = dayTasks[index];

                          return TaskItemWidget(
                            task: task,
                            onToggle: () {
                              setState(() {
                                task.done = !task.done;
                              });
                            },
                          );
                        },
                      ),
              ),
            ],
          ).paddingOnly(context, 1, 1, 6, 0),
        ),
      ),
    );
  }
}

// import 'package:calendar_timeline/calendar_timeline.dart';
// import 'package:flutter/material.dart';

// class DailySchedulePage extends StatelessWidget {
//   const DailySchedulePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const DailyScheduleView();
//   }
// }

// class DailyScheduleView extends StatefulWidget {
//   const DailyScheduleView({super.key});

//   @override
//   State<DailyScheduleView> createState() => _DailyScheduleViewState();
// }

// class _DailyScheduleViewState extends State<DailyScheduleView> {
//   DateTime selectedDate = DateTime.now();

//   final Map<String, List<TaskItem>> tasks = {
//     "2026-06-20": [
//       TaskItem(
//         title: "الباب الثالث: العقد المدني",
//         subtitle: "تفسير الميسر - 15 دقيقة",
//         done: false,
//       ),
//       TaskItem(
//         title: "حفظ 5 أحاديث جديدة",
//         subtitle: "الأربعون النووية - 20 دقيقة",
//         done: true,
//       ),
//     ],
//   };

//   String format(DateTime d) =>
//       "${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}";

//   @override
//   Widget build(BuildContext context) {
//     final key = format(selectedDate);
//     final dayTasks = tasks[key] ?? [];

//     return Scaffold(
//       backgroundColor: const Color(0xFFF6F6F6),
//       appBar: AppBar(
//         title: const Text("مهامي اليومية"),
//         centerTitle: true,
//         backgroundColor: Colors.white,
//         foregroundColor: Colors.black,
//         elevation: 0,
//       ),
//       body: Column(
//         children: [
//           /// 📅 TOP CALENDAR STRIP
//           Container(
//             padding: const EdgeInsets.symmetric(vertical: 10),
//             child: CalendarTimeline(
//               initialDate: selectedDate,
//               firstDate: DateTime(2020),
//               lastDate: DateTime(2030),
//               onDateSelected: (date) {
//                 setState(() {
//                   selectedDate = date;
//                 });
//               },
//               leftMargin: 20,
//               monthColor: Colors.grey,
//               dayColor: Colors.black,
//               activeDayColor: Colors.white,
//               activeBackgroundDayColor: const Color(0xFF8E3B5E),
//               // dotsColor: const Color(0xFF8E3B5E),
//               locale: 'en',
//             ),
//           ),

//           const SizedBox(height: 10),

//           /// 📌 SESSION CARD
//           if (dayTasks.isNotEmpty)
//             Container(
//               margin: const EdgeInsets.symmetric(horizontal: 16),
//               padding: const EdgeInsets.all(16),
//               decoration: BoxDecoration(
//                 gradient: const LinearGradient(
//                   colors: [Color(0xFFB56B7A), Color(0xFF8E3B5E)],
//                 ),
//                 borderRadius: BorderRadius.circular(16),
//               ),
//               child: const Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     "9:30 مساء - نقاش المتن",
//                     style: TextStyle(color: Colors.white),
//                   ),
//                   Chip(
//                     label: Text("انضم الآن"),
//                     backgroundColor: Colors.white,
//                   )
//                 ],
//               ),
//             ),

//           const SizedBox(height: 10),

//           /// 📋 TASK LIST
//           Expanded(
//             child: dayTasks.isEmpty
//                 ? const Center(
//                     child: Text("لا توجد مهام لهذا اليوم"),
//                   )
//                 : ListView.builder(
//                     padding: const EdgeInsets.all(16),
//                     itemCount: dayTasks.length,
//                     itemBuilder: (context, index) {
//                       final task = dayTasks[index];

//                       return Container(
//                         margin: const EdgeInsets.only(bottom: 12),
//                         padding: const EdgeInsets.all(14),
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(16),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.black.withOpacity(0.05),
//                               blurRadius: 10,
//                             )
//                           ],
//                         ),
//                         child: Row(
//                           children: [
//                             const Icon(Icons.drag_indicator),

//                             const SizedBox(width: 10),

//                             Expanded(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     task.title,
//                                     style: const TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                   const SizedBox(height: 4),
//                                   Text(
//                                     task.subtitle,
//                                     style: const TextStyle(
//                                       color: Colors.grey,
//                                       fontSize: 12,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),

//                             GestureDetector(
//                               onTap: () {
//                                 setState(() {
//                                   task.done = !task.done;
//                                 });
//                               },
//                               child: AnimatedContainer(
//                                 duration: const Duration(milliseconds: 200),
//                                 width: 26,
//                                 height: 26,
//                                 decoration: BoxDecoration(
//                                   shape: BoxShape.circle,
//                                   border: Border.all(
//                                     color: const Color(0xFF8E3B5E),
//                                   ),
//                                   color: task.done
//                                       ? const Color(0xFF8E3B5E)
//                                       : Colors.transparent,
//                                 ),
//                                 child: task.done
//                                     ? const Icon(
//                                         Icons.check,
//                                         color: Colors.white,
//                                         size: 16,
//                                       )
//                                     : null,
//                               ),
//                             ),
//                           ],
//                         ),
//                       );
//                     },
//                   ),
//           ),
//         ],
//       ),
//     );
//   }
// }

/// 🧾 MODEL
class TaskItem {
  String title;
  String subtitle;
  bool done;

  TaskItem({required this.title, required this.subtitle, this.done = false});
}

// class ScheduleCalendarWidget extends StatelessWidget {
//   final DateTime selectedDate;
//   final Function(DateTime) onDateChanged;

//   const ScheduleCalendarWidget({
//     super.key,
//     required this.selectedDate,
//     required this.onDateChanged,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(
//         vertical: context.h(1.2),
//         horizontal: context.w(1),
//       ),
//       decoration: BoxDecoration(
//         // color: AppColors.primaryColor,
//         gradient: LinearGradient(
//           begin: Alignment.topRight,
//           end: Alignment.bottomLeft,
//           colors: [Color(0XFFf5eada), AppColors.offWhite],
//         ),
//         borderRadius: BorderRadius.circular(context.w(6)),
//         // border: Border.all(color: AppColors.primaryColor,width: context.w(1) ),
//         border: Border(
//           top: BorderSide(color: AppColors.primaryColor, width: context.w(0.5)),
//           bottom: BorderSide(
//             color: AppColors.primaryColor,
//             width: context.w(0.5),
//           ),
//         ),
//       ),
//       child: CalendarTimeline(
//         initialDate: selectedDate,
//         firstDate: DateTime(2020),
//         lastDate: DateTime(2030),
//         onDateSelected: onDateChanged,

//         leftMargin: 20,
//         monthColor: Colors.grey,
//         dayColor: Colors.black,

//         activeDayColor: AppColors.offWhite,
//         activeBackgroundDayColor: AppColors.primaryColor,

//         locale: 'ar',

//         // 👇 أهم شي
//         shrink: false, // إذا مدعومة عندك
//       ),
//     ).paddingOnly(context, 2, 2, 0, 0);
//   }
// }


class ScheduleCalendarWidget extends StatelessWidget {
  final DateTime selectedDate;
  final ValueChanged<DateTime> onDateChanged;

  const ScheduleCalendarWidget({
    super.key,
    required this.selectedDate,
    required this.onDateChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: context.h(1.2),
        horizontal: context.w(1),
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            const Color(0XFFF5EADA),
            AppColors.offWhite,
          ],
        ),
        borderRadius: BorderRadius.circular(context.w(6)),
        border: Border(
          top: BorderSide(
            color: AppColors.primaryColor,
            width: context.w(0.5),
          ),
          bottom: BorderSide(
            color: AppColors.primaryColor,
            width: context.w(0.5),
          ),
        ),
      ),
      child: EasyDateTimeLine(
        initialDate: selectedDate,
        locale: 'ar',

       

        activeColor: AppColors.primaryColor,

        onDateChange: onDateChanged,

        headerProps: const EasyHeaderProps(
          showHeader: false,
        ),

        dayProps: EasyDayProps(
          height: context.h(9),
          width: context.w(15),

          activeDayStyle: DayStyle(
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(16),
            ),
            dayNumStyle: TextStyle(
              color: AppColors.offWhite,
              fontWeight: FontWeight.bold,
            ),
            dayStrStyle: TextStyle(
              color: AppColors.offWhite,
              fontWeight: FontWeight.w600,
            ),
            monthStrStyle: TextStyle(
              color: AppColors.offWhite,
            ),
          ),

          inactiveDayStyle: DayStyle(
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(16),
            ),
            dayNumStyle: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            dayStrStyle: const TextStyle(
              color: Colors.black54,
            ),
            monthStrStyle: const TextStyle(
              color: Colors.grey,
            ),
          ),
        ),
      ),
    ).paddingOnly(context, 2, 2, 0, 0);
  }
}

class SessionCardWidget extends StatelessWidget {
  final String? sessionText;

  const SessionCardWidget({super.key, this.sessionText});

  @override
  Widget build(BuildContext context) {
    if (sessionText == null || sessionText!.isEmpty) {
      return const SizedBox.shrink();
    }

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          // colors: [Color(0xFFB56B7A), Color(0xFF8E3B5E)],
          colors: [Color.fromARGB(255, 156, 92, 104), AppColors.primaryColor],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "جلسة جماعية قادمة",
            style: TextStyle(
              color: AppColors.offWhite,
              fontSize: context.sp(3.2),
            ),
          ),
          SizedBox(height: context.h(0.6)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                sessionText!,
                style: TextStyle(
                  color: AppColors.offWhite,
                  fontSize: context.sp(4.5),
                  fontWeight: FontWeight.w600,
                ),
              ),
              InButton(
                height: context.h(4),
                onPressed: () {},
                width: context.w(25),

                text: "انضم الآن",
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TaskItemWidget extends StatelessWidget {
  final TaskItem task;
  final VoidCallback onToggle;

  const TaskItemWidget({super.key, required this.task, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.offWhite,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10),
        ],
      ),
      child: Row(
        children: [
          const Icon(Icons.drag_indicator),
          const SizedBox(width: 10),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task.title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  task.subtitle,
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
          ),

          GestureDetector(
            onTap: onToggle,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 26,
              height: 26,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0xFF8E3B5E)),
                color: task.done ? const Color(0xFF8E3B5E) : Colors.transparent,
              ),
              child: task.done
                  ? const Icon(Icons.check, color: Colors.white, size: 16)
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}
