import 'package:flutter/material.dart';
import 'package:mirath/core/utils/extensions/context_extensions.dart';

import '../../../../core/design/tokens/colors.dart';
import '../../../../core/design/tokens/typography.dart';

class SummaryTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final int maxLines;
  final Key? intkey;
  final bool readOnly;
  final FormFieldValidator<String>? validator;
  final Color? borderColor;

  const SummaryTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.maxLines,
    required this.readOnly,
    this.validator,
     this.intkey,
     this.borderColor,
  });

  @override
  State<SummaryTextFormField> createState() => _SummaryTextFormFieldState();
}

class _SummaryTextFormFieldState extends State<SummaryTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key:widget.intkey,
      controller: widget.controller,
      cursorColor: AppColors.primaryColor,
      style: AppTextStyles.login3Style(context),
      maxLines: widget.maxLines,
      readOnly: widget.readOnly,

      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: AppTextStyles.smallBlack54Style(
          context,
        ).copyWith(fontSize: context.sp(3.5)),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color:widget.borderColor?? AppColors.lightBlack,
            width: context.w(0.2),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(
            color:widget.borderColor?? AppColors.lightBlack,
            width: context.w(0.3),
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Colors.red),
        ),
      ),

      validator: widget.validator,
    );
  }
}
