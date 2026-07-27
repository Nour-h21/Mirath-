import 'package:flutter/material.dart';
import 'package:mirath/core/design/tokens/colors.dart';
import 'package:mirath/core/utils/extensions/context_extensions.dart';

import '../../../../core/shared/widgets/cards/base_card.dart';


// class ReminderBottomSheet extends StatefulWidget {
//   const ReminderBottomSheet({super.key});

//   @override
//   State<ReminderBottomSheet> createState() => _ReminderBottomSheetState();
// }

// class _ReminderBottomSheetState extends State<ReminderBottomSheet> {
//   final List<TimeOfDay> selectedTimes = [];

//   @override
//   Widget build(BuildContext context) {
//     return CustomBottomSheetContainer(
//       height: context.h(50),
//       child: Directionality(
//         textDirection: TextDirection.rtl,
//         child: Column(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       "إضافة منبه",
//                       style: TextStyle(
//                         color: AppColors.deepPrimaryColor,
//                         fontSize: context.sp(4),
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),

//                     Text(
//                       "اضغط على الجرس لإضافة وقت جديد",
//                       style: TextStyle(
//                         color: Colors.grey,
//                         fontSize: context.sp(2.7),
//                       ),
//                     ),
//                   ],
//                 ),

//                 IconButton(
//                   onPressed: () async {
//                     final picked = await showTimePicker(
//                       context: context,
//                       initialTime: TimeOfDay.now(),
//                     );

//                     if (picked != null) {
//                       setState(() {
//                         selectedTimes.add(picked);
//                       });
//                     }
//                   },
//                   icon: Icon(Icons.add_alarm, color: AppColors.primaryColor),
//                 ),
//               ],
//             ),

//             SizedBox(height: context.h(2)),

//             Expanded(
//               child: ListView.builder(
//                 itemCount: selectedTimes.length,
//                 itemBuilder: (context, i) {
//                   return ReminderCard(time: selectedTimes[i]);
//                 },
//               ),
//             ),

//             SizedBox(height: context.h(2)),

//             AuthButton(
//               text: 'حفظ',
//               onPressed: () {
//                 Navigator.pop(context, selectedTimes);
//               },
//               height: context.h(5.5),
//               width: context.w(65),
//             ),

//             SizedBox(height: context.h(1)),
//           ],
//         ),
//       ),
//     );
//   }
// }

// Future<List<TimeOfDay>?> showReminderBottomSheet(BuildContext context) {
//   return showModalBottomSheet<List<TimeOfDay>>(
//     context: context,
//     backgroundColor: Colors.transparent,
//     isScrollControlled: true,
//     builder: (_) => const ReminderBottomSheet(),
//   );
// }


// class ReminderBottomSheet extends StatefulWidget {
//   const ReminderBottomSheet({super.key});

//   @override
//   State<ReminderBottomSheet> createState() => _ReminderBottomSheetState();
// }

// class _ReminderBottomSheetState extends State<ReminderBottomSheet> {
//   TimeOfDay? selectedTime;

//   Future<void> pickTime() async {
//     final picked = await showTimePicker(
//       context: context,
//       initialTime: selectedTime ?? TimeOfDay.now(),
//     );

//     if (picked != null) {
//       setState(() {
//         selectedTime = picked;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return CustomBottomSheetContainer(
//       height: context.h(45),
//       child: Directionality(
//         textDirection: TextDirection.rtl,
//         child: Column(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       "إضافة منبه",
//                       style: TextStyle(
//                         color: AppColors.deepPrimaryColor,
//                         fontSize: context.sp(4),
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),

//                     Text(
//                       selectedTime == null
//                           ? "اضغط على الجرس لإضافة منبه"
//                           : "يمكنك تعديل وقت المنبه",
//                       style: TextStyle(
//                         color: Colors.grey,
//                         fontSize: context.sp(2.7),
//                       ),
//                     ),
//                   ],
//                 ),

//                 IconButton(
//                   onPressed: pickTime,
//                   icon: Icon(
//                     Icons.add_alarm,
//                     color: AppColors.primaryColor,
//                     size: context.sp(6),
//                   ),
//                 ),
//               ],
//             ),

//             SizedBox(height: context.h(3)),

