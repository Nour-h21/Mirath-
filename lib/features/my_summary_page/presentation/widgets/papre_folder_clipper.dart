import 'dart:ui';

import 'package:flutter/material.dart';

class FolderClipperRTL extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, size.height * .18);
    path.lineTo(size.width * .35, size.height * .18);
    path.lineTo(size.width * .45, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
