import 'dart:async';
import 'package:audio/core/constants/app_colors.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

/// It will show a loading dialog with a text and a circular progress indicator.
final class CustomLoadingDialog extends StatelessWidget {
  const CustomLoadingDialog({super.key});

  /// It will show a loading dialog with a text and a circular progress indicator.
  /// [BuildContext] is required to show the dialog.
  /// [Future] is required to complete dialog.
  ///
  /// Returns the result of the [Future<T>].
  static Future<T> show<T>({
    required BuildContext context,
    required Future<T> future,
  }) async {
    unawaited(
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => const CustomLoadingDialog(),
      ),
    );
    final result = await future;
    if (context.mounted) {
      context.router.back();
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Center(
        child: const CircularProgressIndicator.adaptive(
          valueColor: AlwaysStoppedAnimation(
            AppColors.kWhite,
          ),
        ),
      ),
    );
  }
}
