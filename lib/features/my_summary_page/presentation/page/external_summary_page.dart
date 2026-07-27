import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mirath/core/utils/extensions/context_extensions.dart';
import 'package:mirath/core/utils/extensions/widget_extensions.dart';
import '../../../../core/design/tokens/colors.dart';
import '../../../../core/design/tokens/typography.dart';
import '../bloc/my_summary_page_bloc.dart';
import '../bloc/my_summary_page_event.dart';
import '../bloc/my_summary_page_state.dart';
import '../widgets/delete_summary_dialog.dart';
import '../widgets/extenal_summary_card.dart';
import '../widgets/upload_summary_fab.dart';

class ExternalSummaryPage extends StatefulWidget {
  const ExternalSummaryPage({super.key});

  @override
  State<ExternalSummaryPage> createState() => _ExternalSummaryPageState();
}

class _ExternalSummaryPageState extends State<ExternalSummaryPage> {
  @override
  void initState() {
    super.initState();

    context.read<MySummaryBloc>().add(GetExternalSummariesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MySummaryBloc, MySummaryState>(
      builder: (context, state) {
        if (state is MySummaryLoading) {
          return Scaffold(
            backgroundColor: AppColors.transparent,
            body: Center(
              child: CircularProgressIndicator(color: AppColors.primaryColor),
            ),
          );
        }

        if (state is MySummaryFailure) {
          return Scaffold(
            backgroundColor: AppColors.transparent,
            body: Center(child: Text(state.message)),
          );
        }

        if (state is ExternalSummarySuccess) {
          return Directionality(
            textDirection: TextDirection.ltr,
            child: Scaffold(
              backgroundColor: Colors.transparent,
              floatingActionButton: UploadSummaryFab(
                onTap: () {
                  GoRouter.of(context).push('/UploadSummaryPage');
                },
              ),
              body: Directionality(
                textDirection: TextDirection.rtl,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          child: state.summaries.isEmpty
                              ? Center(
                                  child: Text(
                                    "لا يوجد ملخصات خارجية حتى الآن 🤔",
                                    style: AppTextStyles.smallBlack54Style(
                                      context,
                                    ),
                                  ),
                                ).paddingOnlytop(context, 25)
                              : SizedBox(
                                  height: context.h(69),
                                  child: ListView.builder(
                                    itemCount: state.summaries.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: ExtenalSummaryCard(
                                          title: state
                                              .summaries[index]
                                              .summaryTitle,
                                          chapterName: state
                                              .summaries[index]
                                              .chapterTitle,
                                          createdAt:
                                              state.summaries[index].createdAt,
                                          onDelete: () {
                                            DeleteSummaryDialog.show(
                                              summaryId:
                                                  state.summaries[index].id,
                                              context: context,
                                              onDeleted: () {
                                                GoRouter.of(context).pop();

                                                context
                                                    .read<MySummaryBloc>()
                                                    .add(
                                                      DeleteSummaryEvent(
                                                        state
                                                            .summaries[index]
                                                            .id,
                                                      ),
                                                    );
                                                context.read<MySummaryBloc>().add(
                                                  GetExternalSummariesEvent(),
                                                );
                                              },
                                            );
                                          },
                                          onDetails: () {
                                            GoRouter.of(
                                              context,
                                            ).pushReplacement(
                                              '/SummaryExtDetailsPage',
                                              extra: state.summaries[index].id,
                                            );
                                          },
                                        ),
                                      );
                                    },
                                  ),
                                ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }

        return const SizedBox();
      },
    );
  }
}
