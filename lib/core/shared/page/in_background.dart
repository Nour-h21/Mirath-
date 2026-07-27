import 'package:flutter/material.dart';
import 'package:mirath/core/constants/assets.dart';
import 'package:mirath/core/utils/extensions/context_extensions.dart';
import 'package:mirath/core/utils/extensions/widget_extensions.dart';

import '../../design/tokens/colors.dart';

class InBackgroundPage extends StatelessWidget {
  final Widget child;
  final String labelAppBar;
  // final String? backgroundImage;
  final VoidCallback? onBackPressed;
  // final Widget? topLeftWidget;
  // final String labelAppBar;

  const InBackgroundPage({
    super.key,
    required this.labelAppBar,
    required this.child,
     this.onBackPressed,

    // required this.labelAppBar,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Stack(
          fit: StackFit.expand,

          children: [
            Image.asset(AppAssets.inBackground, fit: BoxFit.cover),

            Column(
              children: [
                // SizedBox(height: context.h(2.2)),

                Row(
                  children: [
                    Container(
                      height: context.h(5),
                      width: context.w(57),
                      decoration: BoxDecoration(
                        color: AppColors.deepPrimaryColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          color: AppColors.deepPrimaryColor,
                          width: context.w(0.26),
                        ),
                      ),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed:
                                onBackPressed ??
                                () {
                                  Navigator.pop(context);
                                },
                            icon:  Icon(
                              Icons.arrow_back,
                              color: AppColors.deepPrimaryColor,
                            ),
                          ),
                    
                          SizedBox(width: context.w(1)),
                    
                          Expanded(
                            child: Text(
                              labelAppBar,
                              style: TextStyle(
                                color: AppColors.deepPrimaryColor,
                                fontSize: context.sp(4.8),
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ).paddingSymetricH(context,2.5),
                // ).paddingOnlyLR(context, 40, 2),

                // SizedBox(height: context.h(5)),

                Expanded(child: child),
              ],
            ).paddingOnlytop(context, 2),
          ],
        ),
      ),
    );
  }
}



// class InBackgroundPage extends StatelessWidget {
//   final Widget child;
//   final String labelAppBar;
//   final VoidCallback onBackPressed;

//   const InBackgroundPage({
//     super.key,
//     required this.child,
//     required this.labelAppBar,
//     required this.onBackPressed,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         resizeToAvoidBottomInset: true,
//         body: Stack(
//           alignment: Alignment.topCenter,
//           children: [
//             Container(
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                   image: AssetImage(AppAssets.inBackground),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),

//             SingleChildScrollView(
//               child: Column(
//                 children: [
//                   Row(
//                     children: [
//                       Container(
//                         height: context.h(5),
//                         width: context.w(60),
//                         decoration: BoxDecoration(
//                           color: AppColors.primaryColor.withOpacity(0.2),
//                           borderRadius: BorderRadius.circular(25),
//                           border: Border.all(
//                             color: AppColors.deepPrimaryColor,
//                             width: context.w(0.26),
//                           ),
//                         ),
//                         child: Row(
//                           children: [
//                             IconButton(
//                               onPressed:onBackPressed,
//                               icon: Icon(
//                                 Icons.arrow_back,
//                                 color: AppColors.deepPrimaryColor,
//                               ),
//                             ),
//                             SizedBox(width: context.w(2),),
//                             Expanded(
//                               child: Text(
//                                 labelAppBar,
//                                 style: AppTextStyles.bigDeepPrimaryColorStyle(
//                                   context,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ).paddingSymetricH(context, 2.5),
//                  child,
//                 ],
//               ).paddingOnlytop(context, 2),
//             ),
//           ],
//         ),
        
//       ),
//     );
//   }
// }