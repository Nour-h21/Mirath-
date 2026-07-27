import 'package:flutter/material.dart';
import 'package:mirath/core/design/tokens/colors.dart';
import 'package:mirath/core/utils/extensions/widget_extensions.dart';

class ProgressSlider extends StatelessWidget {
  const ProgressSlider({super.key, required this.value, this.onChanged});

  final double value;
  final ValueChanged<double>? onChanged;

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderThemeData(
        thumbColor: AppColors.primaryColor,

        activeTrackColor: AppColors.primaryColor,

        inactiveTrackColor: Color.fromARGB(255, 197, 187, 187),

        trackHeight: 8,

        thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 7.5),
      ),

      child: Slider(
        value: value,

        min: 0,

        max: 100, // نسبة بين 0 و 1

        onChanged: (double value) {},
      ).paddingOnlyLR(context, 1, 1),
    );
  }
}
