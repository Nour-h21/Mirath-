import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mirath/core/core.dart';

import '../../../cart/presentation/bloc/cart/cart_bloc.dart';
import '../../../cart/presentation/bloc/cart/cart_event.dart';
import '../../../cart/presentation/bloc/cart/cart_state.dart';
import '../../../user_points/presentation/bloc/user_points_bloc.dart';
import '../../../user_points/presentation/bloc/user_points_state.dart';
import '../bloc/awards_bloc.dart';
import '../bloc/awards_event.dart';
import '../bloc/awards_state.dart';
import '../widgets/award_book_card.dart';
import '../widgets/awards_balance_card.dart';
import '../widgets/awards_header.dart';

class Awards extends StatefulWidget {
  const Awards({super.key});

  @override
  State<Awards> createState() => _AwardsState();
}

class _AwardsState extends State<Awards> {
  bool showDescription = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AwardsBloc, AwardsState>(
      listener: (context, state) {
        if (state is AddBookToCartSuccess) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));

          /// إعادة تحميل السلة
          context.read<CartBloc>().add(GetCartEvent());
        }

        if (state is AwardsError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      child: Scaffold(
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: InBackgroundPage(
            labelAppBar: AppStrings.awards,
            // backgroundImage: AppAssets.inBackground,
            child: Column(
              children: [
                SizedBox(height: context.h(7)),

                BlocBuilder<UserPointsBloc, UserPointsState>(
                  builder: (context, state) {
                    // if (state.isLoading) {
                    //   return const CircularProgressIndicator();
                    // }
                    return AwardsBalanceCard(
                      // points: 1250,
                      points: state.points,
                      level: AppStrings.distinguishedStudent,
                      showDescription: showDescription,
                      onToggleDescription: () {
                        setState(() {
                          showDescription = !showDescription;
                        });
                      },
                    );
                  },
                ),

                SizedBox(height: context.h(4)),

                BlocBuilder<CartBloc, CartState>(
                  builder: (context, cartState) {
                    return AwardsHeader(
                      cartCount: cartState.books.length,
                      onCartTap: () {
                        context.push("/shoppingCart");
                      },
                    );
                  },
                ),

                SizedBox(height: context.h(2)),

                Expanded(
                  child: BlocBuilder<AwardsBloc, AwardsState>(
                    builder: (context, state) {
                      if (state is AwardsLoading) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      if (state is AwardsError) {
                        return Center(child: Text(state.message));
                      }

                      if (state is AwardsLoaded) {
                        final books = state.books;

                        return GridView.builder(
                          padding: EdgeInsets.only(bottom: context.h(2)),
                          physics: const BouncingScrollPhysics(),
                          itemCount: books.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: context.w(3),
                                mainAxisSpacing: context.h(2),
                                childAspectRatio: 0.62,
                              ),
                          itemBuilder: (context, index) {
                            return AwardBookCard(
                              book: books[index],
                              onTap: () {
                                context.read<AwardsBloc>().add(
                                  AddBookToCartEvent(books[index].id),
                                );
                              },
                            );
                          },
                        ).paddingOnly(context, 1, 1, 0, 0);
                      }

                      return const SizedBox();
                    },
                  ),
                ),
              ],
            ).paddingOnly(context, 4, 4, 0, 0),
          ),
        ),
      ),
    );
  }
}
