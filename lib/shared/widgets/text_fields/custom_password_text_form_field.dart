import 'package:audio/core/constants/app_colors.dart';
import 'package:audio/core/extensions/build_context_extension.dart';
import 'package:audio/localization/l10.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final class CustomPasswordTextFormField extends StatefulWidget {
  final TextEditingController controller;
  const CustomPasswordTextFormField({
    super.key,
    required this.controller,
  });

  @override
  State<CustomPasswordTextFormField> createState() => _CustomPasswordTextFormFieldState();
}

class _CustomPasswordTextFormFieldState extends State<CustomPasswordTextFormField> {
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
      cursorColor: AppColors.kGreyDark,
      validator: (value) {
        if (value!.toString().isEmpty) {
          return context.l10n.pleaseEnterPassword;
        } else if (value.toString().length < 8) {
          return context.l10n.aPasswordShouldBeAtLeast8Characters;
        }
        return null;
      },
      obscureText: true,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: context.l10n.password,
        hintStyle: context.textTheme.bodyLarge!.copyWith(
          color: AppColors.kGreyDark,
        ),
        prefixIcon: const Icon(
          Icons.lock_outline,
          color: AppColors.kGreyDark,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: AppColors.kGreyDark,
            width: 1.w,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: AppColors.kPrimary50,
            width: 1.w,
          ),
        ),
      ),
    );
  }
}
