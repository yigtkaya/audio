import 'package:audio/core/constants/app_colors.dart';
import 'package:audio/core/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final class CustomSearchTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  const CustomSearchTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
  });

  @override
  State<CustomSearchTextFormField> createState() => _CustomSearchTextFormFieldState();
}

class _CustomSearchTextFormFieldState extends State<CustomSearchTextFormField> {
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
      controller: widget.controller,
      focusNode: myFocusNode,
      textInputAction: TextInputAction.done,
      cursorColor: AppColors.kGreyDark,
      style: context.textTheme.bodyMedium,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.kWhite,
        hintText: widget.hintText,
        hintStyle: context.textTheme.bodyMedium!.copyWith(
          color: AppColors.kGrey,
        ),
        prefixIcon: Icon(
          Icons.search,
          color: myFocusNode.hasFocus ? AppColors.kPrimary : AppColors.kGrey,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: AppColors.kGrey,
            width: 1.w,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: AppColors.kGrey,
            width: 1.w,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: AppColors.kPrimary,
            width: 1.w,
          ),
        ),
      ),
    );
  }
}
