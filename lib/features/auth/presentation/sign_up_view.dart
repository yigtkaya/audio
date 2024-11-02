import 'package:audio/core/constants/app_colors.dart';
import 'package:audio/core/constants/app_design_constant.dart';
import 'package:audio/core/constants/asset_constants.dart';
import 'package:audio/core/extensions/build_context_extension.dart';
import 'package:audio/core/router/app_router.gr.dart';
import 'package:audio/features/auth/bloc/auth_bloc.dart';
import 'dart:async';
import 'package:audio/shared/widgets/loading/custom_loading_dialog.dart';
import 'package:audio/shared/widgets/text_fields/custom_email_text_form_field.dart';
import 'package:audio/shared/widgets/text_fields/custom_form_field.dart';
import 'package:audio/shared/widgets/text_fields/custom_password_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:audio/features/auth/presentation/widgets/footer_text.dart';
import 'package:audio/features/auth/presentation/widgets/header_text.dart';
import 'package:audio/features/auth/presentation/widgets/social_login_button.dart';
import 'package:audio/localization/l10.dart';
import 'package:audio/shared/widgets/buttons/custom_elevated_button.dart';
import 'package:audio/shared/widgets/toast/custom_toast.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

part './mixins/sign_up_view_mixin.dart';

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
      resizeToAvoidBottomInset: true,
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
                const HeaderText(),
                SizedBox(height: 220.h),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        controller: nameController,
                        hintText: context.l10n.name,
                        validator: (value) => value?.isNotEmpty == true ? null : context.l10n.thisFieldIsRequired,
                      ),
                      SizedBox(
                        height: AppDesignConstants.spacingMedium,
                      ),
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
                BlocConsumer<AuthBloc, AuthState>(
                  builder: (context, state) {
                    return Column(
                      children: [
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
                        SocialLoginButton(
                          onPressed: () {},
                          icon: AssetConstants.icons.google,
                        ),
                      ],
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
                SizedBox(height: AppDesignConstants.spacingLarge),
                FooterText(
                  text: context.l10n.aldreadyHaveAnAccount,
                  buttonText: context.l10n.logIn,
                  onPressed: onLoginRoute,
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
