import 'package:flutter/material.dart';
import 'package:mirath/core/constants/assets.dart';
import 'package:mirath/core/design/tokens/colors.dart';
import 'package:mirath/core/design/tokens/typography.dart';
import 'package:mirath/core/utils/extensions/context_extensions.dart';

class DropdownButtonField extends StatelessWidget {
  final String label;
  final List<String> options;
  final ValueChanged<String?> onChanged;
  final FormFieldValidator<String>? validator;
  final String? errorText;

  const DropdownButtonField({
    super.key,
    required this.label,
    required this.options,
    required this.onChanged,
    this.errorText,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SizedBox(
        height: context.h(6),
        child: DropdownButtonFormField<String>(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          isExpanded: true,
          dropdownColor: AppColors.offWhite,
          borderRadius: BorderRadius.circular(14),
          iconEnabledColor: AppColors.primaryColor,
          decoration: InputDecoration(
            labelText: label,
            labelStyle: AppTextStyles.labelStyle(context),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide(
                color: AppColors.primaryColor,
                width: context.w(0.4),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide(
                color: AppColors.primaryColor,
                width: context.w(0.49),
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(color: Colors.red),
            ),
            errorStyle: AppTextStyles.errorStyle(context),
          ),
          items: options
              .map(
                (e) => DropdownMenuItem(
                  value: e,
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Row(
                      children: [
                        Image.asset(AppAssets.googleLogo,height: context.h(2.6),),
                         SizedBox(width: context.w(1.5)),
                        Text(e, style: AppTextStyles.login3Style(context)),
                      ],
                    ),
                  ),
                ),
              )
              .toList(),
          onChanged: onChanged,
          validator:
              validator ??
              (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'الرجاء إدخال $label';
                }
                return null;
              },
        ),
      ),
    );
  }
}
