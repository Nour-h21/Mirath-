import 'package:mirath/core/core.dart';

class AwardsHeader extends StatelessWidget {
  const AwardsHeader({
    super.key,
    required this.cartCount,
    required this.onCartTap,
  });

  final int cartCount;
  final VoidCallback onCartTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: context.w(1),
              height: context.h(3),
              decoration: BoxDecoration(
                color: AppColors.deepPrimaryColor,
                borderRadius: BorderRadius.circular(context.w(2)),
              ),
            ),

            SizedBox(width: context.w(3)),

            Text(
              AppStrings.availableBooks,
              style: AppTextStyles.awardsSectionTitle(context),
            ),
          ],
        ),

        Stack(
          clipBehavior: Clip.none,
          children: [
            IconButton(
              onPressed: onCartTap,
              icon: Icon(
                Icons.shopping_cart_outlined,
                color: AppColors.primaryColor,
                size: context.w(6),
              ),
            ),

            if (cartCount > 0)
              Positioned(
                top: 2,
                right: 3.5,
                child: Container(
                  width: context.w(4),
                  height: context.w(5),
                  decoration: BoxDecoration(
                    color: Colors.red.withOpacity(.99),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      "$cartCount",
                      style: AppTextStyles.awardsCartCounter(context),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}