import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:mirath/core/design/tokens/colors.dart';
import 'package:mirath/core/utils/extensions/context_extensions.dart';

import '../bloc/chapter_details_bloc.dart';
import '../bloc/chapter_details_event.dart';

// class AudioFloatingPlayer extends StatefulWidget {
//   final String audioUrl;
//   final double progress;

//   const AudioFloatingPlayer({
//     super.key,
//     required this.audioUrl,
//     required this.progress,
//   });

//   @override
//   State<AudioFloatingPlayer> createState() => _AudioFloatingPlayerState();
// }

// class _AudioFloatingPlayerState extends State<AudioFloatingPlayer> {
//   final AudioPlayer _player = AudioPlayer();

//   bool isPlaying = false;
//   double speed = 1.0;

//   @override
//   void initState() {
//     super.initState();

//     _initAudio();

//     _player.playerStateStream.listen((state) {
//       if (mounted) {
//         setState(() {
//           isPlaying = state.playing;
//         });
//       }
//     });
//   }

//   Future<void> _initAudio() async {
//     try {
//       // await _player.setUrl(
//       //   "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3",
//       // );
//       await _player.setUrl(widget.audioUrl);
//       await _player.seek(Duration(seconds: widget.progress.toInt()));

//       setState(() {});
//     } catch (e) {
//       debugPrint(e.toString());
//     }
//   }

//   @override
//   void dispose() {
//     _player.dispose();
//     super.dispose();
//   }

//   String formatDuration(Duration duration) {
//     String twoDigits(int n) => n.toString().padLeft(2, '0');

//     final minutes = twoDigits(duration.inMinutes.remainder(60));
//     final seconds = twoDigits(duration.inSeconds.remainder(60));

//     return "$minutes:$seconds";
//   }

//   Future<void> _changeSpeed() async {
//     if (speed == 1.0) {
//       speed = 1.25;
//     } else if (speed == 1.25) {
//       speed = 1.5;
//     } else if (speed == 1.5) {
//       speed = 2.0;
//     } else {
//       speed = 1.0;
//     }

//     await _player.setSpeed(speed);

//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<Duration?>(
//       stream: _player.durationStream,
//       builder: (context, durationSnapshot) {
//         final duration = durationSnapshot.data ?? Duration.zero;

