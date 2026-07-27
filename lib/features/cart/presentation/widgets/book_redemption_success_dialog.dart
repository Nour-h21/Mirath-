import 'package:mirath/core/core.dart';

import '../../domain/entities/request_book_redemption_entity.dart';

class BookRedemptionSuccessDialog extends StatelessWidget {
  final BookRedemptionResponseEntity response;

  const BookRedemptionSuccessDialog({
    super.key,
    required this.response,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(
        horizontal: context.w(6),
      ),
      child: Container(
        padding: EdgeInsets.all(
          context.w(5),
        ),
        decoration: BoxDecoration(
          color: AppColors.offWhite,
          borderRadius: BorderRadius.circular(
            context.w(5),
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(.2),
              blurRadius: context.w(5),
              offset: Offset(
                0,
                context.h(1),
              ),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Success Icon
            Container(
              width: context.w(17),
              height: context.w(17),
              decoration: BoxDecoration(
                color: AppColors.primaryColor.withOpacity(.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.check_rounded,
                color: AppColors.primaryColor,
                size: context.sp(9),
              ),
            ),

            SizedBox(
              height: context.h(2),
            ),

            // Success Message
            Text(
              response.message,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.deepPrimaryColor,
                fontSize: context.sp(4),
                fontWeight: FontWeight.w700,
                height: 1.5,
              ),
            ),

            SizedBox(
              height: context.h(2.5),
            ),

            Divider(
              color: AppColors.grey.withOpacity(.4),
              height: 1,
            ),

            SizedBox(
              height: context.h(2),
            ),

            // Library Location
            _InfoRow(
              icon: Icons.location_on_outlined,
              title: 'موقع المكتبة',
              value: response.data.libraryLocation,
            ),

            SizedBox(
              height: context.h(1.5),
            ),

            // Working Hours
            _InfoRow(
              icon: Icons.access_time_outlined,
              title: 'أوقات الدوام',
              value: response.data.workingHours,
            ),

            SizedBox(
              height: context.h(2.5),
            ),

            // Close Button
            SizedBox(
              width: double.infinity,
              height: context.h(5.5),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      context.w(3),
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'حسنًا',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: context.sp(3.8),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const _InfoRow({
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: context.w(10),
          height: context.w(10),
          decoration: BoxDecoration(
            color: AppColors.primaryColor.withOpacity(.1),
            borderRadius: BorderRadius.circular(
              context.w(3),
            ),
          ),
          child: Icon(
            icon,
            color: AppColors.primaryColor,
            size: context.sp(5),
          ),
        ),

        SizedBox(
          width: context.w(3),
        ),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: AppColors.grey,
                  fontSize: context.sp(3),
                  fontWeight: FontWeight.w500,
                ),
              ),

              SizedBox(
                height: context.h(.5),
              ),

              Text(
                value,
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: context.sp(3.5),
                  fontWeight: FontWeight.w600,
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}