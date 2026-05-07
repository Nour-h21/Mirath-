import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mirath/core/utils/extensions/context_extensions.dart';
import 'package:mirath/core/utils/extensions/widget_extensions.dart';
import '../../../../core/constants/assets.dart';
import '../../../../core/constants/strings.dart';
import '../../../../core/design/tokens/typography.dart';
import '../../../../core/shared/page/auth_background.dart';
import '../../../../core/shared/widgets/buttons/auth_button.dart';
import '../../../../core/utils/validator/auth_validator.dart';
import '../../../../core/shared/widgets/inputs/custom_text_form_field.dart';
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

  final TextEditingController nationality = TextEditingController();

  List<Map<String, String>> types = [];

  @override
  void initState() {
    super.initState();
    types = [
      {"id": "1", "name": "Registration Request"},
      {"id": "2", "name": "Invoice Error"},
      {"id": "3", "name": "Technical Malfunction"},
    ];
  }

  @override
  Widget build(BuildContext context) {
    return AuthBackground(
      image: AppAssets.authbackgroun,
      top: 13,
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
            validator: AuthValidator.nameValidator,
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
            validator: (value) =>
                AuthValidator.confirmPasswordValidator(value, password.text),
          ),
          Row(
            children: [
              Expanded(
                child: DropdownButtonField(
                  label: "الجنسية",
                  options: types.map((e) => e['name']!).toList(),
                  onChanged: (String? value) {
                    // find id by name
                    // final found = types.firstWhere(
                    //   (t) => t['name'] == value,
                    // );
                    // context
                    //     .read<AddComplaintBloc>()
                    //     .add(
                    //       AddComplaintTypeSelected(
                    //         found['id']!,
                    //       ),
                    //     );
                  },
                  validator: (v) => v == null ? "please choose the type" : null,
                ),
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
            onPressed: () {},
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
    );
  }
}
