import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mirath/core/shared/widgets/buttons/auth_button.dart';
import 'package:mirath/core/shared/widgets/buttons/cancle_button.dart';

import '../../../../core/core.dart';

import '../bloc/summary_details_bloc.dart';
import '../bloc/summary_details_event.dart';
import '../bloc/summary_details_state.dart';
import '../widgets/summary_text_field_widget.dart';

class SummaryIntDetailsPage extends StatefulWidget {
  const SummaryIntDetailsPage({super.key, required this.summaryId});

  final int summaryId;

  @override
  State<SummaryIntDetailsPage> createState() => _SummaryIntDetailsPageState();
}

class _SummaryIntDetailsPageState extends State<SummaryIntDetailsPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController titleController = TextEditingController();

  final TextEditingController noteController = TextEditingController();

  bool isEditing = false;

  late String originalTitle;
  late String originalContent;

  @override
  void dispose() {
    titleController.dispose();
    noteController.dispose();
    super.dispose();
  }

  void cancelEditing() {
    titleController.text = originalTitle;
    noteController.text = originalContent;

    setState(() {
      isEditing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SummaryDetailsBloc, SummaryDetailsState>(
      listener: (context, state) {
        if (state is SummaryDetailsSuccess) {
          titleController.text = state.summary.title;
          noteController.text = state.summary.content;

          originalTitle = state.summary.title;
          originalContent = state.summary.content;
        }

        if (state is EditSummarySuccess) {
          originalTitle = titleController.text;
          originalContent = noteController.text;

          setState(() {
            isEditing = false;
          });

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.green,
              content: Text(
                "تم حفظ التعديلات بنجاح",
                style: AppTextStyles.authbuttonStyle(
                  context,
                ).copyWith(fontSize: context.sp(3.6)),
              ),
            ),
          );
        }

        if (state is SummaryDetailsFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        if (state is SummaryDetailsLoading) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(color: AppColors.primaryColor),
            ),
          );
        }

        return Directionality(
          textDirection: TextDirection.rtl,
          child: InBackgroundPage(
            labelAppBar: "ملخصي الشخصي",
            onBackPressed: () {
              GoRouter.of(context).push('/MySummaryPage');
            },
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Padding(
                padding: EdgeInsets.all(context.h(1.2)),
                child: Form(
                  key: _formKey,
                  child: SizedBox(
                    height: context.h(88),
                    child: ListView(
                      children: [
                        SizedBox(height: context.h(6)),
                        Row(
                          children: [
                            if (!isEditing)
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: context.w(4),
                                    vertical: context.h(1.6),
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.primaryColor.withOpacity(
                                      .08,
                                    ),
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.info_outline,
                                        color: AppColors.primaryColor,
                                      ),
                                      SizedBox(width: context.w(2)),
                                      Expanded(
                                        child: Text(
                                          "يمكنك تعديل التلخيص بالضغط على أيقونة التعديل.",
                                          style:
                                              AppTextStyles.smallBlack54Style(
                                                context,
                                              ).copyWith(
                                                fontSize: context.sp(3.2),
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                            if (!isEditing)
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    isEditing = true;
                                  });
                                },
                                icon: Icon(
                                  Icons.edit_note,
                                  color: AppColors.primaryColor,
                                  size: context.h(4.3),
                                ),
                              ),
                          ],
                        ),

                        SizedBox(height: context.h(2)),

                        SummaryTextFormField(
                          key: ValueKey('title_$isEditing'),
                          controller: titleController,
                          readOnly: !isEditing,
                          hintText: "عنوان الملخص",
                          maxLines: 1,
                          validator: (value) {
                            if (!isEditing) return null;

                            if (value == null || value.trim().isEmpty) {
                              return "الرجاء إدخال عنوان التلخيص";
                            }

                            return null;
                          },
                        ),

                        SizedBox(height: context.h(2)),

                        SummaryTextFormField(
                          key: ValueKey('note_$isEditing'),
                          controller: noteController,
                          readOnly: !isEditing,
                          hintText: "اكتب ملخصك أو ملاحظاتك هنا...",
                          maxLines: 22,
                          validator: (value) {
                            if (!isEditing) return null;

                            if (value == null || value.trim().isEmpty) {
                              return "الرجاء إدخال التلخيص";
                            }
                            return null;
                          },
                        ),

                        SizedBox(height: context.h(1.8)),
                        if (isEditing) ...[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AuthButton(
                                text: state is EditSummaryLoading
                                    ? "جاري الحفظ..."
                                    : "حفظ التعديلات",
                                width: context.w(38),
                                height: context.h(5),
                                onPressed: state is EditSummaryLoading
                                    ? null
                                    : () {
                                        if (!_formKey.currentState!
                                            .validate()) {
                                          return;
                                        }

                                        context.read<SummaryDetailsBloc>().add(
                                          EditSummaryEvent(
                                            id: widget.summaryId,
                                            title: titleController.text.trim(),
                                            content: noteController.text.trim(),
                                          ),
                                        );
                                      },
                                textStyle: AppTextStyles.login3Style(
                                  context,
                                ).copyWith(color: AppColors.offWhite),
                              ),

                              SizedBox(width: context.w(4)),
                              CancleButton(
                                text: "إلغاء",
                                onPressed: cancelEditing,
                                height: context.h(5),
                                width: context.w(35),
                                textStyle: AppTextStyles.login3Style(
                                  context,
                                ).copyWith(color: AppColors.primaryColor),
                              ),
                            ],
                          ),

                          SizedBox(height: context.h(1.8)),
                        ],
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
