import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mirath/core/utils/extensions/context_extensions.dart';

import '../../../../core/constants/assets.dart';
import '../../../../core/constants/strings.dart';
import '../../../../core/design/tokens/typography.dart';
import '../../../../core/shared/widgets/buttons/auth_button.dart';
import '../../../../core/shared/widgets/inputs/custom_text_form_field.dart';
import '../../../../core/utils/validator/auth_validator.dart';
import '../bloc/change_password_bloc.dart';
import '../bloc/change_password_event.dart';
import '../bloc/change_password_state.dart';

class ResetPassword extends StatelessWidget {
  ResetPassword({super.key});

  final TextEditingController password = TextEditingController();
  final TextEditingController comfirmPassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocListener<ChangePasswordBloc, ChangePasswordState>(
          listener: (context, state) {
            if (state is ChangePasswordLoading) {
              // show loading
            } else if (state is ChangePasswordFailed) {
              // show error
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
              print('llooo${state.message}');
            } else if (state is ResetPasswordSuccess) {
              context.push('/logIn');
            }
          },
          child: Stack(
            children: [
              Image.asset(
                AppAssets.splashScreen,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),

              Directionality(
                textDirection: TextDirection.ltr,
                child: Form(
                  key: _formKey,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppStrings.enterNewPassword,
                          style: AppTextStyles.displayLarge(context),
                        ),

                        SizedBox(height: context.h(2)),

                        SizedBox(
                          width: context.w(90),
                          child: Text(
                            AppStrings.enterNewPasswordhint,
                            style: AppTextStyles.hintSmall(context),
                            textAlign: TextAlign.center,
                          ),
                        ),

                        SizedBox(height: context.h(4.5)),

                        CustomTextFormField(
                          label: AppStrings.password,
                          icon: Icons.password,
                          isPassword: true,
                          controller: password,
                          validator: AuthValidator.passwordValidator,
                        ),

                        SizedBox(height: context.h(0.5)),

                        CustomTextFormField(
                          label: AppStrings.comfirmPassword,
                          icon: Icons.password,
                          isPassword: true,
                          controller: comfirmPassword,
                          validator: (value) =>
                              AuthValidator.confirmPasswordValidator(
                                value,
                                password.text,
                              ),
                        ),
                        SizedBox(height: context.h(7)),

                        AuthButton(
                          text: AppStrings.resetPassword,
                          width: context.w(55),
                          height: context.h(5.3),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              context.read<ChangePasswordBloc>().add(
                                ResetPasswordEvent(
                                  password: password.text.trim(),
                                  confirmPassword: comfirmPassword.text.trim(),
                                ),
                              );
                            }
                          },
                        ),
                        // GradientElevatedButton1(
                        //   onPressed: () {
                        //     if (_formKey.currentState!.validate()) {
                        //       context.read<ChangePasswordBloc>().add(
                        //         ResetPasswordEvent(
                        //           password: password.text.trim(),
                        //           confirmPassword: comfirmPassword.text.trim(),
                        //         ),
                        //       );
                        //     }
                        //   },
                        //   text: AppTexts.resetPassword,
                        // ),
                        // SizedBox(height: SizeConfig.h(5)),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
