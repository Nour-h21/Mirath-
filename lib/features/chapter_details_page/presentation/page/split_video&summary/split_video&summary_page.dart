import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mirath/features/chapter_details_page/presentation/page/split_video&summary/video_page.dart';
import 'package:split_view/split_view.dart';

import '../../../../../app/di/injection_container.dart';
import '../../../../../core/design/tokens/colors.dart';
import '../../../../../core/shared/widgets/dialogs/app_alert_dialog.dart';
import '../../../../create_summary_page/presentation/bloc/create_summary_page_bloc.dart';
import '../../../../create_summary_page/presentation/page/create_summary_page.dart';
import '../split_pdfAndAudio&summary/pdf_with_audio_page.dart';

class SplitVideoAndSummaryPage extends StatefulWidget {
  // final ChapterDetailsModel data;
  final VideoPageArgs args;

  const SplitVideoAndSummaryPage({super.key, required this.args});

  @override
  State<SplitVideoAndSummaryPage> createState() =>
      _SplitVideoAndSummaryPageState();
}

class _SplitVideoAndSummaryPageState extends State<SplitVideoAndSummaryPage> {
  bool showSummary = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: showSummary
          ? SplitView(
              viewMode: SplitViewMode.Vertical,
              gripColor: AppColors.grey,
              gripSize: 8,
              children: [
                VideoPage(
                  onPressedEditSummary: () {
                    setState(() {
                      showSummary = !showSummary;
                    });
                  },
                  data: widget.args.data,
                  autherName: widget.args.authorName,
                ),
                BlocProvider(
                  create: (_) => getIt<CreateSummaryBloc>(),
                  child: CreateSummaryPage(
                    chapterId: widget.args.chapterId,
                    onCancle: () {
                      setState(() {
                        showSummary = false;
                      });
                    },
                  ),
                ),
              ],
            )
          : VideoPage(
              onPressedEditSummary: () {
                if (widget.args.data.haveSummary) {
                  AppAlertDialog.show(
                    context: context,
                    message:
                        "لديك ملخص سابق لهذا الباب، لا يمكنك إضافة أكثر من ملخص.",
                    onPressed: () {
                      GoRouter.of(context).pop();
                    },
                  );
                  return;
                }
                setState(() {
                  showSummary = !showSummary;
                });
              },
              data: widget.args.data,
              autherName: widget.args.authorName,
            ),
    );
  }
}
