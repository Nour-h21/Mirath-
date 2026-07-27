import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mirath/core/constants/strings.dart';
import 'package:mirath/core/design/tokens/typography.dart';
import 'package:mirath/core/utils/extensions/context_extensions.dart';
import 'package:mirath/core/utils/extensions/widget_extensions.dart';
import '../../../../core/constants/assets.dart';
import '../../../../core/design/tokens/colors.dart';
import '../../../../core/shared/page/background_page.dart';
import '../../../../core/shared/widgets/buttons/auth_button.dart';
import '../../../../core/utils/validator/auth_validator.dart';
import '../../../../core/shared/widgets/inputs/custom_text_form_field.dart';
import '../bloc/login_bloc.dart';
import '../bloc/login_event.dart';
import '../bloc/login_state.dart';

// class LoginPage extends StatelessWidget {
//   final TextEditingController email = TextEditingController();
//   final TextEditingController password = TextEditingController();
//   LoginPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return AuthBackground(
//       image: AppAssets.splashScreen,
//       top: 15,
//       child: Column(
//         children: [
//           SizedBox(height: context.h(3.5)),
//           CustomTextFormField(
//             label: AppStrings.email,
//             controller: email,
//             icon: Icons.email,
//             validator: AuthValidator.emailValidator,
//           ),
//           SizedBox(height: context.h(1)),
//           CustomTextFormField(
//             label: AppStrings.password,
//             icon: Icons.remove_red_eye_rounded,
//             isPassword: true,
//             controller: password,
//             validator: AuthValidator.passwordValidator,
//           ),

//           Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               TextButton(
//                 onPressed: () {},
//                 child: Text(
//                   AppStrings.forgotPassword,
//                   style: AppTextStyles.login1Style(context),
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(height: context.h(3)),
//           AuthButton(
//             text: AppStrings.login,
//             height: context.h(5.5),
//             width: context.w(53),
//             onPressed: () {},
//           ),

//           SizedBox(height: context.h(3)),
//           Row(
//             children: [
//               Expanded(
//                 child: Divider(
//                   thickness: 0.35,
//                   indent: context.w(15),
//                   color: AppColors.offPink,
//                 ),
//               ),

//               Text(
//                 AppStrings.googleLogin,
//                 style: AppTextStyles.googleLoginStyle(context),
//               ).paddingSymetricH(context, 2),
//               Expanded(
//                 child: Divider(
//                   thickness: 0.35,
//                   endIndent: context.w(15),
//                   color: AppColors.offPink,
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(height: context.h(0.2)),
//           GestureDetector(
//             onTap: () {},
//             child: SizedBox(
//               width: context.w(90),
//               height: context.h(5.4),
//               child: Image.asset(AppAssets.googleLogo),
//             ),
//           ),
//           // SizedBox(height: context.h(1)),

//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               TextButton(
//                 onPressed: () {
//                   GoRouter.of(context).go('/SignupPage');
//                 },
//                 child: Text(
//                   AppStrings.nologin,
//                   style: AppTextStyles.login2Style(context),
//                 ),
//               ),
//               Text(
//                 AppStrings.noAccount,
//                 style: AppTextStyles.login3Style(context),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController email = TextEditingController();

  final TextEditingController password = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    email.dispose();
    password.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          GoRouter.of(context).go('/NavicationBar');
        }

        if (state is LoginError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.redAccent,
              content: Text(
                state.message,
                textDirection: TextDirection.rtl,
                style: AppTextStyles.authbuttonStyle(
                  context,
                ).copyWith(fontSize: context.sp(3.55)),
              ),
            ),
          );
        }
      },

      builder: (context, state) {
        return BackgroundPage(
          image: AppAssets.splashScreen,
          top: context.h(1.5),
          wordImage: AppAssets.logo,

          child: Form(
            key: formKey,

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
                      onPressed: () {
                        GoRouter.of(context).go('/forgotPassword');
                      },

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

                  onPressed: state is LoginLoading
                      ? null
                      : () {
                          if (formKey.currentState!.validate()) {
                            context.read<LoginBloc>().add(
                              LoginSubmitted(
                                email: email.text.trim(),
                                password: password.text.trim(),
                              ),
                            );
                          }
                        },
                  textStyle: AppTextStyles.authbuttonStyle(context),
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
                  onTap: () {
                    context.read<LoginBloc>().add(GoogleLoginPressed());
                  },

                  child: SizedBox(
                    width: context.w(90),

                    height: context.h(5.4),

                    child: Image.asset(AppAssets.googleLogo),
                  ),
                ),

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
          ),
        );
      },
    );
  }
}
