import 'package:flutter/material.dart';
import 'package:mirath/core/design/tokens/colors.dart';
import 'package:mirath/core/utils/extensions/context_extensions.dart';

import '../../../design/tokens/typography.dart';

// class CustomTextFormField extends StatefulWidget {
//   final TextEditingController controller;
//   final String label;
//   final bool isPassword;
//   final TextInputType keyboardType;
//   final FormFieldValidator<String>? validator;
//   final ValueChanged<String>? onChanged;
//   final String? initialValue;
//   final IconData? icon;

//   const CustomTextFormField({
//     super.key,
//     this.icon,
//     required this.controller,
//     required this.label,
//     this.keyboardType = TextInputType.text,
//     this.isPassword = false,
//     this.validator,
//     this.onChanged,
//     this.initialValue,
//   });

//   @override
//   State<CustomTextFormField> createState() => _CustomTextFormFieldState();
// }

// class _CustomTextFormFieldState extends State<CustomTextFormField> {
//   late bool _obscureText;

//   @override
//   void initState() {
//     super.initState();
//     _obscureText = widget.isPassword;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: context.w(90),
//       // height: context.h(6),
//       child: Directionality(
//         textDirection: TextDirection.rtl,
//         child: TextFormField(
//           initialValue: widget.initialValue,
//           cursorColor: AppColors.primaryColor,
//           controller: widget.controller,
//           autovalidateMode: AutovalidateMode.onUserInteraction,
//           obscureText: widget.isPassword ? _obscureText : false,

//           decoration: InputDecoration(
//             labelText: widget.label,
//             labelStyle: AppTextStyles.labelStyle(context),
//             // helperText: " ",
//             // errorMaxLines: 2,
//             suffixIcon: widget.isPassword
//                 ? IconButton(
//                     icon: Icon(
//                       _obscureText ? Icons.visibility_off : Icons.visibility,
//                       color: AppColors.primaryColor,
//                       size: context.w(5.5),
//                     ),
//                     onPressed: () {
//                       setState(() {
//                         _obscureText = !_obscureText;
//                       });
//                     },
//                   )
//                 : widget.icon != null
//                 ? Icon(
//                     widget.icon,
//                     color: AppColors.primaryColor,
//                     size: context.w(5.5),
//                   )
//                 : const SizedBox(),

//             enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(14),
//               borderSide: BorderSide(
//                 color: AppColors.primaryColor,
//                 width: context.w(0.4),
//               ),
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(14),
//               borderSide: BorderSide(
//                 color: AppColors.primaryColor,
//                 width: context.w(0.49),
//               ),
//             ),
//             errorBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10),
//               borderSide: const BorderSide(color: Colors.red, width: 1),
//             ),
//             focusedErrorBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10),
//               borderSide: const BorderSide(color: Colors.red, width: 1),
//             ),
//             errorStyle: AppTextStyles.errorStyle(context),
//           ),
//           keyboardType: widget.keyboardType,
//           onChanged: widget.onChanged,
//           validator: widget.validator,
//         ),
//       ),
//     );
//   }
// }


class CustomTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final bool isPassword;
  final TextInputType keyboardType;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final String? initialValue;
  final IconData? icon;

  const CustomTextFormField({
    super.key,
    this.icon,
    required this.controller,
    required this.label,
    this.keyboardType = TextInputType.text,
    this.isPassword = false,
    this.validator,
    this.onChanged,
    this.initialValue,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool _obscureText;
  String? errorText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SizedBox(
        width: context.w(90),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: context.h(6),
              child: TextFormField(
                controller: widget.controller,
                initialValue: widget.initialValue,
                cursorColor: AppColors.primaryColor,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                obscureText: widget.isPassword ? _obscureText : false,

                decoration: InputDecoration(
                  labelText: widget.label,
                  labelStyle: AppTextStyles.labelStyle(context),

                  errorText: null,

                  suffixIcon: widget.isPassword
                      ? IconButton(
                          icon: Icon(
                            _obscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: AppColors.primaryColor,
                            size: context.w(5.5),
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                        )
                      : widget.icon != null
                      ? Icon(
                          widget.icon,
                          color: AppColors.primaryColor,
                          size: context.w(5.5),
                        )
                      : const SizedBox(),

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
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: const BorderSide(color: Colors.red),
                  ),
                ),

                keyboardType: widget.keyboardType,
                onChanged: widget.onChanged,

                validator: (value) {
                  final error = widget.validator?.call(value);WidgetsBinding.instance.addPostFrameCallback((_) {
                    setState(() {
                      errorText = error;
                    });
                  });

                  return null;
                },
              ),
            ),

            SizedBox(
              height: context.h(2),
              child: errorText != null
                  ? Text(errorText!, style: AppTextStyles.errorStyle(context))
                  : const SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}