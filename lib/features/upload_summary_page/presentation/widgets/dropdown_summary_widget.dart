import 'package:flutter/material.dart';
import 'package:mirath/core/utils/extensions/context_extensions.dart';

import '../../../../core/design/tokens/colors.dart';
import '../../../../core/design/tokens/typography.dart';

// class DropdownSummaryWidget extends StatelessWidget {
//   final String title;
//   final String? value;
//   final List<String> items;
//   final Function(String?) onChanged;
//   final FormFieldValidator<String>? validator;

//   const DropdownSummaryWidget({
//     super.key,
//     required this.title,
//     this.value,
//     required this.items,
//     required this.onChanged,
//     this.validator,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(title, style: AppTextStyles.midDeepPrimaryColorStyle(context)),
//         SizedBox(height: context.h(.8)),
//         SizedBox(
//           height: context.h(7),
//           child: DropdownButtonFormField<String>(
//             value: value,
//             autovalidateMode: AutovalidateMode.onUserInteraction,
//             isExpanded: true,
//             dropdownColor: AppColors.offWhite,
//             borderRadius: BorderRadius.circular(34),
//             iconEnabledColor: AppColors.primaryColor,
//             decoration: InputDecoration(
//               labelText: "اختر $title",
//               labelStyle: AppTextStyles.smallBlack54Style(context),
//               enabledBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(20),
//                 borderSide: BorderSide(
//                   color: AppColors.primaryColor,
//                   width: context.w(0.3),
//                 ),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(20),
//                 borderSide: BorderSide(
//                   color: AppColors.primaryColor,
//                   width: context.w(0.35),
//                 ),
//               ),
//               errorBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(20),
//                 borderSide: const BorderSide(color: Colors.red),
//               ),
//               errorStyle: AppTextStyles.errorStyle(context),
//             ),
//             items: items.map((item) {
//               return DropdownMenuItem(
//                 value: item,
//                 alignment: Alignment.bottomRight,
//                 child: Text(item),
//               );
//             }).toList(),
//             onChanged: onChanged,
//             validator:
//                 validator ??
//                 (value) {
//                   if (value == null || value.trim().isEmpty) {
//                     return 'الرجاء إدخال $title';
//                   }
//                   return null;
//                 },
//           ),
//         ),
//       ],
//     );
//   }
// }


class DropdownSummaryWidget<T> extends StatelessWidget {
  final String title;
  final T? value;
  final List<T> items;
  final ValueChanged<T?> onChanged;
  final String Function(T) itemText;
  final FormFieldValidator<T>? validator;

  const DropdownSummaryWidget({
    super.key,
    required this.title,
    this.value,
    required this.items,
    required this.onChanged,
    required this.itemText,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.midDeepPrimaryColorStyle(context),
        ),
        SizedBox(height: context.h(.8)),
        SizedBox(
          height: context.h(7),
          child: DropdownButtonFormField<T>(
            value: value,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            isExpanded: true,
            dropdownColor: AppColors.offWhite,
            borderRadius: BorderRadius.circular(34),
            iconEnabledColor: AppColors.primaryColor,
            decoration: InputDecoration(
              labelText: "اختر $title",
              labelStyle: AppTextStyles.smallBlack54Style(context),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                  color: AppColors.primaryColor,
                  width: context.w(0.3),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                  color: AppColors.primaryColor,
                  width: context.w(0.35),
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: Colors.red),
              ),
              errorStyle: AppTextStyles.errorStyle(context),
            ),
            items: items.map((item) {
              return DropdownMenuItem<T>(
                value: item,
                alignment: Alignment.bottomRight,
                child: Text(itemText(item)),
              );
            }).toList(),
            onChanged: onChanged,
            validator:
                validator ??
                (value) {
                  if (value == null) {
                    return "الرجاء اختيار $title";
                  }
                  return null;
                },
          ),
        ),
      ],
    );
  }
}