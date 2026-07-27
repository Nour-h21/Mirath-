// import 'package:flutter/material.dart';
// import 'package:mirath/core/utils/extensions/context_extensions.dart';

// import '../../../../core/design/components/base_card.dart';
// import '../../../../core/design/tokens/colors.dart';

// import 'notification_icon.dart';

// class CardSelector extends StatelessWidget {
//   final String title;

//   final String? value;
//   final Widget? valueWidget;

//   final VoidCallback onTap;
//   final VoidCallback? onAddTap;
//   final VoidCallback? onNotificationTap;

//   final bool isNotification;
//   final int notificationCount;

//   const CardSelector({
//     super.key,
//     required this.title,
//     this.value,
//     this.valueWidget,
//     required this.onTap,
//     this.onAddTap,
//     this.onNotificationTap,
//     this.isNotification = false,
//     this.notificationCount = 0,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return BaseCard(
//       onTap: onTap,
//       child: Row(
//         children: [
//           Text(
//             title,
//             style: TextStyle(
//               fontSize: context.sp(3.4),
//               fontWeight: FontWeight.w600,
//             ),
//           ),

//           const Spacer(),

//           if (!isNotification)
//             (valueWidget ??
//                 Text(
//                   value ?? "",
//                   style: TextStyle(
//                     color: AppColors.primaryColor,
//                     fontSize: context.sp(3.6),
//                     fontWeight: FontWeight.bold,
//                   ),
//                 )),
//           SizedBox(width: context.w(2)),
//           if (isNotification) ...[
//             GestureDetector(
//               onTap: onAddTap,
//               // child: Icon(Icons.add),
//               child: Container(
//                 padding: EdgeInsets.all(context.w(0.8)),
//                 decoration: BoxDecoration(
//                   color: AppColors.primaryColor,
//                   shape: BoxShape.circle,
//                 ),
//                 child: Icon(
//                   Icons.add,
//                   color: Colors.white,
//                   size: context.sp(3),
//                 ),
//               ),
//             ),
//             SizedBox(width: context.w(4)),

//             GestureDetector(
//               onTap: onNotificationTap,
//               child: NotificationIcon(count: notificationCount),
//             ),
//           ] else
//             Icon(Icons.keyboard_arrow_down_rounded),
//         ],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:mirath/core/utils/extensions/context_extensions.dart';
import 'package:mirath/core/utils/extensions/widget_extensions.dart';

import '../../../../core/shared/widgets/cards/base_card.dart';
import '../../../../core/design/tokens/colors.dart';

// class CardSelector extends StatelessWidget {
//   final String title;

//   final String? value;
//   final Widget? valueWidget;

//   final VoidCallback onTap;
//   final VoidCallback? onAddTap;

//   final bool isNotification;

//   const CardSelector({
//     super.key,
//     required this.title,
//     this.value,
//     this.valueWidget,
//     required this.onTap,
//     this.onAddTap,
//     this.isNotification = false,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return BaseCard(
//       onTap: onTap,
//       child: Row(
//         children: [
//           Text(
//             title,
//             style: TextStyle(
//               fontSize: context.sp(3.4),
//               fontWeight: FontWeight.w600,
//             ),
//           ),

//           const Spacer(),

//           if (isNotification)
//             valueWidget ??
//                 GestureDetector(
//                   onTap: onAddTap,
//                   child: Container(
//                     padding: EdgeInsets.all(context.w(1.2)),
//                     decoration: BoxDecoration(
//                       color: AppColors.primaryColor,
//                       shape: BoxShape.circle,
//                     ),
//                     child: Icon(
//                       Icons.add,
//                       color: Colors.white,
//                       size: context.sp(3.5),
//                     ),
//                   ),
//                 )
//           else ...[
//             valueWidget ??
//                 Text(
//                   value ?? "",
//                   style: TextStyle(
//                     color: AppColors.primaryColor,
//                     fontSize: context.sp(3.6),
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),

//             SizedBox(width: context.w(2)),

//             Icon(
//               Icons.keyboard_arrow_down_rounded,
//               color: AppColors.primaryColor,
//               size: context.sp(5),
//             ),
//           ],
//         ],
//       ),
//     );
//   }
// }

class CardSelector extends StatelessWidget {
  final String title;
  final String? value;
  final Widget? valueWidget;
  final VoidCallback onTap;

  const CardSelector({
    super.key,
    required this.title,
    this.value,
    this.valueWidget,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bool hasValue =
        valueWidget != null || (value != null && value!.isNotEmpty);

    return BaseCard(
      width: context.w(44),
      
      padding: EdgeInsets.symmetric(
              horizontal: context.w(3.2),
              vertical: context.h(1.2),
            ),
      onTap: onTap,
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: context.sp(3),
              fontWeight: FontWeight.w500,
            ),
          ),

          const Spacer(),

          if (hasValue)
            valueWidget ??
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: context.w(2.5),
                    vertical: context.h(0.3),
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.offWhite,
                    borderRadius: BorderRadius.circular(context.w(4)),
                    border: Border.all(
                      color: AppColors.primaryColor.withOpacity(.3),
                    ),
                  ),
                  child: Text(
                    value!,
                    style: TextStyle(
                      color: AppColors.deepPrimaryColor,
                      fontSize: context.sp(3.1),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )
          else
            Icon(
              Icons.keyboard_arrow_down_rounded,
              color: AppColors.primaryColor,
              size: context.sp(5),
            ).paddingAll(context, 0.29),
        ],
      ),
    );
  }
}



// class CardSelector extends StatelessWidget {
//   final String title;
//   final String? value;
//   final Widget? valueWidget;
//   final VoidCallback onTap;

//   const CardSelector({
//     super.key,
//     required this.title,
//     this.value,
//     this.valueWidget,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return BaseCard(
//       width: context.w(44),
//       onTap: onTap,
//       child: Row(
//         children: [
//           Text(
//             title,
//             style: TextStyle(
//               fontSize: context.sp(2.8),
//               fontWeight: FontWeight.w600,
//             ),
//           ),

//           const Spacer(),

//           valueWidget ??
//               Text(
//                 value ?? "",
//                 style: TextStyle(
//                   color: AppColors.primaryColor,
//                   fontSize: context.sp(3.3),
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),

//           // SizedBox(width: context.w(2)),
// const Spacer(),
//           Icon(
//             Icons.keyboard_arrow_down_rounded,
//             color: AppColors.primaryColor,
//             size: context.sp(5),
//           ),
//         ],
//       ),
//     );
//   }
// }