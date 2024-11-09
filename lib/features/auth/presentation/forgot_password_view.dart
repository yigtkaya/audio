import 'dart:async';

import 'package:audio/core/constants/app_colors.dart';
import 'package:audio/core/constants/app_design_constant.dart';
import 'package:audio/core/extensions/build_context_extension.dart';
import 'package:audio/features/auth/bloc/auth_bloc.dart';
import 'package:audio/core/widgets/loading/custom_loading_dialog.dart';
import 'package:audio/core/widgets/toast/custom_toast.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:audio/features/auth/presentation/widgets/header_text.dart';
import 'package:audio/localization/l10.dart';
import 'package:audio/core/widgets/buttons/custom_elevated_button.dart';
import 'package:audio/core/widgets/text_fields/custom_email_text_form_field.dart';
import 'package:audio/core/constants/asset_constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

part './mixins/forgot_password_mixin.dart';

@RoutePage()
final class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> with ForgotPasswordMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          onPressed: onBackPressed,
          icon: Icon(
            Icons.chevron_left,
            color: AppColors.kWhite,
            size: 32.r,
          ),
        ),
      ),
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
                CustomEmailTextFormField(
                  controller: emailController,
                ),
                const SizedBox(height: 60),
                BlocConsumer<AuthBloc, AuthState>(
                  builder: (context, state) {
                    return CustomRoundedButton(
                      width: double.infinity,
                      height: 50.h,
                      bgColor: AppColors.kPrimary,
                      text: context.l10n.send,
                      textStyle: context.textTheme.bodyMedium!.copyWith(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      onTap: onResetPressed,
                    );
                  },
                  listener: (context, state) {
                    if (state is AuthError) {
                      CustomToastMessage.showCustomToast(
                        context,
                        state.message,
                        AppColors.kDanger400,
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
