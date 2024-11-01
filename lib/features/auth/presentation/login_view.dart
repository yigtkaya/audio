import 'package:audio/core/constants/app_colors.dart';
import 'package:audio/core/constants/app_design_constant.dart';
import 'package:audio/core/extensions/build_context_extension.dart';
import 'package:audio/core/router/app_router.gr.dart';
import 'package:audio/features/auth/presentation/widgets/footer_text.dart';
import 'package:audio/features/auth/presentation/widgets/header_text.dart';
import 'package:audio/localization/l10.dart';
import 'package:audio/shared/widgets/buttons/custom_elevated_button.dart';
import 'package:audio/shared/widgets/text_fields/custom_text_field.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:audio/core/constants/asset_constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

part './widgets/forgot_password_button.dart';

@RoutePage()
class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AssetConstants.images.authBackground),
            fit: BoxFit.fill,
            colorFilter: ColorFilter.mode(
              Colors.green.shade900.withOpacity(0.85),
              BlendMode.multiply,
            ),
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: AppDesignConstants.horizontalPaddingLarge),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 40.h),
                const HeaderText(),
                const SizedBox(height: 220), // Remove Spacer for better scrolling
                CustomTextField(
                  hintText: context.l10n.email,
                  prefixIcon: const Icon(
                    Icons.email_outlined,
                    color: AppColors.kGreyDark,
                  ),
                ),
                SizedBox(height: AppDesignConstants.spacingMedium),
                CustomTextField(
                  hintText: context.l10n.password,
                  prefixIcon: const Icon(
                    Icons.lock_outline,
                    color: AppColors.kGreyDark,
                  ),
                ),
                const SizedBox(height: 12),
                const _ForgotPasswordButton(),
                SizedBox(height: AppDesignConstants.spacingMedium),
                // Sign In Button
                CustomRoundedButton(
                  width: double.infinity,
                  height: 50.h,
                  bgColor: AppColors.kPrimary,
                  text: context.l10n.logIn,
                  textStyle: context.textTheme.bodyMedium!.copyWith(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  onTap: () {},
                ),
                const SizedBox(height: 24),
                FooterText(
                  text: context.l10n.dontHaveAnAccount,
                  buttonText: context.l10n.signUp,
                  onPressed: () => context.router.push(const SignUpRoute()),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
