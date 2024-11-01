import 'package:audio/core/constants/app_colors.dart';
import 'package:audio/core/constants/app_design_constant.dart';
import 'package:audio/core/constants/asset_constants.dart';
import 'package:audio/core/extensions/build_context_extension.dart';
import 'package:audio/features/auth/presentation/mixins/sign_up_view_mixin.dart';
import 'package:audio/features/auth/presentation/widgets/footer_text.dart';
import 'package:audio/features/auth/presentation/widgets/header_text.dart';
import 'package:audio/features/auth/presentation/widgets/social_login_button.dart';
import 'package:audio/localization/l10.dart';
import 'package:audio/shared/widgets/buttons/custom_elevated_button.dart';
import 'package:audio/shared/widgets/text_fields/custom_email_text_form_field.dart';
import 'package:audio/shared/widgets/text_fields/custom_password_text_form_field.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> with SignUpViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AssetConstants.images.authBackground),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.green.shade900.withOpacity(0.85),
              BlendMode.multiply,
            ),
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 40.h),
                // Header text
                const HeaderText(),
                // Email TextField
                SizedBox(height: 220.h),

                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      CustomEmailTextFormField(
                        controller: emailController,
                      ),
                      SizedBox(
                        height: AppDesignConstants.spacingMedium,
                      ),
                      CustomPasswordTextFormField(
                        controller: passwordController,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: AppDesignConstants.spacingLarge),
                CustomRoundedButton(
                  width: double.infinity,
                  height: 50.h,
                  bgColor: AppColors.kPrimary,
                  text: context.l10n.signUp,
                  textStyle: context.textTheme.bodyMedium!.copyWith(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  onTap: onSignUpPressed,
                ),
                SizedBox(height: AppDesignConstants.spacingLarge),
                // Social Login Options
                SocialLoginButton(
                  onPressed: () {},
                  icon: AssetConstants.icons.google,
                ),
                SizedBox(height: AppDesignConstants.spacingLarge),
                // Sign In Link
                FooterText(
                  text: context.l10n.aldreadyHaveAnAccount,
                  buttonText: context.l10n.logIn,
                  onPressed: () {
                    context.router.back();
                  },
                ),
                SizedBox(height: 40.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
