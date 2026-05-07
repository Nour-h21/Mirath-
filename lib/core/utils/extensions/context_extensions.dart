import 'package:flutter/material.dart';

import '../../design/theme/app_colors_extension..dart';

extension ThemeX on BuildContext {
  AppColors get colors =>
      Theme.of(this).extension<AppColors>()!;
}

extension ContextSize on BuildContext {

  Size get size => MediaQuery.of(this).size;

  double get width => size.width;
  double get height => size.height;

  // 🔥 نسبة من العرض (بديل w)
  double w(double percent) => width * percent / 100;

  // 🔥 نسبة من الطول (بديل h)
  double h(double percent) => height * percent / 100;

  // 🔥 حجم الخط (بديل sp)
  double sp(double percent) => width * percent / 100;

  //  double sp(double percent) {
  //   final size = width * percent / 100;
  //   return size.clamp(12, 28);
  // }
}




// extension ContextX on BuildContext {
//   Size get size => MediaQuery.of(this).size;

//   double get width => size.width;
//   double get height => size.height;

//   AppColors get colors =>
//       Theme.of(this).extension<AppColors>()!;
// }