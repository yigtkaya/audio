import 'package:audio/core/constants/app_colors.dart';
import 'package:audio/core/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomRoundedButton extends StatelessWidget {
  const CustomRoundedButton({
    super.key,
    required this.text,
    required this.onTap,
    this.width,
    this.height,
    this.bgColor,
    this.borderRadius = 8.0,
    this.textStyle,
    this.elevation = 0.0,
    this.borderSide = BorderSide.none,
    this.isLoading = false,
    this.isUploadReceipt = false,
    this.textAlign = TextAlign.center,
  });

  final double? width, height, borderRadius, elevation;
  final Color? bgColor;
  final String text;
  final VoidCallback? onTap;
  final TextStyle? textStyle;
  final BorderSide borderSide;
  final bool isLoading;
  final bool isUploadReceipt;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: isLoading ? null : onTap,
        style: ElevatedButton.styleFrom(
          elevation: elevation,
          backgroundColor: bgColor ?? Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder(
            side: borderSide,
            borderRadius: BorderRadius.circular(borderRadius ?? 14),
          ),
          disabledBackgroundColor: AppColors.kSecondary700.withOpacity(.5),
          padding: EdgeInsets.zero,
        ),
        child: _ButtonContent(
          isLoading: isLoading,
          text: text,
          textStyle: textStyle ??
              context.textTheme.bodyMedium!.copyWith(
                color: Colors.white,
                fontSize: 16.sp,
              ),
        ),
      ),
    );
  }
}

final class _ButtonContent extends StatelessWidget {
  const _ButtonContent({
    required this.isLoading,
    required this.text,
    required this.textStyle,
  });

  final bool isLoading;
  final String text;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const CircularProgressIndicator.adaptive(
        valueColor: AlwaysStoppedAnimation<Color>(
          AppColors.kSuccess400,
        ),
      );
    }

    return Text(
      text,
      textAlign: TextAlign.center,
      style: textStyle,
    );
  }
}
