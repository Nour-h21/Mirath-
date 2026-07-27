// import 'package:flutter/material.dart';
// import 'package:mirath/core/design/tokens/colors.dart';
// import 'package:mirath/core/utils/extensions/context_extensions.dart';

// import '../../../../core/shared/widgets/buttons/custom_bottom_sheet_container.dart';
// import 'reminder_card.dart';

// class RemindersSheet extends StatefulWidget {
//   final List<TimeOfDay> times;
//   final Function(int index) onDelete;

//   const RemindersSheet({
//     super.key,
//     required this.times,
//     required this.onDelete,
//   });

//   @override
//   State<RemindersSheet> createState() => _RemindersSheetState();
// }

// class _RemindersSheetState extends State<RemindersSheet> {
//   @override
//   Widget build(BuildContext context) {
//     return CustomBottomSheetContainer(
//       height: context.h(50),
//       child: Column(
//         children: [
//           SizedBox(height: context.h(1)),

//           Text(
//             "التنبيهات",
//             style: TextStyle(
//               fontSize: context.sp(4),
//               fontWeight: FontWeight.bold,
//               color: AppColors.deepPrimaryColor,
//             ),
//           ),

//           SizedBox(height: context.h(2)),

//           Expanded(
//             child: widget.times.isEmpty
//                 ? Center(
//                     child: Text(
//                       "لا يوجد تنبيهات",
//                       style: TextStyle(
//                         color: Colors.grey,
//                         fontSize: context.sp(3),
//                       ),
//                     ),
//                   )
//                 : ListView.builder(
//                     itemCount: widget.times.length,
//                     itemBuilder: (context, index) {
//                       final time = widget.times[index];

//                       final formatted = "${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}";

//                       return ReminderCard(
//                         time: widget.times[index],
//                         onDelete: () {
//                           widget.onDelete(index);
//                           setState(() {});
//                         },
//                       );
//                     },
//                   ),
//           ),

//           SizedBox(height: context.h(2)),
//         ],
//       ),
//     );
//   }
// }

// void showRemindersSheet(
//   BuildContext context, {
//   required List<TimeOfDay> times,
//   required Function(int index) onDelete,
// }) {
//   showModalBottomSheet(
//     context: context,
//     backgroundColor: Colors.transparent,
//     isScrollControlled: true,
//     builder: (_) => RemindersSheet(times: times, onDelete: onDelete),
//   );
// }
