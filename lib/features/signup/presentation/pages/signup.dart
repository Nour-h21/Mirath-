import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mirath/core/core.dart';
import 'package:mirath/core/utils/extensions/context_extensions.dart';
import 'package:mirath/core/utils/extensions/widget_extensions.dart';

import '../../../../app/di/cart_module.dart';
import '../../../../core/constants/assets.dart';
import '../../../../core/constants/strings.dart';
import '../../../../core/design/tokens/typography.dart';
import '../../../../core/shared/page/auth_background.dart';
import '../../../../core/shared/widgets/buttons/auth_button.dart';
import '../../../../core/utils/validator/auth_validator.dart';
import '../../../../core/shared/widgets/inputs/custom_text_form_field.dart';
import '../../../notifications/presentation/bloc/notifications_bloc.dart';
import '../../../notifications/presentation/bloc/notifications_event.dart';
import '../bloc/Nationality/nationality_bloc.dart';
import '../bloc/Nationality/nationality_state.dart';
import '../bloc/signup/signup_bloc.dart';
import '../bloc/signup/signup_event.dart';
import '../bloc/signup/signup_state.dart';
import '../widgets/dropdown_button.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController firstName = TextEditingController();

  final TextEditingController secondName = TextEditingController();

  final TextEditingController email = TextEditingController();

  final TextEditingController password = TextEditingController();

  final TextEditingController confirmPassword = TextEditingController();

  final TextEditingController age = TextEditingController();

  int? selectedNationalityId;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupBloc, SignupState>(
      listener: (context, state) {
        if (state is SignupLoading) {
        } else if (state is SignupFailed) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
          print(state.message);
        } else if (state is SignupSuccess) {
          getIt<NotificationsBloc>().add(
    RegisterCurrentDeviceEvent(),
  );
          // GoRouter.of(context).go('/home');
         context.go("/NotificationsPage");
        }
      },
      child: AuthBackground(
        image: AppAssets.authbackgroun,
        top: 13,
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextFormField(
                label: AppStrings.firstName,
                controller: firstName,
                icon: Icons.person,
                validator: AuthValidator.nameValidator,
              ),
              CustomTextFormField(
                label: AppStrings.secondName,
                controller: secondName,
                icon: Icons.person,
                validator: AuthValidator.nickNameValidator,
              ),
              CustomTextFormField(
                label: AppStrings.email,
                controller: email,
                icon: Icons.email,
                validator: AuthValidator.emailValidator,
              ),
              CustomTextFormField(
                label: AppStrings.password,
                icon: Icons.remove_red_eye_rounded,
                isPassword: true,
                controller: password,
                validator: AuthValidator.passwordValidator,
              ),
              CustomTextFormField(
                label: AppStrings.confirmPassword,
                icon: Icons.remove_red_eye_rounded,
                isPassword: true,
                controller: confirmPassword,
                validator: (value) => AuthValidator.confirmPasswordValidator(
                  value,
                  password.text,
                ),
              ),
              Row(
                children: [
                  BlocBuilder<NationalityBloc, NationalityState>(
                    builder: (context, state) {
                      if (state is NationalityLoading) {
                        return const Expanded(
                          child: Center(child: CircularProgressIndicator()),
                        );
                      }

                      if (state is NationalitySuccess) {
                        return Expanded(
                          child: DropdownButtonField(
                            label: AppStrings.nationality,

                            options: state.nationalities
                                .map((e) => e.nationality)
                                .toList(),

                            onChanged: (String? value) {
                              final selectedNationality = state.nationalities
                                  .firstWhere((e) => e.nationality == value);

                              selectedNationalityId = selectedNationality.id;

                              print(selectedNationalityId);
                            },

                            validator: AuthValidator.nationalityValidator,
                          ),
                        );
                      }

                      if (state is NationalityFailed) {
                        return Expanded(child: Text(state.message));
                      }

                      return const SizedBox();
                    },
                  ),
                  SizedBox(width: context.w(1.5)),
                  Expanded(
                    child: CustomTextFormField(
                      label: AppStrings.age,
                      controller: age,
                      validator: AuthValidator.ageValidator,
                      keyboardType: TextInputType.number,
                    ).paddingOnlytop(context, 2),
                  ),
                ],
              ).paddingSymetricH(context, 4.3),

              SizedBox(height: context.h(2.5)),
              AuthButton(
                text: AppStrings.signUp,
                height: context.h(5.5),
                width: context.w(53),

                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    if (selectedNationalityId == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("الرجاء اختيار الجنسية")),
                      );
                      return;
                    }

                    final int? parsedAge = int.tryParse(age.text);

                    if (parsedAge == null) {
                      // ScaffoldMessenger.of(context).showSnackBar(
                      //   const SnackBar(content: Text("الرجاء ادخال العمر")),
                      // );
                      return;
                    }

                    context.read<SignupBloc>().add(
                      SubmitSignupEvent(
                        name: firstName.text,
                        nickName: secondName.text,
                        email: email.text,
                        age: parsedAge,
                        nationalityId: selectedNationalityId!,
                        password: password.text,
                        confirmPassword: confirmPassword.text,
                      ),
                    );
                  }
                },
              ),

              SizedBox(height: context.h(1)),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  TextButton(
                    onPressed: () {
                      GoRouter.of(context).go('/LoginPage');
                    },
                    child: Text(
                      AppStrings.noSignUp,
                      style: AppTextStyles.login2Style(context),
                    ),
                  ),
                  Text(
                    AppStrings.haveAccount,
                    style: AppTextStyles.login3Style(context),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
