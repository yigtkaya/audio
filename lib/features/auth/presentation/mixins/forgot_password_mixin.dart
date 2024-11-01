part of '../forgot_password_view.dart';

mixin ForgotPasswordMixin on State<ForgotPasswordView> {
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  void onBackPressed() => context.router.back();
  Future<void> resetPassword() async {
    final completer = Completer<void>();

    // Listen for authentication success or failure to complete the Future.
    final subscription = context.read<AuthBloc>().stream.listen((state) {
      if (state is AuthSucces || state is AuthError) {
        completer.complete();
      }
    });

    context.read<AuthBloc>().add(
          ResetPasswordRequested(
            email: emailController.text,
          ),
        );

    // Complete the future if there's an error.
    await completer.future.whenComplete(() => subscription.cancel());
  }

  void onResetPressed() {
    if (emailController.text.isEmpty) {
      return;
    }

    CustomLoadingDialog.show(
      context: context,
      future: resetPassword(),
    );
  }
}
