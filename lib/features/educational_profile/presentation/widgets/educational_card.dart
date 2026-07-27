import 'package:mirath/core/core.dart';

class EducationalCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final VoidCallback onTap;

  const EducationalCard({
    super.key,
    required this.title,
    required this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return CardGradientContainer(
      width: context.w(40),
      height: context.h(15),
      // blurRadius: 2.5,
      // spreadRadius: 2.5,
 gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color(0xFFF5EADA),
            AppColors.offWhite
            // Color(0xFFDADADA),
          ],
         ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              SizedBox(
                width: context.w(15),
                child: Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: context.sp(3.8),
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                    fontFamily: 'Armia',
                  ),
                ),
              ),
              SizedBox(height: context.h(2)),

              CircleAvatar(
                radius: 12,
                backgroundColor: AppColors.primaryColor,

                child: IconButton(
                  onPressed: onTap,

                  icon: Icon(
                    Icons.arrow_back_ios_new,
                    color: AppColors.baieg,
                    size: 9,
                  ),
                ),
              ).paddingOnlyLR(context, 1, 1),
            ],
          ),

          Image.asset(imagePath, width: context.w(20), fit: BoxFit.contain),
        ],
      ).paddingAll(context, 1),
    );
  }
}
