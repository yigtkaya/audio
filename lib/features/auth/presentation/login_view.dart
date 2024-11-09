import 'dart:async';

import 'package:audio/core/constants/app_colors.dart';
import 'package:audio/core/constants/app_design_constant.dart';
import 'package:audio/core/extensions/build_context_extension.dart';
import 'package:audio/core/router/app_router.gr.dart';
import 'package:audio/features/auth/bloc/auth_bloc.dart';
import 'package:audio/core/widgets/loading/custom_loading_dialog.dart';
import 'package:audio/core/widgets/text_fields/custom_email_text_form_field.dart';
import 'package:audio/core/widgets/text_fields/custom_password_text_form_field.dart';
import 'package:audio/core/widgets/toast/custom_toast.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:audio/features/auth/presentation/widgets/footer_text.dart';
import 'package:audio/features/auth/presentation/widgets/header_text.dart';
import 'package:audio/localization/l10.dart';
import 'package:audio/core/widgets/buttons/custom_elevated_button.dart';
import 'package:audio/core/constants/asset_constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

part './mixins/login_view_mixin.dart';
part './widgets/forgot_password_button.dart';

@RoutePage()
final class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> with LoginViewMixin {
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
                const SizedBox(height: 220),
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
                const SizedBox(height: 12),
                _ForgotPasswordButton(
                  onForgotPasswordRoute,
                ),
                SizedBox(height: AppDesignConstants.spacingMedium),
                BlocConsumer<AuthBloc, AuthState>(
                  builder: (context, state) {
                    return CustomRoundedButton(
                      width: double.infinity,
                      height: 50.h,
                      bgColor: AppColors.kPrimary,
                      text: context.l10n.logIn,
                      textStyle: context.textTheme.bodyMedium!.copyWith(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      onTap: onLoginPressed,
                    );
                  },
                  listener: (context, state) {
                    if (state is Authenticated) {
                      context.router.replaceAll([HomeRoute()]);
                      return;
                    }
                    if (state is AuthError) {
                      CustomToastMessage.showCustomToast(
                        context,
                        state.message,
                        AppColors.kDanger400,
                      );
                    }
                  },
                ),
                const SizedBox(height: 24),
                FooterText(
                  text: context.l10n.dontHaveAnAccount,
                  buttonText: context.l10n.signUp,
                  onPressed: onSignUpRoute,
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
