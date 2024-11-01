import 'package:audio/core/constants/app_design_constant.dart';
import 'package:audio/shared/widgets/text_fields/custom_email_text_form_field.dart';
import 'package:audio/shared/widgets/text_fields/custom_password_text_form_field.dart';
import 'package:flutter/material.dart';

final class AuthForm extends StatelessWidget {
  const AuthForm({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Form(
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
    );
  }
}
