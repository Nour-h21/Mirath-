import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mirath/core/utils/extensions/context_extensions.dart';

import '../../../../core/design/tokens/colors.dart';
import '../../../../core/design/tokens/typography.dart';
import '../../../../core/shared/page/In_background_page.dart';
import '../../../../core/shared/widgets/buttons/auth_button.dart';
import '../../../../core/shared/widgets/dialogs/app_alert_dialog.dart';
import '../../../my_summary_page/presentation/bloc/my_summary_page_bloc.dart';
import '../../../my_summary_page/presentation/bloc/my_summary_page_event.dart';
import '../../domain/entities/book_dropdown_entity.dart';
import '../../domain/entities/chapter_dropdown_entity.dart';
import '../../domain/entities/classification_dropdown_entity.dart';
import '../bloc/upload_summary_page_bloc.dart';
import '../bloc/upload_summary_page_event.dart';
import '../bloc/upload_summary_page_state.dart';
import '../widgets/dropdown_summary_widget.dart';

// class UploadSummaryPage extends StatefulWidget {
//   const UploadSummaryPage({super.key});

//   @override
//   State<UploadSummaryPage> createState() => _UploadSummaryPageState();
// }

// class _UploadSummaryPageState extends State<UploadSummaryPage> {
//   final formKey = GlobalKey<FormState>();

//   String? selectedCategory;

//   String? selectedBook;

//   String? selectedChapter;

//   PlatformFile? selectedFile;

//   final List<String> categories = ["العقيدة", "الفقه", "السيرة"];

//   final List<String> books = [
//     "كتاب التوحيد",
//     "الرحيق المختوم",
//     "الأصول الثلاثة",
//   ];

//   final List<String> chapters = ["الباب الأول", "الباب الثاني", "الباب الثالث"];

//   Future<void> pickPdf() async {
//     if (selectedFile != null) {
//       showDialog(
//         barrierColor: AppColors.black.withOpacity(0.12),
//         context: context,
//         builder: (_) {
//           return Directionality(
//             textDirection: TextDirection.rtl,
//             child: AlertDialog(
//               backgroundColor: AppColors.lightBaieg,
//               title: Row(
//                 children: [
//                   Text("⚠️", style: TextStyle(fontSize: context.h(2.8))),
//                   SizedBox(width: context.w(1.5)),
//                   Text(
//                     "تنبيه",
//                     style: AppTextStyles.bigDeepPrimaryColorStyle(context),
//                   ),
//                 ],
//               ),
//               content: Text(
//                 "يمكنك رفع ملخص واحد فقط.\nاحذف الملف الحالي أولاً.",
//                 style: AppTextStyles.smallBlack54Style(context),
//               ),
//               actions: [
//                 TextButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   child: Text(
//                     "إغلاق",
//                     style: AppTextStyles.midDeepPrimaryColorStyle(context)
//                         .copyWith(
//                           color: AppColors.primaryColor,
//                           fontSize: context.sp(3.8),
//                         ),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       );
//       return;
//     }
//     final result = await FilePicker.platform.pickFiles(
//       type: FileType.custom,
//       allowedExtensions: ['pdf', 'doc'],
//       allowMultiple: false,
//     );

//     if (result != null) {
//       setState(() {
//         selectedFile = result.files.first;
//       });
//     }
//   }
//   void uploadSummary() {
//     if (!formKey.currentState!.validate()) {
//       return;
//     }
//     if (selectedFile == null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           backgroundColor: Colors.redAccent,
//           content: Text(
//             "الرجاء اختيار ملف الملخص أولاً",
//             style: AppTextStyles.authbuttonStyle(context).copyWith(fontSize: context.sp(3.6)),
//           ),
//         ),
//       );

