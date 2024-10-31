part of '../login_view.dart';

final class _ForgotPasswordButton extends StatelessWidget {
  const _ForgotPasswordButton();

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        // context.router.push(const ForgotPasswordRoute());
      },
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
      ),
      child: Text(
        context.l10n.forgotPassword,
        style: context.textTheme.bodyMedium!.copyWith(
          color: Colors.white,
          fontSize: 14.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
