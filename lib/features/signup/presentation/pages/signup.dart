import 'package:flutter/material.dart';
import 'package:mirath/core/utils/extensions/context_extensions.dart';
import '../../../../core/design/tokens/typography.dart';

class ResponsiveTestPage extends StatelessWidget {
  const ResponsiveTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Responsive Test",
          // style: TextStyle(fontSize: context.sp(5)),
          style: AppTextStyles.bigBeigeStyle(context),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // 🔵 Container responsive
            Container(
              width: context.wp(80), // 80% من العرض
              height: context.hp(20), // 20% من الطول
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  "Responsive Box",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: context.sp(6),
                  ),
                ),
              ),
            ),

            SizedBox(height: context.hp(5)),

            // 🟢 زر responsive
            SizedBox(
              width: context.wp(50),
              height: context.hp(7),
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Click Me",
                  style: TextStyle(fontSize: context.sp(5)),
                ),
              ),
            ),

            SizedBox(height: context.hp(5)),

            // 📊 معلومات الشاشة
            Text(
              "Width: ${context.width.toStringAsFixed(2)}",
              style: TextStyle(fontSize: context.sp(4)),
            ),
            Text(
              "Height: ${context.height.toStringAsFixed(2)}",
              style: TextStyle(fontSize: context.sp(4)),
            ),
          ],
        ),
      ),
    );
  }
}