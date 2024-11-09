import 'package:audio/core/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:audio/core/constants/app_colors.dart';

final class CustomToastMessage extends StatelessWidget {
  const CustomToastMessage({
    super.key,
    required this.message,
    this.bgColor,
    this.textColor = Colors.white,
  });
  final Color? bgColor;
  final Color? textColor;
  final String? message;

  static void showCustomToast(
    BuildContext context,
    String message,
    Color bgColor,
  ) {
    FToast().init(context).showToast(
          child: CustomToastMessage(
            message: message,
            bgColor: bgColor,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 45.0),
      child: Container(
        decoration: BoxDecoration(
          color: bgColor ?? AppColors.kInfo500,
          borderRadius: BorderRadius.all(Radius.circular(16.r)),
        ),
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
          horizontal: 12.w,
          vertical: 16.h,
        ),
        child: Text(
          message ?? "",
          textAlign: TextAlign.center,
          style: context.textTheme.bodyMedium!.copyWith(
            color: textColor,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
