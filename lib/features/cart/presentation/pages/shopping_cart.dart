// import 'package:flutter_bloc/flutter_bloc.dart';

// import 'package:mirath/core/core.dart';

// import '../../../user_points/presentation/bloc/user_points_bloc.dart';
// import '../../../user_points/presentation/bloc/user_points_event.dart';
// import '../../../user_points/presentation/bloc/user_points_state.dart';
// import '../bloc/cart/cart_bloc.dart';
// import '../bloc/cart/cart_event.dart';
// import '../bloc/cart/cart_state.dart';
// import '../widgets/cart_book_card.dart';
// import '../widgets/cart_bottom_sheet.dart';
// import '../widgets/points_balance_card.dart';

// class ShoppingCart extends StatelessWidget {
//   const ShoppingCart({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider.value(
//       value: context.read<CartBloc>(),
//       child: BlocListener<CartBloc, CartState>(
//         listenWhen: (prev, curr) =>
//             prev.redeemSuccess != curr.redeemSuccess &&
//             curr.redeemSuccess == true,
//         listener: (context, state) {
//           // 🔥 هون نحدث النقاط
//           context.read<UserPointsBloc>().add(GetUserPointsEvent());

//           // (اختياري) snackBar
//           ScaffoldMessenger.of(
//             context,
//           ).showSnackBar(const SnackBar(content: Text("تم الاستبدال بنجاح")));
//         },
//         child: BlocBuilder<CartBloc, CartState>(
//           builder: (context, state) {
//             if (state.isLoading) {
//               return const Center(child: CircularProgressIndicator());
//             }

//             if (state.error != null) {
//               return Center(child: Text(state.error!));
//             }

//             return Directionality(
//               textDirection: TextDirection.rtl,
//               child: Scaffold(
//                 bottomSheet: state.hasSelection
//                     ? CartBottomSheet(state: state)
//                     : null,

//                 body: SafeArea(
//                   child: InBackgroundPage(
//                     title: AppStrings.shoppingCart,

//                     child: Column(
//                       children: [
//                         /// Available Points
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             // PointsCard(points: 1250),
//                             BlocBuilder<UserPointsBloc, UserPointsState>(
//                               builder: (context, state) {
//                                 // if (state.isLoading) {
//                                 //   return const CircularProgressIndicator();
//                                 // }

//                                 return PointsCard(points: state.points);
//                               },
//                             ),
//                             Align(
//                               alignment: Alignment.centerLeft,
//                               child: TextButton(
//                                 onPressed: () {
//                                   context.read<CartBloc>().add(
//                                     SelectAllBooksEvent(),
//                                   );
//                                 },
//                                 child: Text(
//                                   state.isAllSelected
//                                       ? AppStrings.unSelectAll
//                                       : AppStrings.selectAll,
//                                   style: AppTextStyles.cartSelectAll(context),
//                                   // TextStyle(
//                                   //   color: const Color(
//                                   //     0xFF8A2C48,
//                                   //   ),
//                                   //   fontSize: context.sp(3.8),
//                                   //   fontWeight: FontWeight.w700,
//                                   // ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),

//                         SizedBox(height: context.h(3)),

