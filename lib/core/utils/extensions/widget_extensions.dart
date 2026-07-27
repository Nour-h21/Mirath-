import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mirath/core/utils/extensions/context_extensions.dart';

//padding
extension PaddingX on Widget {
  Widget paddingAll(BuildContext context, double value) {
    return Padding(padding: EdgeInsets.all(context.h(value)), child: this);
  }

  Widget paddingSymetric(
    BuildContext context,
    double vertical,
    double horizontal,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: context.h(vertical),
        horizontal: context.w(horizontal),
      ),
      child: this,
    );
  }

  Widget paddingSymetricV(BuildContext context, double vertical) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: context.h(vertical)),
      child: this,
    );
  }

  Widget paddingSymetricH(BuildContext context, double horizontal) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.w(horizontal)),
      child: this,
    );
  }

  Widget paddingOnlyLB(BuildContext context, double left, double buttom) {
    return Padding(
      padding: EdgeInsets.only(
        left: context.w(left),
        bottom: context.h(buttom),
      ),
      child: this,
    );
  }

  Widget paddingOnlytop(BuildContext context, double top) {
    return Padding(
      padding: EdgeInsets.only(top: context.h(top)),
      child: this,
    );
  }

  Widget paddingOnlytLR(
    BuildContext context,
    double top,
    double left,
    double right,
  ) {
    return Padding(
      padding: EdgeInsets.only(
        top: context.h(top),
        left: context.w(left),
        right: context.w(right),
      ),
      child: this,
    );
  }

  Widget paddingOnlyLR(BuildContext context, double left, double right) {
    return Padding(
      padding: EdgeInsets.only(left: context.w(left), right: context.w(right)),
      child: this,
    );
  }

  Widget paddingOnlyTB(BuildContext context, double top, double bottom) {
    return Padding(
      padding: EdgeInsets.only(top: context.w(top), bottom: context.w(bottom)),
      child: this,
    );
  }

  Widget paddingOnly(
    BuildContext context,
    double left,
    double right,
    double top,
    double bottom,
  ) {
    return Padding(
      padding: EdgeInsets.only(
        left: context.w(left),
        right: context.w(right),
        top: context.h(top),
        bottom: context.h(bottom),
      ),
      child: this,
    );
  }
}

extension PaddingExtension on BuildContext {
  EdgeInsets paddingSymmetric(double vertical, double horizontal) {
    return EdgeInsets.symmetric(
      vertical: h(vertical),
      horizontal: w(horizontal),
    );
  }
}

//Raduis
extension RadiusX on num {
  BorderRadius brResponsive(BuildContext context, double value) {
    return BorderRadius.circular(context.w(value));
  }
}
