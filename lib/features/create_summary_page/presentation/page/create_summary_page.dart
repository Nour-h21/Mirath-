import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mirath/core/design/tokens/colors.dart';
import 'package:mirath/core/shared/widgets/buttons/auth_button.dart';
import 'package:mirath/core/shared/widgets/dialogs/app_alert_dialog.dart';
import 'package:mirath/core/utils/extensions/context_extensions.dart';

import '../../../../core/design/tokens/typography.dart';
import '../../../../core/shared/widgets/buttons/cancle_button.dart';
import '../../../summary_details_page/presentation/widgets/summary_text_field_widget.dart';
import '../bloc/create_summary_page_bloc.dart';
import '../bloc/create_summary_page_event.dart';
import '../bloc/create_summary_page_state.dart';

// class CreateSummaryPage extends StatefulWidget {
//   final VoidCallback onCancle;
//   const CreateSummaryPage({super.key, required this.onCancle});

//   @override
//   State<CreateSummaryPage> createState() => _CreateSummaryViewState();
// }

// class _CreateSummaryViewState extends State<CreateSummaryPage> {
//   final TextEditingController titleController = TextEditingController();

//   final TextEditingController noteController = TextEditingController();

//   final _formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.offWhite,
//       body: SingleChildScrollView(
//         child: Directionality(
//           textDirection: TextDirection.rtl,
//           child: Padding(
//             padding: EdgeInsets.all(context.h(1.2)),
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 children: [
//                   Row(
//                     children: [
//                       Icon(
//                         Icons.edit_note,
//                         color: AppColors.primaryColor,
//                         size: context.h(3.2),
//                       ),
//                       SizedBox(width: context.w(2)),
//                       Text(
//                         "ملخصي الشخصي",
//                         style: AppTextStyles.midDeepPrimaryColorStyle(context),
//                       ),
//                     ],
//                   ),

//                   SizedBox(height: context.h(2)),
//                   SummaryTextFormField(
//                     controller: titleController,
//                     hintText: "عنوان الملخص",
//                     maxLines: 1,
//                     validator: (value) {
//                       if (value == null || value.trim().isEmpty) {
//                         return "الرجاء إدخال عنوان التلخيص";
//                       }
//                       return null;
//                     },
//                   ),

//                   SizedBox(height: context.h(2)),

//                   SummaryTextFormField(
//                     controller: noteController,
//                     hintText: "اكتب ملخصك أو ملاحظاتك هنا...",
//                     maxLines: context.h(5) ~/ context.h(0.5),
//                     validator: (value) {
//                       if (value == null || value.trim().isEmpty) {
//                         return "الرجاء إدخال التلخيص";
//                       }
//                       return null;
//                     },
//                   ),

//                   SizedBox(height: context.h(2)),

//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       AuthButton(
//                         text: "حفظ",
//                         width: context.w(35),
//                         height: context.h(5),
//                         onPressed: () {
//                           if (!_formKey.currentState!.validate()) {
//                             return;
//                           }
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             const SnackBar(content: Text("تم حفظ الملخص")),
//                           );
//                         },
//                         textStyle: AppTextStyles.login3Style(
//                           context,
//                         ).copyWith(color: AppColors.offWhite),
//                       ),
//                       SizedBox(width: context.w(4)),
//                       SizedBox(
//                         width: context.w(35),
//                         height: context.h(5),
//                         child: ElevatedButton(
//                           onPressed: () {
//                             widget.onCancle();
//                           },
//                           style: ElevatedButton.styleFrom(
//                             padding: EdgeInsets.zero,
//                             backgroundColor: AppColors.offWhite,
//                             shadowColor: AppColors.deepPrimaryColor,
//                             elevation: 2,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadiusGeometry.circular(24),
//                               side: BorderSide(
//                                 color: AppColors.primaryColor,
//                                 width: context.w(0.4),
//                               ),
//                             ),
//                           ),
//                           child: Text(
//                             "إلغاء",
//                             style: AppTextStyles.login3Style(
//                               context,
//                             ).copyWith(color: AppColors.primaryColor),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class CreateSummaryPage extends StatefulWidget {
//   const CreateSummaryPage({
//     super.key,
//     required this.onCancle,
//     required this.chapterId,
//   });

//   final VoidCallback onCancle;
//   final int chapterId;

//   @override
//   State<CreateSummaryPage> createState() => _CreateSummaryViewState();
// }

// class _CreateSummaryViewState extends State<CreateSummaryPage> {
//   final _formKey = GlobalKey<FormState>();

//   final TextEditingController titleController = TextEditingController();

//   final TextEditingController noteController = TextEditingController();

//   @override
//   void dispose() {
//     titleController.dispose();
//     noteController.dispose();
//     super.dispose();
//   }

//   void saveSummary() {
//     if (!_formKey.currentState!.validate()) {
//       return;
//     }

//     ScaffoldMessenger.of(
//       context,
//     ).showSnackBar(const SnackBar(content: Text("تم حفظ الملخص")));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.offWhite,
//       body: SingleChildScrollView(
//         child: Directionality(
//           textDirection: TextDirection.rtl,
//           child: Padding(
//             padding: EdgeInsets.all(context.h(1.2)),
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 children: [
//                   Row(
//                     children: [
//                       Icon(
//                         Icons.edit_note,
//                         color: AppColors.primaryColor,
//                         size: context.h(3.2),
//                       ),
//                       SizedBox(width: context.w(2)),
//                       Text(
//                         "ملخصي الشخصي",
//                         style: AppTextStyles.midDeepPrimaryColorStyle(context),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: context.h(2)),
//                   SummaryTextFormField(
//                     controller: titleController,
//                     hintText: "عنوان الملخص",
//                     maxLines: 1,
//                     validator: (value) {
//                       if (value == null || value.trim().isEmpty) {
//                         return "الرجاء إدخال عنوان التلخيص";
//                       }
//                       return null;
//                     },
//                     readOnly: false,
//                   ),
//                   SizedBox(height: context.h(2)),
//                   SummaryTextFormField(
//                     controller: noteController,
//                     hintText: "اكتب ملخصك أو ملاحظاتك هنا...",
//                     maxLines: context.h(5) ~/ context.h(0.5),
//                     validator: (value) {
//                       if (value == null || value.trim().isEmpty) {
//                         return "الرجاء إدخال التلخيص";
//                       }
//                       return null;
//                     },
//                     readOnly: false,
//                   ),
//                   SizedBox(height: context.h(2)),
//                   Container(
//                     width: double.infinity,
//                     padding: EdgeInsets.symmetric(
//                       horizontal: context.w(4),
//                       vertical: context.h(1.5),
//                     ),
//                     decoration: BoxDecoration(
//                       color: AppColors.primaryColor.withOpacity(.08),
//                       borderRadius: BorderRadius.circular(18),
//                     ),
//                     child: Row(
//                       children: [
//                         Icon(
//                           Icons.lightbulb_outline,
//                           color: AppColors.primaryColor,
//                         ),
//                         SizedBox(width: context.w(2)),
//                         Expanded(
//                           child: Text(
//                             "اكتب أهم الأفكار والنقاط التي تريد الرجوع إليها لاحقاً.",
//                             style: AppTextStyles.smallBlack54Style(context),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: context.h(3)),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       AuthButton(
//                         text: "حفظ",
//                         width: context.w(35),
//                         height: context.h(5),
//                         onPressed: saveSummary,
//                         textStyle: AppTextStyles.login3Style(
//                           context,
//                         ).copyWith(color: AppColors.offWhite),
//                       ),
//                       SizedBox(width: context.w(4)),
//                       SizedBox(
//                         width: context.w(35),
//                         height: context.h(5),
//                         child: ElevatedButton(
//                           onPressed: widget.onCancle,
//                           style: ElevatedButton.styleFrom(
//                             padding: EdgeInsets.zero,
//                             backgroundColor: AppColors.offWhite,
//                             shadowColor: AppColors.deepPrimaryColor,
//                             elevation: 2,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(24),
//                               side: BorderSide(
//                                 color: AppColors.primaryColor,
//                                 width: context.w(.4),
//                               ),
//                             ),
//                           ),
//                           child: Text(
//                             "إلغاء",
//                             style: AppTextStyles.login3Style(
//                               context,
//                             ).copyWith(color: AppColors.primaryColor),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

class CreateSummaryPage extends StatefulWidget {
  const CreateSummaryPage({
    super.key,
    required this.onCancle,
    required this.chapterId,
  });

  final VoidCallback onCancle;
  final int chapterId;

  @override
  State<CreateSummaryPage> createState() => _CreateSummaryViewState();
}

class _CreateSummaryViewState extends State<CreateSummaryPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController titleController = TextEditingController();

  final TextEditingController noteController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    noteController.dispose();
    super.dispose();
  }

  void saveSummary() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    context.read<CreateSummaryBloc>().add(
      AddSummaryEvent(
        chapterId: widget.chapterId,
        title: titleController.text.trim(),
        content: noteController.text.trim(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateSummaryBloc, CreateSummaryState>(
      listener: (context, state) {
        if (state is CreateSummarySuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.green,
              content: Text("تم حفظ الملخص", textDirection: TextDirection.rtl),
            ),
          );

          widget.onCancle();
        }

        if (state is CreateSummaryFailure) {
          AppAlertDialog.show(
            context: context,
            message: "لديك ملخص سابق لهذا الباب، لا يمكنك إضافة أكثر من ملخص.",
            onPressed: () {
              GoRouter.of(context).pop();
            },
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.offWhite,
          body: SingleChildScrollView(
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Padding(
                padding: EdgeInsets.all(context.h(1.2)),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.edit_note,
                            color: AppColors.primaryColor,
                            size: context.h(3.2),
                          ),
                          SizedBox(width: context.w(2)),
                          Text(
                            "ملخصي الشخصي",
                            style: AppTextStyles.midDeepPrimaryColorStyle(
                              context,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: context.h(2)),
                      SummaryTextFormField(
                        controller: titleController,
                        hintText: "عنوان الملخص",
                        maxLines: 1,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "الرجاء إدخال عنوان التلخيص";
                          }
                          return null;
                        },
                        readOnly: false,
                      ),
                      SizedBox(height: context.h(2)),
                      SummaryTextFormField(
                        controller: noteController,
                        hintText: "اكتب ملخصك أو ملاحظاتك هنا...",
                        maxLines: context.h(5) ~/ context.h(0.5),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "الرجاء إدخال التلخيص";
                          }
                          return null;
                        },
                        readOnly: false,
                      ),
                      SizedBox(height: context.h(2)),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          horizontal: context.w(4),
                          vertical: context.h(1.5),
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor.withOpacity(.08),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.lightbulb_outline,
                              color: AppColors.primaryColor,
                            ),
                            SizedBox(width: context.w(2)),
                            Expanded(
                              child: Text(
                                "اكتب أهم الأفكار والنقاط التي تريد الرجوع إليها لاحقاً.",
                                style: AppTextStyles.smallBlack54Style(context),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: context.h(3)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AuthButton(
                            text: state is CreateSummaryLoading
                                ? "جاري الحفظ..."
                                : "حفظ",
                            width: context.w(35),
                            height: context.h(5),
                            onPressed: state is CreateSummaryLoading
                                ? null
                                : saveSummary,
                            textStyle: AppTextStyles.login3Style(
                              context,
                            ).copyWith(color: AppColors.offWhite),
                          ),
                          SizedBox(width: context.w(4)),
                          CancleButton(
                            text: 'إلغاء',
                            onPressed: widget.onCancle,
                            height: context.h(5),
                            width: context.w(35),
                            textStyle: AppTextStyles.login3Style(
                              context,
                            ).copyWith(color: AppColors.primaryColor),
                          ),
                        ],
                      ),
                    ],
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
