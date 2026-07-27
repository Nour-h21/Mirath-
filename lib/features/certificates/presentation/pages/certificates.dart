import 'package:flutter/material.dart';
import 'package:mirath/core/design/tokens/colors.dart';
import 'package:mirath/core/utils/extensions/context_extensions.dart';

class CertificatesPage extends StatelessWidget {
  const CertificatesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F7F5),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xffF8F7F5),
        centerTitle: false,
        title: Text(
          "الشهادات",
          style: TextStyle(
            color: AppColors.deepPrimaryColor,
            fontWeight: FontWeight.w700,
            fontSize: context.sp(2.2),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(context.w(4)),
        child: Column(
          children: [
            _headerCard(context),

            SizedBox(height: context.h(2)),

            _certificateCard(
              context,
              courseName: "العقيدة الإسلامية",
              date: "15 نوفمبر 2024",
              image:
                  "assets/images/certificate.png",
            ),

            SizedBox(height: context.h(2)),

            _certificateCard(
              context,
              courseName: "فقه العبادات",
              date: "1 ديسمبر 2024",
              image:
                  "assets/images/certificate.png",
            ),
          ],
        ),
      ),
    );
  }

  Widget _headerCard(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(context.w(5)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(context.w(4)),
        gradient: LinearGradient(
          colors: [
            AppColors.deepPrimaryColor,
            AppColors.primaryColor,
          ],
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 15,
            offset: const Offset(0, 6),
            color: AppColors.deepPrimaryColor.withOpacity(.2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "تهانينا! 🎉",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: context.sp(2.4),
            ),
          ),

          SizedBox(height: context.h(.8)),

          Text(
            "لقد حصلت على 2 شهادة",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: context.sp(2),
            ),
          ),

          SizedBox(height: context.h(1.2)),

          Container(
            padding: EdgeInsets.symmetric(
              horizontal: context.w(3),
              vertical: context.h(.5),
            ),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(.15),
              borderRadius: BorderRadius.circular(context.w(10)),
            ),
            child: Text(
              "استمر في التعلم لتحصل على المزيد",
              style: TextStyle(
                color: Colors.white,
                fontSize: context.sp(1.5),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _certificateCard(
    BuildContext context, {
    required String courseName,
    required String date,
    required String image,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(context.w(4)),
        border: Border.all(
          color: Colors.grey.shade200,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.04),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(context.w(4)),
            ),
            child: Image.asset(
              image,
              height: context.h(25),
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          Padding(
            padding: EdgeInsets.all(context.w(4)),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: context.w(2.5),
                        vertical: context.h(.3),
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor.withOpacity(.1),
                        borderRadius:
                            BorderRadius.circular(context.w(8)),
                      ),
                      child: Text(
                        "مكتملة",
                        style: TextStyle(
                          color: AppColors.deepPrimaryColor,
                          fontSize: context.sp(1.3),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),

                    const Spacer(),

                    Icon(
                      Icons.verified,
                      color: Colors.green,
                      size: context.w(5),
                    ),
                  ],
                ),

                SizedBox(height: context.h(1.5)),

                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    courseName,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: context.sp(2),
                    ),
                  ),
                ),

                SizedBox(height: context.h(.8)),

                Row(
                  children: [
                    Icon(
                      Icons.calendar_today_outlined,
                      size: context.w(4),
                      color: Colors.grey,
                    ),

                    SizedBox(width: context.w(2)),

                    Text(
                      date,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: context.sp(1.5),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: context.h(2)),

                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () {
                          // preview
                        },
                        icon: const Icon(Icons.remove_red_eye),
                        label: const Text("معاينة"),
                      ),
                    ),

                    SizedBox(width: context.w(3)),

                    Expanded(
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              AppColors.deepPrimaryColor,
                        ),
                        onPressed: () {
                          // download
                        },
                        icon: const Icon(Icons.download),
                        label: const Text("تحميل PDF"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}