import 'package:flutter/material.dart';
import 'package:mirath/core/utils/extensions/context_extensions.dart';

class StudyPlanView extends StatelessWidget {
  const StudyPlanView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F7F4),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(context.w(4)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// Header
              Container(
                padding: EdgeInsets.all(context.w(5)),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  gradient: const LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Color(0xffC78B9B),
                      Color(0xff8F3D56),
                    ],
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "الخطة التعليمية",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: context.sp(2.1),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: context.h(1)),
                          Text(
                            "تم إنجاز 8 من أصل 12 مهمة",
                            style: TextStyle(
                              color: Colors.white.withOpacity(.9),
                              fontSize: context.sp(1.5),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      width: 80,
                      height: 80,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          CircularProgressIndicator(
                            value: 0.68,
                            strokeWidth: 8,
                            backgroundColor: Colors.white24,
                            valueColor:
                                const AlwaysStoppedAnimation(Colors.white),
                          ),
                          Center(
                            child: Text(
                              "68%",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: context.sp(1.7),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: context.h(2)),

              /// Session Card
              Container(
                padding: EdgeInsets.all(context.w(4)),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xffD5A2AF),
                      Color(0xff9B4863),
                    ],
                  ),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.schedule,
                      color: Colors.white,
                    ),

                    SizedBox(width: context.w(3)),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "الجلسة القادمة",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: context.sp(1.3),
                            ),
                          ),
                          SizedBox(height: context.h(.4)),
                          Text(
                            "9:30 مساءً - نقاش المتن",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: context.sp(1.8),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: const Color(0xff9B4863),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text("انضم الآن"),
                    )
                  ],
                ),
              ),

              SizedBox(height: context.h(2)),

              /// Statistics
              Row(
                children: [
                  Expanded(
                    child: _statCard(
                      context,
                      title: "المهام",
                      value: "12",
                      icon: Icons.task_alt,
                    ),
                  ),
                  SizedBox(width: context.w(3)),
                  Expanded(
                    child: _statCard(
                      context,
                      title: "مكتملة",
                      value: "8",
                      icon: Icons.check_circle,
                    ),
                  ),
                  SizedBox(width: context.w(3)),
                  Expanded(
                    child: _statCard(
                      context,
                      title: "متبقية",
                      value: "4",
                      icon: Icons.pending_actions,
                    ),
                  ),
                ],
              ),

              SizedBox(height: context.h(3)),

              Text(
                "السبت، 6 مايو",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: context.sp(1.5),
                ),
              ),

              SizedBox(height: context.h(2)),

              /// Timeline
              _PlanTaskCard(
                isCompleted: true,
                title: "الباب الثالث: العهد المدني",
                subtitle: "تفسير الميسر • 15 دقيقة",
              ),

              _PlanTaskCard(
                isCompleted: true,
                title: "مراجعة الباب الثاني",
                subtitle: "تم الإنجاز • 10:00 ص",
              ),

              _PlanTaskCard(
                isCompleted: false,
                title: "الوحدة الجديدة",
                subtitle: "الأربعون النووية • 20 دقيقة",
              ),

              _PlanTaskCard(
                isCompleted: false,
                title: "اختبار قصير",
                subtitle: "بعد إنهاء الوحدة",
              ),

              SizedBox(height: context.h(2)),

              /// Achievements
              Container(
                padding: EdgeInsets.all(context.w(4)),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(22),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10,
                      color: Colors.black.withOpacity(.05),
                    )
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.emoji_events,
                          color: Colors.amber.shade700,
                        ),
                        SizedBox(width: context.w(2)),
                        Text(
                          "إنجازاتك",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: context.sp(1.8),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: context.h(2)),
                    const Divider(),
                    SizedBox(height: context.h(1)),
                    _achievementTile(
                      "🔥",
                      "سلسلة تعلم",
                      "5 أيام متتالية",
                    ),
                    _achievementTile(
                      "📚",
                      "وقت الدراسة",
                      "12 ساعة",
                    ),
                    _achievementTile(
                      "🏆",
                      "المهام المكتملة",
                      "8 مهام",
                    ),
                  ],
                ),
              ),

              SizedBox(height: context.h(3)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _statCard(
    BuildContext context, {
    required String title,
    required String value,
    required IconData icon,
  }) {
    return Container(
      padding: EdgeInsets.all(context.w(3)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: [
          Icon(icon),
          SizedBox(height: context.h(.5)),
          Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: context.sp(2),
            ),
          ),
          Text(
            title,
            style: TextStyle(
              color: Colors.grey,
              fontSize: context.sp(1.3),
            ),
          ),
        ],
      ),
    );
  }

  Widget _achievementTile(
    String emoji,
    String title,
    String value,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Text(
            emoji,
            style: const TextStyle(fontSize: 22),
          ),
          const SizedBox(width: 12),
          Expanded(child: Text(title)),
          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}

