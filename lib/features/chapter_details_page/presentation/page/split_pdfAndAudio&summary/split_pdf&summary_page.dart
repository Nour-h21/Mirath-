import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mirath/features/chapter_details_page/presentation/page/split_pdfAndAudio&summary/pdf_with_audio_page.dart';
import 'package:split_view/split_view.dart';

import '../../../../../app/di/injection_container.dart';
import '../../../../../core/design/tokens/colors.dart';
import '../../../../../core/shared/widgets/dialogs/app_alert_dialog.dart';
import '../../../../create_summary_page/presentation/bloc/create_summary_page_bloc.dart';
import '../../../../create_summary_page/presentation/page/create_summary_page.dart';
import '../../bloc/chapter_details_bloc.dart';
import '../../bloc/chapter_details_event.dart';
import '../../bloc/chapter_details_state.dart';

class SplitPdfAndSummaryPage extends StatefulWidget {
  final int chapterId;
  final String autherName;

  const SplitPdfAndSummaryPage({
    super.key,
    required this.chapterId,
    required this.autherName,
  });

  @override
  State<SplitPdfAndSummaryPage> createState() => _SplitPdfAndSummaryPageState();
}

class _SplitPdfAndSummaryPageState extends State<SplitPdfAndSummaryPage> {
  bool showSummary = false;

  @override
  void initState() {
    super.initState();
    context.read<ChapterDetailsBloc>().add(
      GetChapterDetailsEvent(widget.chapterId),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChapterDetailsBloc, ChapterDetailsState>(
      builder: (context, state) {
        if (state is ChapterDetailsLoading) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(color: AppColors.primaryColor),
            ),
          );
        }
        if (state is ChapterDetailsSuccess) {
          print("pdfffffffffffffffff${state.data.pdf.url}");
          print("AAAAAAAAAAAAudio${state.data.audio.url}");
          print("vvvvvvvvvvideo${state.data.video.url}");
          return Scaffold(
            backgroundColor: Colors.transparent,
            body: showSummary
                ? SplitView(
                    viewMode: SplitViewMode.Vertical,
                    gripColor: AppColors.grey,
                    gripSize: 8,
                    children: [
                      PdfReaderPage(
                        data: state.data,
                        onPressedEditSummary: () {
                          setState(() {
                            showSummary = false;
                          });
                        },
                        autherName: widget.autherName,
                        chapterId: widget.chapterId,
                      ),
                      BlocProvider(
                        create: (_) => getIt<CreateSummaryBloc>(),
                        child: CreateSummaryPage(
                          chapterId: widget.chapterId,
                          onCancle: () {
                            setState(() {
                              showSummary = false;
                               context.read<ChapterDetailsBloc>().add(
                                GetChapterDetailsEvent(widget.chapterId),
                              );
                            });
                          },
                        ),
                      ),
                    ],
                  )
                : PdfReaderPage(
                    data: state.data,
                    onPressedEditSummary: () {
                      if (state.data.haveSummary) {
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
                    autherName: widget.autherName,
                    chapterId: widget.chapterId,
                  ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
