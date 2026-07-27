import 'package:mirath/core/core.dart';

class PointsCard extends StatelessWidget {
  const PointsCard({
    super.key,
    required this.points,
  });

  final int points;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: context.w(3),
          vertical: context.h(0.8),
        ),
        decoration: BoxDecoration(
          color: AppColors.secondryColor,
          borderRadius: BorderRadius.circular(
            context.w(10),
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: context.w(1),
              offset: const Offset(0, 2),
              color: const Color(0x20000000),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.workspace_premium,
              color: const Color(0xffF7D45B),
              size: context.sp(5),
            ),

            SizedBox(width: context.w(2)),

            Text(
              AppStrings.availablePointsCount(points),
              style: AppTextStyles.cartAvailablePoints(context),
            ),
          ],
        ),
      ),
    );
  }
}