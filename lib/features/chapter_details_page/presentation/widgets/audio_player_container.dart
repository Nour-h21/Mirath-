import 'package:flutter/material.dart';
import 'package:mirath/core/utils/extensions/context_extensions.dart';

import 'audio_floating_player.dart';

class AudioPlayerContainer extends StatelessWidget {
  final bool visible;
  final String audioUrl;
  final double progress;
  final int chapterId;
  final ValueChanged<double>? onProgressChanged;

  const AudioPlayerContainer({
    super.key,
    required this.visible,
    required this.audioUrl,
    required this.progress,
    required this.chapterId,
    required this.onProgressChanged,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: visible ? context.h(13) : 0,
      child: visible
          ? AudioFloatingPlayer(
              audioUrl: audioUrl,
              progress: progress,
              chapterId: chapterId,
              onProgressChanged: onProgressChanged,
            )
          : const SizedBox(),
    );
  }
}
