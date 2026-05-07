import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mirath/core/constants/strings.dart';
import 'package:mirath/core/design/tokens/typography.dart';
import 'package:mirath/core/utils/extensions/context_extensions.dart';
import 'package:mirath/core/utils/extensions/widget_extensions.dart';
import '../../../../core/constants/assets.dart';
import '../../../../core/design/tokens/colors.dart';
import '../../../../core/shared/page/auth_background.dart';
import '../../../../core/shared/widgets/buttons/auth_button.dart';
import '../../../../core/shared/widgets/inputs/text_field_input.dart';
import '../../../../core/utils/validator/auth_validator.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthBackground(
      image: AppAssets.splashScreen,
      top: 15,
      child: Column(
        children: [
          SizedBox(height: context.h(3.5)),
          CustomTextFormField(
            label: AppStrings.email,
            controller: email,
            icon: Icons.email,
            validator: AuthValidator.emailValidator,
          ),
          SizedBox(height: context.h(1)),
          CustomTextFormField(
            label: AppStrings.password,
            icon: Icons.remove_red_eye_rounded,
            isPassword: true,
            controller: password,
            validator: AuthValidator.passwordValidator,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {},
                child: Text(
                  AppStrings.forgotPassword,
                  style: AppTextStyles.login1Style(context),
                ),
              ),
            ],
          ),
          SizedBox(height: context.h(3)),
          AuthButton(
            text: AppStrings.login,
            height: context.h(5.5),
            width: context.w(53),
            onPressed: () {},
          ),

          SizedBox(height: context.h(3)),
          Row(
            children: [
              Expanded(
                child: Divider(
                  thickness: 0.35,
                  indent: context.w(15),
                  color: AppColors.offPink,
                ),
              ),

              Text(
                AppStrings.googleLogin,
                style: AppTextStyles.googleLoginStyle(context),
              ).paddingSymetricH(context, 2),
              Expanded(
                child: Divider(
                  thickness: 0.35,
                  endIndent: context.w(15),
                  color: AppColors.offPink,
                ),
              ),
            ],
          ),
          SizedBox(height: context.h(0.2)),
          GestureDetector(
            onTap: () {},
            child: SizedBox(
              width: context.w(90),
              height: context.h(5.4),
              child: Image.asset(AppAssets.googleLogo),
            ),
          ),
          // SizedBox(height: context.h(1)),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  GoRouter.of(context).go('/SignupPage');
                },
                child: Text(
                  AppStrings.nologin,
                  style: AppTextStyles.login2Style(context),
                ),
              ),
              Text(
                AppStrings.noAccount,
                style: AppTextStyles.login3Style(context),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