//       return;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Directionality(
//       textDirection: TextDirection.rtl,
//       child: InBackgroundPage(
//         labelAppBar: "رفع ملخص",
//         onBackPressed: () { GoRouter.of(context).pop(); },
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: context.w(4)),
//             child: Form(
//               key: formKey,
//               child: Column(
//                 children: [
//                   SizedBox(height: context.h(9)),
//                   DropdownSummaryWidget(
//                     title: "التصنيف",
//                     value: selectedCategory,
//                     items: categories,
//                     onChanged: (value) {
//                       setState(() {
//                         selectedCategory = value;
//                       });
//                     },
//                   ),

//                   SizedBox(height: context.h(2)),

//                   DropdownSummaryWidget(
//                     title: "الكتاب",
//                     value: selectedBook,
//                     items: books,
//                     onChanged: (value) {
//                       setState(() {
//                         selectedBook = value;
//                       });
//                     },
//                   ),

//                   SizedBox(height: context.h(2)),

//                   DropdownSummaryWidget(
//                     title: "الباب",
//                     value: selectedChapter,
//                     items: chapters,
//                     onChanged: (value) {
//                       setState(() {
//                         selectedChapter = value;
//                       });
//                     },
//                   ),
//                   SizedBox(height: context.h(4)),
//                   Container(
//                     width: double.infinity,
//                     padding: EdgeInsets.all(context.h(2)),
//                     decoration: BoxDecoration(
//                       color: AppColors.transparent,
//                       borderRadius: BorderRadius.circular(24),
//                       border: Border.all(color: AppColors.primaryColor),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black.withOpacity(.05),
//                           blurRadius: 15,
//                         ),
//                       ],
//                     ),

//                     child: Column(
//                       children: [
//                         Icon(
//                           Icons.picture_as_pdf_rounded,
//                           size: context.h(8),
//                           color: AppColors.primaryColor,
//                         ),
//                         SizedBox(height: context.h(1)),
//                         selectedFile == null
//                             ? Text(
//                                 "لم يتم اختيار ملف",
//                                 style: AppTextStyles.smallBlack54Style(context),
//                               )
//                             : Container(
//                                 padding: EdgeInsets.symmetric(
//                                   horizontal: context.w(3),
//                                   vertical: context.h(.8),
//                                 ),
//                                 decoration: BoxDecoration(
//                                   color: AppColors.baieg.withOpacity(.3),
//                                   borderRadius: BorderRadius.circular(20),
//                                 ),
//                                 child: Row(
//                                   mainAxisSize: MainAxisSize.min,
//                                   children: [
//                                     GestureDetector(
//                                       onTap: () {
//                                         setState(() {
//                                           selectedFile = null;
//                                         });
//                                       },
//                                       child: Container(
//                                         padding: const EdgeInsets.all(4),
//                                         decoration: const BoxDecoration(
//                                           color: Colors.red,
//                                           shape: BoxShape.circle,
//                                         ),
//                                         child: const Icon(
//                                           Icons.close,
//                                           size: 14,
//                                           color: Colors.white,
//                                         ),
//                                       ),
//                                     ),
//                                     SizedBox(width: context.w(1)),
//                                     Flexible(
//                                       child: Text(
//                                         selectedFile!.name,
//                                         overflow: TextOverflow.ellipsis,
//                                         style: AppTextStyles.smallBlack54Style(
//                                           context,
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                         SizedBox(height: context.h(2)),
//                         SizedBox(
//                           height: context.h(4.5),
//                           width: context.w(28),
//                           child: ElevatedButton(
//                             style: ElevatedButton.styleFrom(
//                               padding: EdgeInsets.zero,
//                               backgroundColor: AppColors.baieg.withOpacity(0.7),
//                               shadowColor: AppColors.baieg,
//                               elevation: 4,
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadiusGeometry.circular(20),
//                               ),
//                             ),

