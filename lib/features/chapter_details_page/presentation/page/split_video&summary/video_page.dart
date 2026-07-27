import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mirath/core/design/tokens/colors.dart';
import 'package:mirath/core/shared/widgets/buttons/auth_button.dart';
import 'package:mirath/core/utils/extensions/context_extensions.dart';
import 'package:mirath/core/utils/extensions/widget_extensions.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../../../core/design/tokens/typography.dart';
import '../../../../../core/shared/page/In_background_page.dart';
import '../../../data/models/chapter_details_model.dart';
import '../../bloc/chapter_details_bloc.dart';
import '../../bloc/chapter_details_event.dart';
import '../../widgets/video_note_widget.dart';

class VideoPage extends StatefulWidget {
  final VoidCallback onPressedEditSummary;
  final ChapterDetailsModel data;
  final String autherName;

  const VideoPage({
    super.key,
    required this.onPressedEditSummary,
    required this.data,
    required this.autherName,
  });

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController noteController = TextEditingController();
  late YoutubePlayerController controller;
  late ChapterDetailsBloc chapterBloc;

  int lastSavedSecond = 0;

  @override
  void initState() {
    super.initState();

    chapterBloc = context.read<ChapterDetailsBloc>();

    final videoId = YoutubePlayer.convertUrlToId(widget.data.video.url);

    controller = YoutubePlayerController(
      initialVideoId: videoId ?? '',
      flags: YoutubePlayerFlags(
        autoPlay: false,
        startAt: widget.data.video.progress.toInt(),
      ),
    );

    controller.addListener(_videoProgressListener);
  }

  void _videoProgressListener() {
    final position = controller.value.position.inSeconds;

    /// حفظ كل 5 دقائق
    if (position - lastSavedSecond >= 300) {
      lastSavedSecond = position;

      chapterBloc.add(
        UpdateProgressEvent(
          chapterId: widget.data.video.id,
          progress: position.toDouble(),
        ),
      );
    }
  }

  @override
  void dispose() {
    final currentPosition = controller.value.position.inSeconds;

    /// احفظ فقط إذا القيمة صالحة
    if (currentPosition > 0) {
      chapterBloc.add(
        UpdateProgressEvent(
          chapterId: widget.data.video.id,
          progress: currentPosition.toDouble(),
        ),
      );
    }

    controller.removeListener(_videoProgressListener);
    controller.dispose();
    titleController.dispose();
    noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: AppColors.primaryColor,
        progressColors: ProgressBarColors(
          playedColor: AppColors.primaryColor,
          handleColor: AppColors.primaryColor,
          bufferedColor: AppColors.primaryColor.withOpacity(.3),
          backgroundColor: Colors.white24,
        ),
      ),
      builder: (context, player) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: InBackgroundPage(
            labelAppBar: "مشاهدة الشرح",
            onBackPressed: () {
              GoRouter.of(context).pop();
            },
            child: SizedBox(
              height: context.h(88),
              child: ListView(
                children: [
                  SizedBox(height: context.h(7.5)),
                  Container(
                    width: context.w(92),
                    height: context.h(25.5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.black.withOpacity(.12),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(22),
                      child: SizedBox(
                        height: context.h(27),
                        width: context.w(82),
                        child: player,
                      ),
                    ),
                  ).paddingSymetricH(context, 3.2),
                  SizedBox(height: context.h(3)),
                  Row(
                    children: [
                      Text(
                        widget.data.chapterTitle,
                        style: AppTextStyles.midDeepPrimaryColorStyle(context)
                            .copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: context.sp(5),
                            ),
                      ),
                      SizedBox(width: context.w(1)),
                      Text(
                        "- الباب (${widget.data.chapterNumber})",
                        style: AppTextStyles.midDeepPrimaryColorStyle(context)
                            .copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: context.sp(5),
                            ),
                      ),
                    ],
                  ).paddingOnlyRight(context, 2.5),

                  SizedBox(height: context.h(1.5)),
                  Row(
                    children: [
                      Icon(
                        Icons.school_outlined,
                        color: AppColors.primaryColor,
                        size: context.h(2.4),
                      ),
                      SizedBox(width: context.w(.5)),
                      Expanded(
                        child: Text(
                          "د. ${widget.autherName}",
                          style: AppTextStyles.smallBlack54Style(
                            context,
                          ).copyWith(fontSize: context.sp(4)),
                        ),
                      ),

                      AuthButton(
                        text: "أضف ملخصك",
                        width: context.w(30),
                        height: context.h(4),
                        onPressed: widget.onPressedEditSummary,
                        textStyle: AppTextStyles.googleLoginStyle(context)
                            .copyWith(
                              color: AppColors.offWhite,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                    ],
                  ).paddingSymetricH(context, 4.5),
                  SizedBox(height: context.h(8.5)),

                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(
                      horizontal: context.w(5),
                      vertical: context.h(1),
                    ),
                    padding: EdgeInsets.all(context.w(4)),
                    decoration: BoxDecoration(
                      color: AppColors.lightBaieg,
                      borderRadius: BorderRadius.circular(48),
                      border: Border.all(
                        color: AppColors.primaryColor.withOpacity(.15),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(.04),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: VideoNoteWidget(),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
