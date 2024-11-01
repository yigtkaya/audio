import 'package:audio/features/auth/bloc/auth_bloc.dart';
import 'package:audio/features/auth/presentation/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

mixin LoginViewMixin on State<LoginView> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void onLoginPressed() {
    if (!formKey.currentState!.validate()) {
      return;
    }

    context.read<AuthBloc>().add(
          SignInRequested(
            email: emailController.text,
            password: passwordController.text,
          ),
        );
  }
}
