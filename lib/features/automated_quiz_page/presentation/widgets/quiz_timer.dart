import 'package:flutter/material.dart';
import 'package:mirath/core/utils/extensions/context_extensions.dart';

import '../../../../core/design/tokens/colors.dart';


class QuizTimerWidget extends StatefulWidget {
  final Duration remainingTime;
  final bool isWarning;

  const QuizTimerWidget({
    super.key,
    required this.remainingTime,
    required this.isWarning,
  });

  @override
  State<QuizTimerWidget> createState() => _QuizTimerWidgetState();
}

class _QuizTimerWidgetState extends State<QuizTimerWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  String format(Duration duration) {
    final minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');

    final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');

    return "$minutes:$seconds";
  }

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    if (widget.isWarning) {
      _controller.repeat(reverse: true);
    }
  }

  @override
  void didUpdateWidget(covariant QuizTimerWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.isWarning && !_controller.isAnimating) {
      _controller.repeat(reverse: true);
    }

    if (!widget.isWarning) {
      _controller.stop();
      _controller.value = 0;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = widget.isWarning ? Colors.red : AppColors.primaryColor;

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.scale(
          scale: widget.isWarning ? 1.0 + (_controller.value * 0.05) : 1.0,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Icon(Icons.alarm_rounded, color: color, size: context.h(15)),
              Container(
                width: context.h(8),
                height: context.h(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: widget.isWarning
                      ? Colors.red.shade50
                      : AppColors.offWhite,

                  boxShadow: [
                    BoxShadow(
                      color: color.withOpacity(widget.isWarning ? 0.6 : 0.15),
                      blurRadius: widget.isWarning ? 30 : 20,
                    ),
                  ],

                  border: Border.all(color: color, width: 2),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    format(widget.remainingTime),
                    style: TextStyle(color: color, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
