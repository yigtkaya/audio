part of '../login_view.dart';

mixin LoginViewMixin on State<LoginView> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void onSignUpRoute() {
    context.router.push(const SignUpRoute());
  }

  void onForgotPasswordRoute() => context.router.push(ForgotPasswordRoute());

  Future<void> login() async {
    final completer = Completer<void>();

    // Listen for authentication success or failure to complete the Future.
    final subscription = context.read<AuthBloc>().stream.listen((state) {
      if (state is Authenticated || state is AuthError || state is Unauthenticated) {
        completer.complete();
      }
    });

    context.read<AuthBloc>().add(
          SignInRequested(
            email: emailController.text,
            password: passwordController.text,
          ),
        );

    // Complete the future if there's an error.
    await completer.future.whenComplete(() => subscription.cancel());
  }

  void onLoginPressed() {
    if (!formKey.currentState!.validate()) {
      return;
    }

    CustomLoadingDialog.show(
      context: context,
      future: login(),
    );
  }
}
