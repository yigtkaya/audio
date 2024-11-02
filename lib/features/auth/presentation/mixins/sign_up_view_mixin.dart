part of '../sign_up_view.dart';

mixin SignUpViewMixin on State<SignUpView> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void onLoginRoute() {
    context.router.back();
  }

  Future<void> signUp() async {
    final completer = Completer<void>();

    // Listen for authentication success or failure to complete the Future.
    final subscription = context.read<AuthBloc>().stream.listen((state) {
      if (state is Authenticated || state is AuthError) {
        completer.complete();
      }
    });

    context.read<AuthBloc>().add(
          SignUpRequested(
            email: emailController.text,
            password: passwordController.text,
            name: nameController.text,
          ),
        );

    // Complete the future if there's an error.
    await completer.future.whenComplete(() => subscription.cancel());
  }

  void onSignUpPressed() {
    if (!formKey.currentState!.validate()) {
      return;
    }

    CustomLoadingDialog.show(
      context: context,
      future: signUp(),
    );
  }
}
