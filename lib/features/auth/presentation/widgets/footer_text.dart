import 'package:audio/core/constants/app_colors.dart';
import 'package:audio/core/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final class FooterText extends StatelessWidget {
  final String text;
  final String buttonText;
  final VoidCallback onPressed;
  const FooterText({
    super.key,
    required this.text,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: context.textTheme.bodyMedium!.copyWith(
            color: Colors.white,
          ),
        ),
        TextButton(
          onPressed: () => onPressed(),
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
          ),
          child: Text(
            buttonText,
            style: context.textTheme.bodyMedium!.copyWith(
              color: AppColors.kPrimary,
              fontWeight: FontWeight.bold,
              fontSize: 15.sp,
            ),
          ),
        ),
      ],
    );
  }
}