class _PlanTaskCard extends StatelessWidget {
  final bool isCompleted;
  final String title;
  final String subtitle;

  const _PlanTaskCard({
    required this.isCompleted,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [

          Column(
            children: [
              Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isCompleted
                      ? const Color(0xff8F3D56)
                      : Colors.white,
                  border: Border.all(
                    color: const Color(0xff8F3D56),
                    width: 2,
                  ),
                ),
                child: isCompleted
                    ? const Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 16,
                      )
                    : null,
              ),
              Expanded(
                child: Container(
                  width: 2,
                  color: Colors.grey.shade300,
                ),
              ),
            ],
          ),

          SizedBox(width: context.w(3)),

          Expanded(
            child: Container(
              margin: EdgeInsets.only(bottom: context.h(2)),
              padding: EdgeInsets.all(context.w(4)),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    color: Colors.black.withOpacity(.05),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: context.sp(1.7),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: context.h(.5)),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: context.sp(1.4),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}




// class StudyPlanView extends StatelessWidget {
//   const StudyPlanView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xffF8F7F4),
//       appBar: AppBar(
//         title: const Text("الخطة التعليمية"),
//         centerTitle: true,
//         elevation: 0,
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           children: [

//             /// Header
//             Container(
//               width: double.infinity,
//               padding: const EdgeInsets.all(20),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(24),
//                 gradient: const LinearGradient(
//                   colors: [
//                     Color(0xffC18A98),
//                     Color(0xff91445C),
//                   ],
//                 ),
//               ),
//               child: const Column(
//                 children: [
//                   Text(
//                     "الخطة الحالية",
//                     style: TextStyle(
//                       color: Colors.white70,
//                     ),
//                   ),
//                   SizedBox(height: 8),
//                   Text(
//                     "ورد يومي",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 16),

//             /// Details
//             _InfoCard(
//               title: "تفاصيل الخطة",
//               children: const [
//                 _InfoTile(
//                   icon: Icons.menu_book,
//                   title: "الورد",
//                   value: "3 صفحات يومياً",
//                 ),
//                 _InfoTile(
//                   icon: Icons.alarm,
//                   title: "التنبيه",
//                   value: "09:30 مساءً",
//                 ),
//                 _InfoTile(
//                   icon: Icons.category,
//                   title: "التصنيف",
//                   value: "العقيدة",
//                 ),
//               ],
//             ),

//             const SizedBox(height: 16),

//             /// Study Days
//             _InfoCard(
//               title: "أيام الدراسة",
//               children: [
//                 Wrap(
//                   spacing: 8,
//                   runSpacing: 8,
//                   children: [
//                     _dayChip("السبت"),
//                     _dayChip("الأحد"),
//                     _dayChip("الثلاثاء"),
//                     _dayChip("الخميس"),
//                   ],
//                 ),
//               ],
//             ),

//             const SizedBox(height: 16),

//             /// Progress
//             _InfoCard(
//               title: "نسبة الالتزام",
//               children: const [
//                 SizedBox(height: 10),
//                 LinearProgressIndicator(
//                   value: .68,
//                 ),
//                 SizedBox(height: 10),
//                 Center(
//                   child: Text(
//                     "68%",
//                     style: TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 )
//               ],
//             ),

//             const SizedBox(height: 16),

//             /// Today Session
//             Container(
//               width: double.infinity,
//               padding: const EdgeInsets.all(20),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(24),
//               ),
//               child: Column(
//                 children: [
//                   const Text(
//                     "جلسة اليوم",
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 18,
//                     ),
//                   ),

//                   const SizedBox(height: 12),

//                   const Text(
//                     "كتاب التوحيد",
//                     style: TextStyle(
//                       fontSize: 16,
//                     ),
//                   ),

//                   const SizedBox(height: 20),

//                   SizedBox(
//                     width: double.infinity,
//                     child: ElevatedButton(
//                       onPressed: () {},
//                       child: const Text(
//                         "ابدأ الدراسة",
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _dayChip(String title) {
//     return Chip(
//       label: Text(title),
//     );
//   }
// }

// class _InfoCard extends StatelessWidget {
//   final String title;
//   final List<Widget> children;

//   const _InfoCard({
//     required this.title,
//     required this.children,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.all(18),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(24),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             title,
//             style: const TextStyle(
//               fontWeight: FontWeight.bold,
//               fontSize: 17,
//             ),
//           ),
//           const SizedBox(height: 12),
//           ...children,
//         ],
//       ),
//     );
//   }
// }

// class _InfoTile extends StatelessWidget {
//   final IconData icon;
//   final String title;
//   final String value;

//   const _InfoTile({
//     required this.icon,
//     required this.title,
//     required this.value,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       contentPadding: EdgeInsets.zero,
//       leading: Icon(icon),
//       title: Text(title),
//       trailing: Text(
//         value,
//         style: const TextStyle(
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//     );
//   }
// }