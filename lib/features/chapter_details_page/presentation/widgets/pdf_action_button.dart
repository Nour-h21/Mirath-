import 'package:flutter/material.dart';
import 'package:mirath/core/utils/extensions/context_extensions.dart';
import '../../../../core/design/tokens/colors.dart';

class PdfActionButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const PdfActionButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(icon, color: AppColors.primaryColor, size: context.h(3.2),),
    );
  }
}


class PdfBottomActions extends StatelessWidget {
  final bool isDarkMode;
  final VoidCallback onSearch;
  final VoidCallback onAudio;
  final VoidCallback onVideo;
  final VoidCallback onTheme;

  const PdfBottomActions({
    super.key,
    required this.isDarkMode,
    required this.onSearch,
    required this.onAudio,
    required this.onVideo,
    required this.onTheme,

  });

  @override
  Widget build(BuildContext context) {

    return Row(

      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

      children: [

        PdfActionButton(
          icon: Icons.search,
          onPressed: onSearch,
        ),

        PdfActionButton(
          icon: Icons.headphones,
          onPressed: onAudio,
        ),

        PdfActionButton(
          icon: Icons.video_collection,
          onPressed: onVideo,
        ),

        PdfActionButton(
          icon: isDarkMode
              ? Icons.light_mode
              : Icons.dark_mode,
          onPressed: onTheme,
        ),

      ],

    );

  }

}