import 'package:flutter/material.dart';
import 'package:mirath/core/utils/extensions/context_extensions.dart';
import 'package:mirath/core/utils/extensions/widget_extensions.dart';

import '../../constants/assets.dart';

class AuthBackground extends StatelessWidget {
  final Widget child;
  final String image;
  final double top;
  const AuthBackground({super.key, required this.child, required this.image, required this.top});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.fill,
                ),
              ),
            ),
      
            SingleChildScrollView(
              child: Column(
                children: [Image.asset(AppAssets.logo),SizedBox(height: context.h(2)), child],
              ).paddingOnlytop(context, top),
            ),
          ],
        ),
      ),
    );
  }
}
