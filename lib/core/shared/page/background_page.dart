import 'package:flutter/material.dart';
import 'package:mirath/core/constants/assets.dart';
import 'package:mirath/core/utils/extensions/context_extensions.dart';
import 'package:mirath/core/utils/extensions/widget_extensions.dart';

class BackgroundPage extends StatelessWidget {
  final Widget child;
  final String image;
  final String? wordImage;
  final double top;
  
  const BackgroundPage({
    super.key,
    required this.child,
    required this.image,
    required this.top,
    this.wordImage,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              decoration: BoxDecoration(
                // color: Color.fromARGB(255, 253, 249, 241),
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            SingleChildScrollView(
              child: Column(
                children: [
                  wordImage != null ? Image.asset(AppAssets.logo) : SizedBox(),
                  SizedBox(height: context.h(2)),
                  child,
                ],
              ).paddingOnlytop(context, top )
            ),
          ],
        ),
      ),
    );
  }
}
