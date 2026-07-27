import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../bloc/chapter_details_bloc.dart';
import '../bloc/chapter_details_event.dart';

class PdfViewerWidget extends StatefulWidget {
  final String pdfUrl;
  final int progress;
  final int chapterId;

  final PdfViewerController controller;

  final ValueChanged<int> onPageChanged;

  const PdfViewerWidget({
    super.key,
    required this.pdfUrl,
    required this.progress,
    required this.chapterId,
    required this.controller,
    required this.onPageChanged,
  });

  @override
  State<PdfViewerWidget> createState() => _PdfViewerWidgetState();
}

class _PdfViewerWidgetState extends State<PdfViewerWidget> {
  int lastSentPage = 0;

  @override
  Widget build(BuildContext context) {
    return SfPdfViewer.network(
      widget.pdfUrl,
      controller: widget.controller,
      enableTextSelection: true,
      canShowScrollHead: true,
      canShowPaginationDialog: true,
      enableDoubleTapZooming: true,

      onDocumentLoaded: (details) {

        if (widget.progress > 0) {
          widget.controller.jumpToPage(widget.progress);
        }

      },

      onPageChanged: (details) {

        widget.onPageChanged(details.newPageNumber);

        /// كل عشر صفحات
        if (details.newPageNumber % 10 == 0 &&
            details.newPageNumber != lastSentPage) {

          lastSentPage = details.newPageNumber;

          context.read<ChapterDetailsBloc>().add(
                UpdateProgressEvent(
                  chapterId: widget.chapterId,
                  progress: details.newPageNumber.toDouble(),
                ),
              );
        }
      },
    );
  }
}