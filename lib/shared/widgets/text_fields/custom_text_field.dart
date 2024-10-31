import 'package:audio/core/constants/app_colors.dart';
import 'package:audio/core/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final Widget prefixIcon;
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.prefixIcon,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late FocusNode myFocusNode;
  bool focused = false;
  bool isEmpty = true;

  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode()..addListener(() => setState(() => focused = myFocusNode.hasFocus));
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: widget.hintText,
        hintStyle: context.textTheme.bodyLarge!.copyWith(
          color: AppColors.kGreyDark,
        ),
        prefixIcon: widget.prefixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: AppColors.kGreyDark,
            width: 1.w,
          ),
        ),
      ),
    );
  }
}