//         return StreamBuilder<Duration>(
//           stream: _player.positionStream,
//           builder: (context, positionSnapshot) {
//             final position = positionSnapshot.data ?? Duration.zero;
//             return Container(
//               margin: EdgeInsets.symmetric(horizontal: context.w(3)),
//               decoration: BoxDecoration(
//                 color: AppColors.offWhite,
//                 borderRadius: BorderRadius.circular(25),
//                 gradient: LinearGradient(
//                   colors: [
//                     AppColors.black.withOpacity(0.12),
//                     AppColors.black.withOpacity(0.12),
//                   ],
//                 ),
//               ),
//               child: Column(
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.symmetric(
//                       horizontal: context.w(7),
//                       vertical: context.h(0.2),
//                     ),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           formatDuration(position),
//                           style: TextStyle(color: AppColors.lightBlack),
//                         ),

//                         GestureDetector(
//                           onTap: _changeSpeed,
//                           child: Container(
//                             padding: EdgeInsets.symmetric(
//                               horizontal: context.w(3),
//                               vertical: context.h(0.4),
//                             ),
//                             decoration: BoxDecoration(
//                               color: AppColors.offWhite,
//                               borderRadius: BorderRadius.circular(20),
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Colors.black.withOpacity(.08),
//                                   blurRadius: 10,
//                                 ),
//                               ],
//                             ),
//                             child: Text(
//                               "${speed}x",
//                               style: TextStyle(
//                                 color: AppColors.deepPrimaryColor,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                         ),

//                         Text(
//                           formatDuration(duration),
//                           style: TextStyle(color: AppColors.lightBlack),
//                         ),
//                       ],
//                     ),
//                   ),

//                   Flexible(
//                     flex: 4,
//                     child: SliderTheme(
//                       data: SliderTheme.of(context).copyWith(
//                         trackHeight: 4.2,
//                         thumbShape: const RoundSliderThumbShape(
//                           enabledThumbRadius: 6.5,
//                         ),
//                       ),
//                       child: Slider(
//                         value: duration.inMilliseconds == 0
//                             ? 0
//                             : position.inMilliseconds / duration.inMilliseconds,
//                         activeColor: AppColors.deepPrimaryColor,
//                         onChanged: (value) {
//                           final seekPosition = duration * value;

//                           _player.seek(seekPosition);
//                         },
//                         thumbColor: AppColors.deepPrimaryColor,
//                       ),
//                     ),
//                   ),

//                   Flexible(
//                     flex: 9,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         IconButton(
//                           onPressed: () async {
//                             await _player.seek(
//                               position - const Duration(seconds: 10),
//                             );
//                           },
//                           icon: Icon(
//                             Icons.replay_10_rounded,
//                             size: context.h(3.5),
//                             color: AppColors.primaryColor,
//                           ),
//                         ),

//                         GestureDetector(
//                           onTap: () async {
//                             if (_player.playing) {
//                               await _player.pause();
//                             } else {
//                               await _player.play();
//                             }
//                           },
//                           child: Container(
//                             width: context.w(12),
//                             height: context.h(12),
//                             decoration: BoxDecoration(
//                               shape: BoxShape.circle,
//                               gradient: LinearGradient(
//                                 colors: [
//                                   AppColors.primaryColor,
//                                   AppColors.deepPrimaryColor,
//                                 ],
//                               ),
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: AppColors.primaryColor.withOpacity(
//                                     .35,
//                                   ),
//                                   blurRadius: 25,
//                                   spreadRadius: 2,
//                                 ),
//                               ],
//                             ),
//                             child: Icon(
//                               isPlaying
//                                   ? Icons.pause_rounded
//                                   : Icons.play_arrow_rounded,
//                               color: Colors.white,
//                               size: context.h(3.5),
//                             ),
//                           ),
//                         ),

//                         IconButton(
//                           onPressed: () async {
//                             await _player.seek(
//                               position + const Duration(seconds: 10),
//                             );
//                           },
//                           icon: Icon(
//                             Icons.forward_10_rounded,
//                             size: context.h(3.5),
//                             color: AppColors.primaryColor,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
// }
class AudioFloatingPlayer extends StatefulWidget {
  final String audioUrl;
  final double progress;
  final int chapterId;

  const AudioFloatingPlayer({
    super.key,
    required this.audioUrl,
    required this.progress,
    required this.chapterId,
  });

  @override
  State<AudioFloatingPlayer> createState() => _AudioFloatingPlayerState();
}

class _AudioFloatingPlayerState extends State<AudioFloatingPlayer> {
  final AudioPlayer _player = AudioPlayer();

  late ChapterDetailsBloc chapterBloc;

  double speed = 1.0;

  int lastSavedSecond = 0;

  late StreamSubscription<Duration> _positionSubscription;

  @override
  void initState() {
    super.initState();

    chapterBloc = context.read<ChapterDetailsBloc>();

    _initAudio();

    _positionSubscription = _player.positionStream.listen((position) {
      final seconds = position.inSeconds;

      /// حفظ كل 5 دقائق
      if (seconds - lastSavedSecond >= 300) {
        lastSavedSecond = seconds;

        chapterBloc.add(
          UpdateProgressEvent(
            chapterId: widget.chapterId,
            progress: seconds.toDouble(),
          ),
        );
      }
    });
  }

  Future<void> _initAudio() async {
    try {
      // await _player.setUrl(
      //   widget.audioUrl,
      // );
      await _player.setUrl(
        "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3",
      );

      /// رجع الصوت من مكان التقدم
      await _player.seek(Duration(seconds: widget.progress.toInt()));
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void dispose() {
    /// حفظ آخر ثانية قبل الخروج
    final currentPosition = _player.position.inSeconds;
    if (currentPosition > 0) {
      chapterBloc.add(
        UpdateProgressEvent(
          chapterId: widget.chapterId,
          progress: currentPosition.toDouble(),
        ),
      );
    }
    _positionSubscription.cancel();

    _player.dispose();

    super.dispose();
  }

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');

    final minutes = twoDigits(duration.inMinutes.remainder(60));

    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return "$minutes:$seconds";
  }

  Future<void> _changeSpeed() async {
    if (speed == 1.0) {
      speed = 1.25;
    } else if (speed == 1.25) {
      speed = 1.5;
    } else if (speed == 1.5) {
      speed = 2.0;
    } else {
      speed = 1.0;
    }

    await _player.setSpeed(speed);

    if (mounted) {
      setState(() {});
    }
  }
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PlayerState>(
      stream: _player.playerStateStream,
      builder: (context, playerSnapshot) {
        final playerState = playerSnapshot.data;

        final isPlaying = playerState?.playing ?? false;

        final processingState = playerState?.processingState;

        final isCompleted = processingState == ProcessingState.completed;

        return StreamBuilder<Duration?>(
          stream: _player.durationStream,
          builder: (context, durationSnapshot) {
            final duration = durationSnapshot.data ?? Duration.zero;

            return StreamBuilder<Duration>(
              stream: _player.positionStream,
              builder: (context, positionSnapshot) {
                Duration position = positionSnapshot.data ?? Duration.zero;

                /// منع تجاوز القيمة للـ Slider
                if (position > duration) {
                  position = duration;
                }

                final sliderValue = duration.inMilliseconds == 0
                    ? 0.0
                    : position.inMilliseconds / duration.inMilliseconds;

                return Container(
                  margin: EdgeInsets.symmetric(horizontal: context.w(3)),
                  decoration: BoxDecoration(
                    color: AppColors.offWhite,
                    borderRadius: BorderRadius.circular(25),
                    gradient: LinearGradient(
                      colors: [
                        AppColors.black.withOpacity(0.12),
                        AppColors.black.withOpacity(0.12),
                      ],
                    ),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: context.w(7),
                          vertical: context.h(0.2),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              formatDuration(position),
                              style: TextStyle(color: AppColors.lightBlack),
                            ),

                            /// السرعة
                            GestureDetector(
                              onTap: _changeSpeed,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: context.w(3),
                                  vertical: context.h(0.4),
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.offWhite,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(.08),
                                      blurRadius: 10,
                                    ),
                                  ],
                                ),
                                child: Text(
                                  "${speed}x",
                                  style: TextStyle(
                                    color: AppColors.deepPrimaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),

                            Text(
                              formatDuration(duration),
                              style: TextStyle(color: AppColors.lightBlack),
                            ),
                          ],
                        ),
                      ),

                      /// Slider
                      Flexible(
                        flex: 4,
                        child: SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            trackHeight: 4.2,
                            thumbShape: const RoundSliderThumbShape(
                              enabledThumbRadius: 6.5,
                            ),
                          ),
                          child: Slider(
                            value: sliderValue.clamp(0.0, 1.0),

                            activeColor: AppColors.deepPrimaryColor,

                            thumbColor: AppColors.deepPrimaryColor,

                            onChanged: (value) async {
                              final seekPosition = duration * value;

                              await _player.seek(seekPosition);
                            },
                          ),
                        ),
                      ),

                      Flexible(
                        flex: 9,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            /// رجوع 10 ثواني
                            IconButton(
                              onPressed: () async {
                                await _player.seek(
                                  position - const Duration(seconds: 10),
                                );
                              },
                              icon: Icon(
                                Icons.replay_10_rounded,
                                size: context.h(3.5),
                                color: AppColors.primaryColor,
                              ),
                            ),

                            /// تشغيل / إعادة تشغيل
                            GestureDetector(
                              onTap: () async {
                                /// إذا انتهى الصوت
                                if (isCompleted) {
                                  await _player.seek(Duration.zero);

                                  await _player.play();
                                  return;
                                }

                                if (isPlaying) {
                                  await _player.pause();
                                } else {
                                  await _player.play();
                                }
                              },
                              child: Container(
                                width: context.w(12),
                                height: context.h(12),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: LinearGradient(
                                    colors: [
                                      AppColors.primaryColor,
                                      AppColors.deepPrimaryColor,
                                    ],
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.primaryColor.withOpacity(
                                        .35,
                                      ),
                                      blurRadius: 25,
                                      spreadRadius: 2,
                                    ),
                                  ],
                                ),
                                child: Icon(
                                  isPlaying && !isCompleted
                                      ? Icons.pause_rounded
                                      : Icons.play_arrow_rounded,
                                  color: Colors.white,
                                  size: context.h(3.5),
                                ),
                              ),
                            ),

                            /// تقديم 10 ثواني
                            IconButton(
                              onPressed: () async {
                                await _player.seek(
                                  position + const Duration(seconds: 10),
                                );
                              },
                              icon: Icon(
                                Icons.forward_10_rounded,
                                size: context.h(3.5),
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: context.h(1)),
                    ],
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