//                         /// Empty Cart
//                         if (state.books.isEmpty)
//                           Expanded(
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Icon(
//                                   Icons.shopping_cart_outlined,
//                                   size: context.w(20),
//                                   color: AppColors.grey,
//                                 ),

//                                 SizedBox(height: context.h(2)),

//                                 // Text(
//                                 //   "السلة فارغة",
//                                 //   style: TextStyle(
//                                 //     fontSize: context.sp(4),
//                                 //     color: AppColors.primaryColor,
//                                 //   ),
//                                 // ),
//                                 Text(
//                                   AppStrings.emptyCart,
//                                   style: AppTextStyles.cartEmpty(context),
//                                 ),
//                               ],
//                             ),
//                           )
//                         else
//                           /// Books List
//                           Expanded(
//                             child: ListView.separated(
//                               padding: EdgeInsets.only(
//                                 bottom: state.hasSelection
//                                     ? context.h(35)
//                                     : context.h(3),
//                               ),

//                               itemCount: state.books.length,

//                               separatorBuilder: (_, __) =>
//                                   SizedBox(height: context.h(1.5)),

//                               itemBuilder: (context, index) {
//                                 return CartBookCard(
//                                   item: state.books[index],
//                                 ).paddingOnlytLR(context, 1, 1, 1);
//                               },
//                             ),
//                           ),
//                       ],
//                     ).paddingSymetricH(context, 4.5),
//                     // ),
//                   ),
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mirath/core/core.dart';

import '../../../user_points/presentation/bloc/user_points_bloc.dart';
import '../../../user_points/presentation/bloc/user_points_event.dart';
import '../../../user_points/presentation/bloc/user_points_state.dart';

import '../bloc/cart/cart_bloc.dart';
import '../bloc/cart/cart_event.dart';
import '../bloc/cart/cart_state.dart';

import '../widgets/cart_book_card.dart';
import '../widgets/cart_bottom_sheet.dart';
import '../widgets/points_balance_card.dart';
import '../widgets/book_redemption_success_dialog.dart';

class ShoppingCart extends StatelessWidget {
  const ShoppingCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: context.read<CartBloc>(),

      child: BlocListener<CartBloc, CartState>(
  listenWhen: (previous, current) =>
      previous.redeemSuccess != current.redeemSuccess &&
      current.redeemSuccess == true,

  listener: (context, state) {
    // تحديث النقاط
    context.read<UserPointsBloc>().add(
      GetUserPointsEvent(),
    );

    // إظهار Dialog فوق الواجهة
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) {
        return BookRedemptionSuccessDialog(
          response: state.redemptionResponse!,
        );
      },
    );
  },
        child: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            return Directionality(
              textDirection: TextDirection.rtl,

              child: Scaffold(
                bottomSheet: state.hasSelection
                    ? CartBottomSheet(
                        state: state,
                      )
                    : null,

                body: SafeArea(
                  child: Stack(
                    children: [
                      // =====================================
                      // Main Cart Interface
                      // =====================================

                      InBackgroundPage(
                        labelAppBar: AppStrings.shoppingCart,

                        child: Column(
                          children: [
                            SizedBox(height: context.h(5)),
                           
                            // =====================================
                            // Points + Select All
                            // =====================================

                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,

                              children: [
                                BlocBuilder<
                                    UserPointsBloc,
                                    UserPointsState>(
                                  builder:
                                      (
                                    context,
                                    pointsState,
                                  ) {
                                    return PointsCard(
                                      points:
                                          pointsState.points,
                                    );
                                  },
                                ),

                                Align(
                                  alignment:
                                      Alignment.centerLeft,

                                  child: TextButton(
                                    onPressed: state.books.isEmpty
                                        ? null
                                        : () {
                                            context
                                                .read<
                                                    CartBloc>()
                                                .add(
                                                  SelectAllBooksEvent(),
                                                );
                                          },

                                    child: Text(
                                      state.isAllSelected
                                          ? AppStrings
                                              .unSelectAll
                                          : AppStrings
                                              .selectAll,

                                      style: AppTextStyles
                                          .cartSelectAll(
                                        context,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(
                              height: context.h(3),
                            ),

                            // =====================================
                            // Empty Cart
                            // =====================================

                            if (state.books.isEmpty)
                              Expanded(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.center,

                                  children: [
                                    Icon(
                                      Icons
                                          .shopping_cart_outlined,

                                      size: context.w(20),

                                      color:
                                          AppColors.grey,
                                    ),

                                    SizedBox(
                                      height: context.h(2),
                                    ),

                                    Text(
                                      AppStrings.emptyCart,

                                      style: AppTextStyles
                                          .cartEmpty(
                                        context,
                                      ),
                                    ),
                                  ],
                                ),
                              )

                            // =====================================
                            // Books List
                            // =====================================

                            else
                              Expanded(
                                child: ListView.separated(
                                  padding: EdgeInsets.only(
                                    bottom: state.hasSelection
                                        ? context.h(35)
                                        : context.h(3),
                                  ),

                                  itemCount:
                                      state.books.length,

                                  separatorBuilder:
                                      (_, __) => SizedBox(
                                    height: context.h(1.5),
                                  ),

                                  itemBuilder:
                                      (context, index) {
                                    return CartBookCard(
                                      item:
                                          state.books[index],
                                    ).paddingOnlytLR(
                                      context,
                                      1,
                                      1,
                                      1,
                                    );
                                  },
                                ),
                              ),
                          ],
                        ).paddingSymetricH(
                          context,
                          4.5,
                        ),
                      ),

                      // =====================================
                      // Loading Overlay
                      // =====================================

                      if (state.isLoading)
                        Container(
                          color: Colors.black.withOpacity(.15),

                          child: const Center(
                            child:
                                CircularProgressIndicator(),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}