import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mirath/core/core.dart';

import '../../domain/entities/cart_item_entity.dart';

import '../bloc/cart/cart_bloc.dart';
import '../bloc/cart/cart_event.dart';

class CartBookCard extends StatelessWidget {
  const CartBookCard({
    super.key,
    required this.item,
  });

  final CartItemEntity item;

  @override
  Widget build(BuildContext context) {

   final selected = context.select<CartBloc, bool>((bloc) {
  return bloc.state.selectedBookIds.contains(item.book.id);

    });

    return Container(
      padding: EdgeInsets.all(context.w(2)),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 237, 235, 229),
        borderRadius: BorderRadius.circular(18),
        border: Border(
          left: BorderSide(
            color: AppColors.primaryColor,
            width: context.w(1),
          ),
        ),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            AppColors.baieg.withOpacity(.8),
            AppColors.offWhite,
          ],
        ),
      ),
      child: Row(
        children: [

          ClipRRect(
            borderRadius: BorderRadius.circular(
              context.w(3),
            ),
            child: Image.asset(
              AppAssets.bookAward,
              width: context.w(22),
              height: context.h(11),
              fit: BoxFit.cover,
            ),
          ),

          SizedBox(width: context.w(3)),

          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [

                Text(
                  item.book.name,
                  style: AppTextStyles.cartBookTitle(
                    context,
                  ),
                ),

                SizedBox(
                  height: context.h(.5),
                ),

                Text(
                  item.book.author,
                  style: AppTextStyles.cartAuthor(
                    context,
                  ),
                ),

                SizedBox(
                  height: context.h(1),
                ),

                Row(
                  children: [

                    const Icon(
                      Icons.star_border_outlined,
                      color: Color(0xFF8A2C48),
                    ),

                    SizedBox(
                      width: context.w(1),
                    ),

                    Text(
                      "${item.book.price}",
                      style:
                          AppTextStyles.cartPoints(
                        context,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          InkWell(
           onTap: () {
  context.read<CartBloc>().add(
    ToggleBookSelectionEvent(item.id), // cartItemId فقط
  );
},
            child: Icon(
              selected
                  ? Icons.check_circle
                  : Icons.circle_outlined,
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:mirath/core/design/tokens/colors.dart';
// import 'package:mirath/core/utils/extensions/context_extensions.dart';

// class BookItemCard extends StatelessWidget {
//   final String title;
//   final String image;
//   final String? author;
//   final int? points;

//   final bool showSelection;
//   final bool isSelected;

//   final VoidCallback? onCardTap;
//   final VoidCallback? onSelectTap;

//   const BookItemCard({
//     super.key,
//     required this.title,
//     required this.image,
//     this.author,
//     this.points,
//     this.showSelection = false,
//     this.isSelected = false,
//     this.onCardTap,
//     this.onSelectTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       borderRadius: BorderRadius.circular(18),
//       onTap: onCardTap,
//       child: Container(
//         padding: EdgeInsets.all(
//           context.w(2),
//         ),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(
//             18,
//           ),
//           color: const Color.fromARGB(
//             255,
//             237,
//             235,
//             229,
//           ),
//           border: Border(
//             left: BorderSide(
//               color: AppColors.primaryColor,
//               width: context.w(1),
//             ),
//           ),
//           gradient: LinearGradient(
//             begin: Alignment.centerLeft,
//             end: Alignment.centerRight,
//             colors: [
//               AppColors.baieg.withOpacity(
//                 0.8,
//               ),
//               AppColors.offWhite,
//             ],
//           ),
//           boxShadow: const [
//             BoxShadow(
//               color: Color(0x20000000),
//               blurRadius: 10,
//               offset: Offset(0, 4),
//             ),
//           ],
//         ),
//         child: Row(
//           crossAxisAlignment:
//               CrossAxisAlignment.start,
//           children: [

//             /// الصورة
//             ClipRRect(
//               borderRadius:
//                   BorderRadius.circular(
//                 context.w(3),
//               ),
//               child: Image.asset(
//                 image,
//                 width: context.w(22),
//                 height: context.h(11),
//                 fit: BoxFit.cover,
//               ),
//             ),

//             SizedBox(
//               width: context.w(3),
//             ),

//             /// المعلومات
//             Expanded(
//               child: Padding(
//                 padding: EdgeInsets.only(
//                   top: context.h(1),
//                 ),
//                 child: Column(
//                   crossAxisAlignment:
//                       CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       title,
//                       maxLines: 2,
//                       overflow:
//                           TextOverflow.ellipsis,
//                       style: TextStyle(
//                         fontSize:
//                             context.sp(4),
//                         fontWeight:
//                             FontWeight.w600,
//                         color: const Color(
//                           0xFF2E2E2E,
//                         ),
//                       ),
//                     ),

//                     SizedBox(
//                       height:
//                           context.h(.5),
//                     ),

//                     if (author != null)
//                       Text(
//                         author!,
//                         style: TextStyle(
//                           color: Colors
//                               .grey
//                               .shade600,
//                           fontSize:
//                               context.sp(
//                             2.8,
//                           ),
//                         ),
//                       ),

//                     if (points != null)
//                       Padding(
//                         padding:
//                             EdgeInsets.only(
//                           top:
//                               context.h(1),
//                         ),
//                         child: Row(
//                           children: [
//                             const Icon(
//                               Icons
//                                   .star_border_outlined,
//                               color: Color(
//                                 0xFF8A2C48,
//                               ),
//                               size: 16,
//                             ),

//                             SizedBox(
//                               width:
//                                   context.w(
//                                 1,
//                               ),
//                             ),

//                             Text(
//                               "$points",
//                               style:
//                                   TextStyle(
//                                 color:
//                                     const Color(
//                                   0xFF8A2C48,
//                                 ),
//                                 fontSize:
//                                     context.sp(
//                                   3,
//                                 ),
//                                 fontWeight:
//                                     FontWeight
//                                         .w500,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                   ],
//                 ),
//               ),
//             ),

//             /// زر التحديد
//             if (showSelection)
//               Padding(
//                 padding: EdgeInsets.only(
//                   top: context.h(1),
//                 ),
//                 child: InkWell(
//                   onTap: onSelectTap,
//                   child: Icon(
//                     isSelected
//                         ? Icons
//                             .check_circle
//                         : Icons
//                             .circle_outlined,
//                     color:
//                         AppColors.primaryColor,
//                     size: context.w(5),
//                   ),
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }
