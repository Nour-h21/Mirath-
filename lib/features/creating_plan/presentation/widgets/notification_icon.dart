
// import 'package:flutter/material.dart';
// import 'package:mirath/core/utils/extensions/context_extensions.dart';

// import '../../../../core/design/tokens/colors.dart';

// class NotificationIcon extends StatelessWidget {
//   final int count;

//   const NotificationIcon({super.key, required this.count});

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       clipBehavior: Clip.none,
//       children: [
//         Icon(
//           Icons.notifications_active_rounded,
//           color: AppColors.primaryColor,
//           size: context.sp(6),
//         ),

//         if (count > 0)
//           Positioned(
//             right: -5,
//             top: -6,
//             child: Container(
//               padding: const EdgeInsets.all(4),
//               decoration: const BoxDecoration(
//                 color: Colors.red,
//                 shape: BoxShape.circle,
//               ),
//               constraints: const BoxConstraints(minWidth: 10, minHeight: 10),
//               child: Center(
//                 child: Text(
//                   count > 9 ? "9+" : "$count",
//                   style: const TextStyle(
//                     color: Colors.white,
//                     fontSize: 10,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//       ],
//     );
//   }
// }