//                             onPressed: () {
//                               pickPdf();
//                             },
//                             child: Center(
//                               child: Text(
//                                 selectedFile == null
//                                     ? "اختيار ملف"
//                                     : "تم اختيار الملف",
//                                 style: AppTextStyles.midDeepPrimaryColorStyle(
//                                   context,
//                                 ).copyWith(fontSize: context.sp(3.5)),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: context.h(5)),
//                   AuthButton(
//                     text: "رفع الملخص",
//                     width: context.w(70),
//                     height: context.h(6),
//                     onPressed: () {
//                       uploadSummary();
//                     },
//                     textStyle: AppTextStyles.authbuttonStyle(context),
//                   ),

//                   SizedBox(height: context.h(3)),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

class UploadSummaryPage extends StatefulWidget {
  const UploadSummaryPage({super.key});

  @override
  State<UploadSummaryPage> createState() => _UploadSummaryPageState();
}

class _UploadSummaryPageState extends State<UploadSummaryPage> {
  ClassificationDropDownEntity? selectedClassification;

  BookDropDownEntity? selectedBook;

  ChapterDropDownEntity? selectedChapter;

  PlatformFile? selectedFile;

  @override
  void initState() {
    super.initState();

    context.read<UploadSummaryBloc>().add(GetClassificationsDropDownEvent());
  }

  Future<void> pickPdf() async {
    if (selectedFile != null) {
      AppAlertDialog.show(
        context: context,
        message: "يمكنك رفع ملخص واحد فقط.\nاحذف الملف الحالي أولاً.",
        onPressed: () {
          GoRouter.of(context).pop();
        },
      );
      return;
    }
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,

      allowedExtensions: ['pdf'],

      allowMultiple: false,
    );

