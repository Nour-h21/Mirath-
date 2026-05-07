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

class ForgotPassword extends StatelessWidget {
  ForgotPassword({super.key});

  final TextEditingController email = TextEditingController();
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
              print('oooooooooo${state.message}');
            } else if (state is ForgotPasswordSuccess) {
              context.push('/checkCode', extra: email.text);
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
                          AppStrings.enterEmail,
                          style: AppTextStyles.displayLarge(context),
                        ),

                        SizedBox(height: context.h(2)),

                        SizedBox(
                          width: context.w(90),
                          child: Text(
                            AppStrings.enterEmailhint,
                            style: AppTextStyles.hintSmall(context),
                            textAlign: TextAlign.center,
                          ),
                        ),

                        SizedBox(height: context.h(4.5)),

                        CustomTextFormField(
                          label: AppStrings.email,
                          icon: Icons.email,
                          controller: email,
                          validator: AuthValidator.emailValidator,
                        ),

                        SizedBox(height: context.h(7)),
                        AuthButton(
                          text: AppStrings.confirmation,
                          width: context.w(45),
                          height: context.h(5.3),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              context.read<ChangePasswordBloc>().add(
                                ForgotPasswordEvent(email: email.text),
                              );
                            }
                          },
                        ),
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
