import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../../../core/core.dart';
import '../../../../core/shared/page/in_background.dart';
import '../bloc/summary_details_bloc.dart';
import '../bloc/summary_details_state.dart';

class SummaryExtDetailsPage extends StatefulWidget {
  final int summaryId;
  const SummaryExtDetailsPage({super.key, required this.summaryId});

  @override
  State<SummaryExtDetailsPage> createState() => _SummaryExtDetailsPageState();
}

class _SummaryExtDetailsPageState extends State<SummaryExtDetailsPage> {
  final PdfViewerController _pdfController = PdfViewerController();

  late final int summaryId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SummaryDetailsBloc, SummaryDetailsState>(
      builder: (context, state) {
        if (state is SummaryDetailsLoading) {
          return Scaffold(
            backgroundColor: AppColors.offWhite,
            body: Center(
              child: CircularProgressIndicator(color: AppColors.primaryColor),
            ),
          );
        }

        if (state is SummaryDetailsFailure) {
          return Scaffold(
            backgroundColor: AppColors.offWhite,
            body: Center(child: Text(state.message)),
          );
        }

        if (state is SummaryDetailsSuccess) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: InBackgroundPage(
              labelAppBar: "الملخص الخارجي",
              onBackPressed: () {
                GoRouter.of(context).pop();
              },
              child: Column(
                children: [
                  SizedBox(height: context.h(8)),
                  Row(
                    children: [
                      Icon(
                        Icons.file_copy,
                        color: AppColors.primaryColor,
                        size: context.h(3.2),
                      ),
                      SizedBox(width: context.w(1)),
                      Expanded(
                        child: Text(
                          state.summary.title,
                          style: AppTextStyles.midDeepPrimaryColorStyle(
                            context,
                          ).copyWith(fontSize: context.sp(4.2)),
                        ),
                      ),
                    ],
                  ).paddingOnlyRight(context, 2),
                  SizedBox(height: context.h(2)),
                  SizedBox(
                    height: context.h(74),
                    width: context.w(90),
                    child: SfPdfViewer.network(
                      state.summary.content,
                      controller: _pdfController,
                      enableTextSelection: true,
                      canShowScrollHead: true,
                      canShowPaginationDialog: true,
                      enableDoubleTapZooming: true,
                    ),
                  ),
                ],
              ),
            ),
          );
        }

        return const SizedBox();
      },
    );
  }
}