    if (result != null) {
      setState(() {
        selectedFile = result.files.first;
      });
    }
  }

  void uploadSummary() {
    if (selectedChapter == null) {
      showMessage("اختر الباب أولاً");

      return;
    }

    if (selectedFile == null) {
      showMessage("اختر ملف PDF");

      return;
    }

    context.read<UploadSummaryBloc>().add(
      UploadedSummaryEvent(
        chapterId: selectedChapter!.id,

        filePath: selectedFile!.path!,
      ),
    );
  }

  void showMessage(String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.redAccent,
        content: Text(
          text,
          style: AppTextStyles.authbuttonStyle(
            context,
          ).copyWith(fontSize: context.sp(3.6)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UploadSummaryBloc, UploadSummaryState>(
      listener: (context, state) {
        if (state is UploadSummaryUploadSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.green,
              content: Text(state.message),
            ),
          );
          context.read<MySummaryBloc>().add(GetExternalSummariesEvent());

          GoRouter.of(context).pop();
        }

        if (state is UploadSummaryError) {
          if (state.message.contains("422")) {
            AppAlertDialog.show(
              context: context,
              message:
                  "لديك ملخص سابق لهذا الباب، لا يمكنك إضافة أكثر من ملخص.",
              onPressed: () {
                Navigator.pop(context);
                GoRouter.of(context).pop();
              },
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                content: Text(state.message),
              ),
            );
          }
        }
      },

      builder: (context, state) {
        List<ClassificationDropDownEntity> classifications = [];

        List<BookDropDownEntity> books = [];

        List<ChapterDropDownEntity> chapters = [];

        if (state is UploadSummaryLoaded) {
          classifications = state.classifications;

          books = state.books;

          chapters = state.chapters;
        }

        return Directionality(
          textDirection: TextDirection.rtl,

          child: InBackgroundPage(
            labelAppBar: "رفع ملخص",

            onBackPressed: () {
              GoRouter.of(context).pushReplacement('/MySummaryPage');
            },
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: context.w(4)),

              child: Column(
                children: [
                  SizedBox(height: context.h(8)),
                  DropdownSummaryWidget<ClassificationDropDownEntity>(
                    title: "التصنيف",
                    value: selectedClassification,
                    items: classifications,
                    itemText: (item) => item.name,
                    onChanged: (value) {
                      if (value == null) return;

                      setState(() {
                        selectedClassification = value;
                        selectedBook = null;
                        selectedChapter = null;
                      });

                      context.read<UploadSummaryBloc>().add(
                        GetBooksDropDownEvent(value.id),
                      );
                    },
                  ),

                  SizedBox(height: context.h(2)),

                  DropdownSummaryWidget<BookDropDownEntity>(
                    title: "الكتاب",
                    value: selectedBook,
                    items: books,
                    itemText: (item) => item.title,
                    onChanged: (value) {
                      if (value == null) return;

                      setState(() {
                        selectedBook = value;
                        selectedChapter = null;
                      });

                      context.read<UploadSummaryBloc>().add(
                        GetChaptersDropDownEvent(value.id),
                      );
                    },
                  ),

                  SizedBox(height: context.h(2)),

                  DropdownSummaryWidget<ChapterDropDownEntity>(
                    title: "الباب",
                    value: selectedChapter,
                    items: chapters,
                    itemText: (item) => item.title,
                    onChanged: (value) {
                      if (value == null) return;

                      setState(() {
                        selectedChapter = value;
                      });
                    },
                  ),

                  SizedBox(height: context.h(4)),
                  /////
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(context.h(2)),
                    decoration: BoxDecoration(
                      color: AppColors.transparent,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: AppColors.primaryColor),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(.05),
                          blurRadius: 15,
                        ),
                      ],
                    ),

                    child: Column(
                      children: [
                        Icon(
                          Icons.picture_as_pdf_rounded,
                          size: context.h(8),
                          color: AppColors.primaryColor,
                        ),
                        SizedBox(height: context.h(1)),
                        selectedFile == null
                            ? Text(
                                "لم يتم اختيار ملف",
                                style: AppTextStyles.smallBlack54Style(context),
                              )
                            : Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: context.w(3),
                                  vertical: context.h(.8),
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.baieg.withOpacity(.3),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectedFile = null;
                                        });
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(4),
                                        decoration: const BoxDecoration(
                                          color: Colors.red,
                                          shape: BoxShape.circle,
                                        ),
                                        child: const Icon(
                                          Icons.close,
                                          size: 14,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: context.w(1)),
                                    Flexible(
                                      child: Text(
                                        selectedFile!.name,
                                        overflow: TextOverflow.ellipsis,
                                        style: AppTextStyles.smallBlack54Style(
                                          context,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                        SizedBox(height: context.h(2)),
                        SizedBox(
                          height: context.h(4.5),
                          width: context.w(28),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.zero,
                              backgroundColor: AppColors.baieg.withOpacity(0.7),
                              shadowColor: AppColors.baieg,
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadiusGeometry.circular(20),
                              ),
                            ),

                            onPressed: () {
                              pickPdf();
                            },
                            child: Center(
                              child: Text(
                                selectedFile == null
                                    ? "اختيار ملف PDF"
                                    : "تم اختيار الملف",
                                style: AppTextStyles.midDeepPrimaryColorStyle(
                                  context,
                                ).copyWith(fontSize: context.sp(3.5)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  /////
                  // GestureDetector(
                  //   onTap: pickPdf,
                  //   child: Container(
                  //     height: 150,

                  //     width: double.infinity,

                  //     decoration: BoxDecoration(
                  //       border: Border.all(color: AppColors.primaryColor),

                  //       borderRadius: BorderRadius.circular(20),
                  //     ),

                  //     child: Column(
                  //       mainAxisAlignment: MainAxisAlignment.center,

                  //       children: [
                  //         Icon(Icons.picture_as_pdf, size: 60),

                  //         Text(
                  //           selectedFile == null
                  //               ? "اختيار ملف PDF"
                  //               : selectedFile!.name,
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  SizedBox(height: 40),

                  AuthButton(
                    text: "رفع الملخص",

                    width: context.w(70),

                    height: context.h(6),

                    onPressed: uploadSummary,
                    textStyle: AppTextStyles.authbuttonStyle(context),
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
