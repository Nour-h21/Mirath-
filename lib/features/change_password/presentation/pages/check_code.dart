import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mirath/core/config/assets.dart';
import 'package:mirath/core/config/strings.dart';
import 'package:mirath/core/design/tokens/colors.dart';
import 'package:mirath/core/design/tokens/typography.dart';
import 'package:mirath/core/utils/extensions/context_extensions.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../core/shared/widgets/buttons/auth_button.dart';
import '../bloc/change_password_bloc.dart';
import '../bloc/change_password_event.dart';
import '../bloc/change_password_state.dart';

class CheckCode extends StatefulWidget {
  final String email;
  CheckCode({super.key, required this.email});

  @override
  State<CheckCode> createState() => _CheckCodeState();
}

class _CheckCodeState extends State<CheckCode> {
  final TextEditingController codeController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  int seconds = 0;

  Timer? timer;

  void startTimer() {
    seconds = 60;

    timer?.cancel();
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (seconds == 0) {
        t.cancel();
      } else {
        setState(() {
          seconds--;
        });
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

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
            } else if (state is CheckCodeSuccess) {
              print('oolll');
              context.push('/resetPassword');
            } else if (state is ResendCodeSuccess) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text("تم إعادة إرسال الرمز")));
              startTimer();
            }
          },
          child: Stack(
            children: [
              Image.asset(
                AppAssets.background,
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
                          AppStrings.verificationCode,
                          style: AppTextStyles.displayLarge(context),
                        ),

                        SizedBox(height: context.h(2)),

                        SizedBox(
                          width: context.w(90),
                          child: Text(
                            AppStrings.enterCode,
                            style: AppTextStyles.hintSmall(context),
                            textAlign: TextAlign.center,
                          ),
                        ),

                        SizedBox(height: context.h(4.5)),

                        SizedBox(
                          width: context.w(83),
                          child: PinCodeTextField(
                            appContext: context,
                            length: 6,
                            controller: codeController,
                            keyboardType: TextInputType.number,

                            textStyle: AppTextStyles.hintSmall(context)
                                .copyWith(
                                  fontSize: context.sp(4.7),
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),

                            cursorColor: AppColors.primaryColor,
                            animationType: AnimationType.scale,
                            animationDuration: const Duration(
                              milliseconds: 180,
                            ),

                            pinTheme: PinTheme(
                              shape: PinCodeFieldShape.box,
                              borderRadius: BorderRadius.circular(12),

                              fieldHeight: context.w(13),
                              fieldWidth: context.w(12),

                              activeColor: AppColors.primaryColor,
                              selectedColor: AppColors.primaryColor,
                              inactiveColor: AppColors.primaryColor,

                              borderWidth: 2,

                              activeFillColor: AppColors.primaryColor
                                  .withOpacity(0.2),
                              selectedFillColor: AppColors.transparent,
                              inactiveFillColor: AppColors.transparent,
                            ),

                            enableActiveFill: true,

                            onChanged: (value) {},
                          ),
                        ),
                        SizedBox(height: context.h(8)),

                        AuthButton(
                          text: AppStrings.verification,
                          width: context.w(45),
                          height: context.h(5.3),
                          onPressed: () {
                            final otpCode = codeController.text.trim();
                            if (otpCode.length == 6) {
                              context.read<ChangePasswordBloc>().add(
                                CheckCodeEvent(code: otpCode),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    AppStrings.noteVerificationCode,
                                  ),
                                ),
                              );
                            }
                          },
                        ),

                        SizedBox(height: context.h(2)),
                        GestureDetector(
                          onTap: seconds == 0
                              ? () {
                                  context.read<ChangePasswordBloc>().add(
                                    ResendCodeEvent(email: widget.email),
                                  );
                                }
                              : null, // ❌ تعطيل أثناء العد

                          child: RichText(
                            text: TextSpan(
                              // children: [
                              // TextSpan(
                              //   text: "لم يصلك الرمز؟ ",
                              //   style: AppTextStyles.hintSmall(context),
                              // ),

                              // TextSpan(
                              text: seconds == 0
                                  ? "إعادة إرسال الرمز"
                                  : "إعادة إرسال الرمز خلال ($seconds) ثانية",
                              style: AppTextStyles.hintSmall(context).copyWith(
                                color: seconds == 0
                                    ? AppColors.primaryColor
                                    : Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                              // ),
                              // ],
                            ),
                          ),
                        ),
                        // TextButton(
                        //   onPressed: () {
                        //     context.read<ChangePasswordBloc>().add(
                        //       ResendCodeEvent(email: email),
                        //     );
                        //   },
                        //   child: Text(
                        //     "إعادة إرسال الرمز",
                        //     style: AppTextStyles.hintSmall(context).copyWith(
                        //       color: AppColors.primaryColor,
                        //       // decoration: TextDecoration.underline,
                        //     ),
                        //   ),
                        // ),
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
