import 'package:flutter/material.dart';
import 'package:mirath/core/utils/extensions/context_extensions.dart';

import '../../../../core/shared/widgets/cards/base_card.dart';
import '../../../../core/design/tokens/colors.dart';

class PlanTypeButton extends StatelessWidget {
  final String title;
  final bool selected;
  final String subtitle;
  final VoidCallback onTap;

  const PlanTypeButton({
    super.key,
    required this.subtitle,
    required this.title,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(context.w(4)),
      onTap: onTap,
      child: AnimatedContainer(
        // height: context.h(5),
        duration: const Duration(milliseconds: 250),
        padding: EdgeInsets.only(
          top: context.w(3),
          bottom: context.w(3),
          left: context.w(11.5),
          right: context.w(11.5),
        ),
        decoration: BoxDecoration(
          color: selected ? AppColors.primaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(context.w(6)),
          border: Border.all(
            color: selected ? AppColors.primaryColor : AppColors.primaryColor,
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(
              selected ? Icons.check_circle : Icons.circle_outlined,
              color: selected ? AppColors.baieg : AppColors.primaryColor,
              size: context.w(4),
            ),

            SizedBox(width: context.w(2)),

            Text(
              title,
              style: TextStyle(
                fontSize: context.sp(3.5),
                fontWeight: FontWeight.bold,
                color: selected ? Colors.white : AppColors.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:mirath/core/design/components/base_card.dart';
// import 'package:mirath/core/design/tokens/colors.dart';
// import 'package:mirath/core/utils/extensions/context_extensions.dart';

// class PlanCalculationCard extends StatelessWidget {
//   final String title;
//   final String value;
//   final IconData icon;

//   const PlanCalculationCard({
//     super.key,
//     required this.title,
//     required this.value,
//     required this.icon,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return BaseCard(
//       gradient: LinearGradient(
//         begin: Alignment.topRight,
//         end: Alignment.bottomLeft,
//         colors: [
//           AppColors.baieg.withOpacity(.5),
//           AppColors.offWhite,
//         ],
//       ),
//       child: Row(
//         children: [
//           Container(
//             padding: EdgeInsets.all(context.w(2)),
//             decoration: BoxDecoration(
//               color: AppColors.primaryColor.withOpacity(.1),
//               shape: BoxShape.circle,
//             ),
//             child: Icon(
//               icon,
//               color: AppColors.primaryColor,
//               size: context.sp(4),
//             ),
//           ),

//           SizedBox(width: context.w(3)),

//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   title,
//                   style: TextStyle(
//                     color: Colors.grey.shade700,
//                     fontSize: context.sp(3),
//                   ),
//                 ),

//                 SizedBox(height: context.h(0.4)),

//                 Text(
//                   value,
//                   style: TextStyle(
//                     color: AppColors.deepPrimaryColor,
//                     fontSize: context.sp(4),
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }