// import 'package:flutter/material.dart';
// import 'package:mirath/core/design/tokens/colors.dart';
// import 'package:mirath/core/utils/extensions/context_extensions.dart';

// class ReminderCard extends StatelessWidget {
//   final TimeOfDay time;
//   final VoidCallback? onDelete;

//   const ReminderCard({
//     super.key,
//     required this.time,
//     this.onDelete,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 0,
//       color: AppColors.offWhite,
//       child: ListTile(
//         leading: Icon(
//           Icons.notifications_active,
//           color: AppColors.primaryColor,
//         ),

//         title: Text(
//           time.format(context), // 👈 هون
//           style:  TextStyle(
//             fontWeight: FontWeight.w600,
//                fontSize: context.sp(3.5),
//           ),
//         ),

//         trailing: onDelete == null
//             ? null
//             : IconButton(
//                 icon: const Icon(
//                   Icons.delete,
//                   color: Colors.red,
//                 ),
//                 onPressed: onDelete,
//               ),
//       ),
//     );
//   }
// }