//             Expanded(
//               child: Center(
//                 child: selectedTime == null
//                     ? Text(
//                         "لم يتم إضافة أي منبه بعد",
//                         style: TextStyle(
//                           color: Colors.grey,
//                           fontSize: context.sp(3.2),
//                         ),
//                       )
//                     : Container(
//                         width: double.infinity,
//                         padding: EdgeInsets.symmetric(
//                           horizontal: context.w(4),
//                           vertical: context.h(1.5),
//                         ),
//                         decoration: BoxDecoration(
//                           color: AppColors.offWhite,
//                           borderRadius: BorderRadius.circular(
//                             context.w(5),
//                           ),
//                           border: Border.all(
//                             color: AppColors.primaryColor.withOpacity(.3),
//                           ),
//                         ),
//                         child: Row(
//                           children: [
//                             Icon(
//                               Icons.notifications_active,
//                               color: AppColors.primaryColor,
//                             ),

//                             SizedBox(width: context.w(3)),

//                             Text(
//                               selectedTime!.format(context),
//                               style: TextStyle(
//                                 fontSize: context.sp(3.7),
//                                 fontWeight: FontWeight.w600,
//                               ),
//                             ),

//                             const Spacer(),

//                             IconButton(
//                               onPressed: () {
//                                 setState(() {
//                                   selectedTime = null;
//                                 });
//                               },
//                               icon: const Icon(
//                                 Icons.delete_outline,
//                                 color: Colors.red,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//               ),
//             ),

//             AuthButton(
//               text: 'حفظ',
//               onPressed: () {
//                 Navigator.pop(context, selectedTime);
//               },
//               height: context.h(5.5),
//               width: context.w(65),
//             ),

//             SizedBox(height: context.h(1)),
//           ],
//         ),
//       ),
//     );
//   }
// }

// Future<TimeOfDay?> showReminderBottomSheet(
//   BuildContext context,
// ) {
//   return showModalBottomSheet<TimeOfDay>(
//     context: context,
//     backgroundColor: Colors.transparent,
//     isScrollControlled: true,
//     builder: (_) => const ReminderBottomSheet(),
//   );
// }


// class ReminderTimeChip extends StatelessWidget {
//   final TimeOfDay time;
//   final VoidCallback onDelete;

//   const ReminderTimeChip({
//     super.key,
//     required this.time,
//     required this.onDelete,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(
//         horizontal: context.w(3),
//         vertical: context.h(0.8),
//       ),
//       decoration: BoxDecoration(
//         color: AppColors.offWhite,
//         borderRadius: BorderRadius.circular(context.w(4)),
//         border: Border.all(
//           color: AppColors.primaryColor.withOpacity(.3),
//         ),
//       ),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Icon(
//             Icons.alarm,
//             color: AppColors.primaryColor,
//             size: context.sp(3.5),
//           ),

//           SizedBox(width: context.w(2)),

//           Text(
//             time.format(context),
//             style: TextStyle(
//               fontSize: context.sp(3.2),
//               fontWeight: FontWeight.w600,
//             ),
//           ),

//           SizedBox(width: context.w(2)),

//           GestureDetector(
//             onTap: onDelete,
//             child: Icon(
//               Icons.close,
//               color: Colors.red,
//               size: context.sp(3.5),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


class ReminderSelectorCard extends StatelessWidget {
  final TimeOfDay? selectedTime;
  final VoidCallback onAddOrEdit;
  final VoidCallback onDelete;

  const ReminderSelectorCard({
    super.key,
    required this.selectedTime,
    required this.onAddOrEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      onTap: onAddOrEdit,
      child: Row(
        children: [
          Text(
            "إضافة منبه",
            style: TextStyle(
              fontSize: context.sp(3.4),
              fontWeight: FontWeight.w500,
            ),
          ),

          const Spacer(),

          if (selectedTime == null)
            IconButton(
    onPressed: onAddOrEdit,
    icon: Icon(
      Icons.alarm_add,
      color: Colors.white,
      size: context.sp(4),
    ),
  style: IconButton.styleFrom(
  backgroundColor: AppColors.primaryColor,
  padding: EdgeInsets.zero,
  minimumSize: Size(context.w(6), context.w(6)),
  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
  shape: const CircleBorder(),

    ),
  )
          else
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: context.w(3),
                vertical: context.h(0.8),
              ),
              decoration: BoxDecoration(
                color: AppColors.offWhite,
                borderRadius: BorderRadius.circular(context.w(4)),
                border: Border.all(
                  color: AppColors.primaryColor.withOpacity(.3),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.alarm,
                    color: AppColors.primaryColor,
                    size: context.sp(3.5),
                  ),

                  SizedBox(width: context.w(2)),

                  Text(
                    selectedTime!.format(context),
                    style: TextStyle(
                      fontSize: context.sp(3.2),
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  SizedBox(width: context.w(2)),

                  GestureDetector(
                    onTap: onDelete,
                    child: Icon(
                      Icons.close,
                      color: Colors.red,
                      size: context.sp(3.5),
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