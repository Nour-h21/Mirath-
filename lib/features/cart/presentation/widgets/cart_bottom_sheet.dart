import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mirath/core/core.dart';

import '../../../../core/shared/widgets/buttons/custom_bottom_sheet_container.dart';
import '../../../user_points/presentation/bloc/user_points_bloc.dart';
import '../../../user_points/presentation/bloc/user_points_state.dart';
import '../bloc/cart/cart_bloc.dart';
import '../bloc/cart/cart_event.dart';
import '../bloc/cart/cart_state.dart';

// class CartBottomSheet extends StatelessWidget {
//   final CartState state;

//   const CartBottomSheet({
//     super.key,
//     required this.state,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return CustomBottomSheetContainer(
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           buildRow(
//             context,
//             AppStrings.totalRequiredPoints,
//             // "إجمالي النقاط المطلوبة",
//             "${state.totalRequiredPoints}",
//           ),

//           SizedBox(height: context.h(1)),

//           buildRow(
//             context,
//             AppStrings.currentBalance,
//             // "رصيدك الحالي",
//             "${state.userPoints}",
//           ),

//           SizedBox(height: context.h(1.2)),

//           Container(
//             margin: EdgeInsets.symmetric(
//               vertical: context.h(1),
//             ),
//             height: 1,
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [
//                   Colors.transparent,
//                   AppColors.primaryColor.withOpacity(.3),
//                   Colors.transparent,
//                 ],
//               ),
//             ),
//           ),

//           Container(
//             height: context.h(4.6),
//             decoration: BoxDecoration(
//               color: AppColors.grey.withOpacity(0.4),
//               borderRadius: BorderRadius.circular(
//                 context.w(3),
//               ),
//             ),
//             child: buildRow(
//               context,
//               // "الرصيد المتبقي بعد العملية",
//               AppStrings.remainingBalance,
//               "${state.remainingPoints}",
//             ).paddingOnlyLR(context, 4, 4),
//           ).paddingSymetricV(context, 1),

//           SizedBox(height: context.h(1.5)),

//           SizedBox(
//             width: context.w(50),
//             height: context.h(5),
//             child: ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: AppColors.primaryColor,
//               ),
//               onPressed: () {
//                 context.read<CartBloc>().add(
//                   RedeemSelectedBooksEvent(),
//                 );
//               },
//               child: Text(
//                 // "تأكيد الاستبدال",
//                 AppStrings.confirmExchange,
//                 style: AppTextStyles.cartConfirmButton(context),
//                 //  TextStyle(
//                 //   color: AppColors.offWhite,
//                 //   fontSize: context.sp(3.8),
//                 //   fontWeight: FontWeight.w500,
//                 // ),
//               ),
//             ),
//           ),

//           SizedBox(height: context.h(1)),

//           Text(
//             // "سيتم خصم النقاط فور تأكيد العملية. الكتب الورقية يتم تسليمها خلال 3 أيام عمل.",
//             AppStrings.exchangeDescription,
//             textAlign: TextAlign.center,
//             style: AppTextStyles.cartBottomDescription(context),
//             // TextStyle(
//             //   fontSize: context.sp(2.5),
//             //   color: Colors.grey,
//             // ),
//           ),
//         ],
//       ).paddingOnlyLR(context, 1, 1),
//     );
//   }

// Widget buildRow(
//   BuildContext context,
//   String title,
//   String value,
// ) {
//   return Row(
//     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     children: [
//       Text(
//         title,
//         style: AppTextStyles.cartBottomSheetTitle(context),
//         // TextStyle(
//         //   fontSize: context.sp(3.3),
//         //   color: AppColors.deepPrimaryColor,
//         //   fontWeight: FontWeight.w500,
//         // ),
//       ),
//       Text(
//         value,
//         style: AppTextStyles.cartBottomSheetValue(context),
//         // TextStyle(
//         //   color: AppColors.primaryColor,
//         //   fontSize: context.sp(3.6),
//         //   fontWeight: FontWeight.w800,
//         // ),
//       ),
//     ],
//   ).paddingOnlyLR(context, 1.5, 1.5);
// }

class CartBottomSheet extends StatelessWidget {
  const CartBottomSheet({super.key, required this.state});

  final CartState state;

  @override
  Widget build(BuildContext context) {
    return CustomBottomSheetContainer(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildRow(
            context,
            AppStrings.totalRequiredPoints,
            "${state.totalRequiredPoints}",
          ),

          SizedBox(height: context.h(1)),

          BlocBuilder<UserPointsBloc, UserPointsState>(
            builder: (context, pointsState) {
              return buildRow(
                context,
                AppStrings.currentBalance,
                "${pointsState.points}",
              );
            },
          ),

          SizedBox(height: context.h(1.2)),

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

          Container(
            height: context.h(4.6),
            decoration: BoxDecoration(
              color: AppColors.grey.withOpacity(.4),
              borderRadius: BorderRadius.circular(context.w(3)),
            ),
            child: BlocBuilder<UserPointsBloc, UserPointsState>(
              builder: (context, pointsState) {
                final remaining =
                    pointsState.points - state.totalRequiredPoints;

                return buildRow(
                  context,
                  AppStrings.remainingBalance,
                  "$remaining",
                );
              },
            ).paddingOnlyLR(context, 4, 4),
          ).paddingSymetricV(context, 1),

          SizedBox(height: context.h(1.5)),

          SizedBox(
            width: context.w(50),
            height: context.h(5),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
              ),
              onPressed: () {
                context.read<CartBloc>().add(RedeemSelectedBooksEvent());
              },
              child: Text(
                AppStrings.confirmExchange,
                style: AppTextStyles.cartConfirmButton(context),
              ),
            ),
          ),

          SizedBox(height: context.h(1)),

          Text(
            AppStrings.exchangeDescription,
            textAlign: TextAlign.center,
            style: AppTextStyles.cartBottomDescription(context),
          ),
        ],
      ).paddingOnlyLR(context, 1, 1),
    );
  }

  Widget buildRow(BuildContext context, String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppTextStyles.cartBottomSheetTitle(context),
          // TextStyle(
          //   fontSize: context.sp(3.3),
          //   color: AppColors.deepPrimaryColor,
          //   fontWeight: FontWeight.w500,
          // ),
        ),
        Text(
          value,
          style: AppTextStyles.cartBottomSheetValue(context),
          // TextStyle(
          //   color: AppColors.primaryColor,
          //   fontSize: context.sp(3.6),
          //   fontWeight: FontWeight.w800,
          // ),
        ),
      ],
    ).paddingOnlyLR(context, 1.5, 1.5);
  }
}
