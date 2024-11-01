import 'package:audio/features/auth/bloc/auth_bloc.dart';
import 'package:audio/features/auth/presentation/sign_up_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

mixin SignUpViewMixin on State<SignUpView> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void onSignUpPressed() {
    if (!formKey.currentState!.validate()) {
      return;
    }

    context.read<AuthBloc>().add(
          SignUpRequested(
            email: emailController.text,
            password: passwordController.text,
          ),
        );
  }
}
