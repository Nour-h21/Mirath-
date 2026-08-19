import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../../../../core/core.dart';
import '../../../data/models/chapter_details_model.dart';
import '../../bloc/chapter_details_bloc.dart';
import '../../bloc/chapter_details_event.dart';
import '../../widgets/audio_player_container.dart';
import '../../widgets/pdf_action_button.dart';
import '../../widgets/pdf_header.dart';
import '../../widgets/pdf_search_bar.dart';
import '../../widgets/pdf_search_dialog.dart';
import '../../widgets/pdf_viewer.dart';

class PdfReaderPage extends StatefulWidget {
  final VoidCallback onPressedEditSummary;
  final ChapterDetailsModel data;
  final String autherName;
  final int chapterId;

  const PdfReaderPage({
    super.key,
    required this.onPressedEditSummary,
    required this.data,
    required this.autherName,
    required this.chapterId,
  });

  @override
  State<PdfReaderPage> createState() => _PdfReaderPageState();
}

class _PdfReaderPageState extends State<PdfReaderPage> {
  final PdfViewerController _pdfController = PdfViewerController();

  final TextEditingController _searchController = TextEditingController();

  final ValueNotifier<bool> showAudioPlayer = ValueNotifier(false);

  PdfTextSearchResult _searchResult = PdfTextSearchResult();

  bool isSearching = false;
  bool isDarkMode = false;
  int currentSearchIndex = 0;
  int currentPdfPage = 1;

  @override
  void dispose() {
    _searchController.dispose();
    showAudioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: InBackgroundPage(
        labelAppBar: "الباب (${widget.data.chapterNumber})",
        onBackPressed: () async {
          final currentPage = currentPdfPage;

          // إذا الصفحة الحالية مختلفة عن آخر Progress محفوظة
          if (currentPage != widget.data.pdf.progress) {
            context.read<ChapterDetailsBloc>().add(
              UpdateProgressEvent(
                chapterId: widget.data.pdf.id,
                progress: currentPage.toDouble(),
              ),
            );

            // نعطي الـ Bloc فرصة ينفذ الريكوست
            await Future.delayed(const Duration(milliseconds: 300));
          }

          if (!mounted) return;

          GoRouter.of(context).pop();
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: context.h(6)),

              PdfHeader(
                title: widget.data.chapterTitle,
                onEdit: widget.onPressedEditSummary,
              ),

              if (isSearching)
                PdfSearchBar(
                  searchResult: _searchResult,
                  currentSearchIndex: currentSearchIndex,
                  onPrevious: () {
                    _searchResult.previousInstance();
                    setState(() {
                      if (currentSearchIndex > 1) {
                        currentSearchIndex--;
                      }
                    });
                  },
                  onNext: () {
                    _searchResult.nextInstance();
                    setState(() {
                      if (currentSearchIndex <
                          _searchResult.totalInstanceCount) {
                        currentSearchIndex++;
                      }
                    });
                  },
                  onClose: () {
                    _searchResult.clear();
                    _searchController.clear();
                    setState(() {
                      isSearching = false;
                    });
                  },
                ),
              SizedBox(height: context.h(.5)),

              ValueListenableBuilder<bool>(
                valueListenable: showAudioPlayer,
                builder: (context, showAudio, _) {
                  return Column(
                    children: [
                      SizedBox(
                        height: isSearching
                            ? (showAudio ? context.h(49) : context.h(62.75))
                            : (showAudio ? context.h(55) : context.h(68.88)),
                        width: context.w(90),
                        child: PdfViewerWidget(
                          pdfUrl: widget.data.pdf.url,
                          progress: widget.data.pdf.progress,
                          chapterId: widget.data.pdf.id,
                          controller: _pdfController,
                          onPageChanged: (page) {
                            currentPdfPage = page;
                          },
                        ),
                      ),
                      AudioPlayerContainer(
                        visible: showAudio,
                        audioUrl: widget.data.audio.url,
                        progress: widget.data.audio.progress.toDouble(),
                        chapterId: widget.data.audio.id,
                        onProgressChanged: (progress) {
                          context.read<ChapterDetailsBloc>().add(
                            UpdateProgressEvent(
                              chapterId: widget.data.audio.id,
                              progress: progress,
                            ),
                          );
                        },
                      ),
                    ],
                  );
                },
              ),

              // SizedBox(
              //   height: context.h(68.77),
              //   width: context.w(90),
              //   child: PdfViewerWidget(
              //     pdfUrl: widget.data.pdf.url,
              //     progress: widget.data.pdf.progress,
              //     chapterId: widget.data.pdf.id,
              //     controller: _pdfController,
              //     onPageChanged: (_) {},
              //   ),
              // ),

              // ValueListenableBuilder(
              //   valueListenable: showAudioPlayer,

              //   builder: (_, visible, __) {
              //     return AudioPlayerContainer(
              //       visible: visible,
              //       audioUrl: widget.data.audio.url,
              //       progress: widget.data.audio.progress.toDouble(),
              //       chapterId: widget.data.audio.id,
              //     );
              //   },
              // ),
              SizedBox(height: context.h(1)),

              PdfBottomActions(
                isDarkMode: isDarkMode,

                onSearch: () {
                  PdfSearchDialog.show(
                    context: context,
                    controller: _pdfController,
                    searchController: _searchController,

                    onSearchFinished: (result) async {
                      await Future.delayed(const Duration(milliseconds: 300));
                      if (!mounted) return;
                      setState(() {
                        _searchResult = result;
                        isSearching = true;
                        currentSearchIndex = result.totalInstanceCount > 0
                            ? 1
                            : 0;
                      });
                    },
                  );
                },
                onAudio: () {
                  showAudioPlayer.value = !showAudioPlayer.value;
                },
                onVideo: () async {
                  // GoRouter.of(context).push(
                  //   '/SplitVideoAndSummaryPage',
                  //   extra: VideoPageArgs(
                  //     data: widget.data,
                  //     authorName: widget.autherName,
                  //     chapterId: widget.chapterId,
                  //   ),
                  // );
                  await GoRouter.of(context).push(
                    '/SplitVideoAndSummaryPage',
                    extra: VideoPageArgs(
                      data: widget.data,
                      authorName: widget.autherName,
                      chapterId: widget.chapterId,
                    ),
                  );

                  if (!mounted) return;

                  context.read<ChapterDetailsBloc>().add(
                    GetChapterDetailsEvent(widget.chapterId),
                  );
                },
                onTheme: () {
                  setState(() {
                    isDarkMode = !isDarkMode;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class VideoPageArgs {
  final ChapterDetailsModel data;
  final String authorName;
  final int chapterId;

  VideoPageArgs({
    required this.data,
    required this.authorName,
    required this.chapterId,
  });
}
