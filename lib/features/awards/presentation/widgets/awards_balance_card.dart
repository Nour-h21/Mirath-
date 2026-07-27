import 'package:mirath/core/core.dart';

class AwardsBalanceCard extends StatelessWidget {
  const AwardsBalanceCard({
    super.key,
    required this.points,
    required this.level,
    required this.showDescription,
    required this.onToggleDescription,
  });

  final int points;
  final String level;
  final bool showDescription;
  final VoidCallback onToggleDescription;

  @override
  Widget build(BuildContext context) {
    return CardGradientContainer(
      width: context.w(90),
      boxShadow: const [
        BoxShadow(
          color: Color(0x25000000),
          blurRadius: 10,
          spreadRadius: 2,
        ),
      ],
      gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          AppColors.baieg,
          AppColors.baieg,
          AppColors.offWhite,
        ],
      ),
      child: Column(
        children: [
          Text(
            AppStrings.currentBalance,
            style: AppTextStyles.awardsBalanceTitle(context),
          ).paddingOnlyLR(context, 1, 3),

          SizedBox(height: context.h(2)),

          ShaderMask(
            blendMode: BlendMode.srcIn,
            shaderCallback: (bounds) => LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AppColors.secondryColor,
                AppColors.primaryColor,
                AppColors.primaryColor,
              ],
            ).createShader(bounds),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "$points ",
                    style: AppTextStyles.awardsPoints(context),
                  ),
                  TextSpan(
                    text: AppStrings.points,
                    style: AppTextStyles.awardsPointsLabel(context),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: context.h(2)),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppStrings.currentLevel,
                style: AppTextStyles.awardsLevel(context),
              ),
              Text(
                level,
                style: AppTextStyles.awardsLevel(context),
              ),
            ],
          ),

          SizedBox(height: context.h(2)),

          GestureDetector(
            onTap: onToggleDescription,
            child: Container(
              padding: context.paddingSymmetric(1.2, 4),
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(context.w(10)),
              ),
              child: Text(
                AppStrings.howToGetPoints,
                style: AppTextStyles.awardsButton(context),
              ),
            ),
          ),

          AnimatedSize(
            duration: const Duration(milliseconds: 250),
            child: showDescription
                ? Padding(
                    padding: EdgeInsets.only(top: context.h(2)),
                    child: Text(
                      AppStrings.pointsDescription,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.awardsDescription(context),
                    ),
                  )
                : const SizedBox(),
          ),
        ],
      ).paddingAll(context, 1.6),
    );
  }
}