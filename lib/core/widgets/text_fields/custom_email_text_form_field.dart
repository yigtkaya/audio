import 'package:audio/core/constants/app_colors.dart';
import 'package:audio/core/constants/app_constants.dart';
import 'package:audio/core/extensions/build_context_extension.dart';
import 'package:audio/localization/l10.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final class CustomEmailTextFormField extends StatefulWidget {
  final TextEditingController controller;
  const CustomEmailTextFormField({
    super.key,
    required this.controller,
  });

  @override
  State<CustomEmailTextFormField> createState() => _CustomEmailTextFormFieldState();
}

class _CustomEmailTextFormFieldState extends State<CustomEmailTextFormField> {
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
      textInputAction: TextInputAction.next,
      cursorColor: AppColors.kGreyDark,
      validator: (value) {
        if (value!.toString().isEmpty) {
          return context.l10n.pleaseEnterEmail;
        } else if (!RegExp(AppConstants.emailRegex).hasMatch(value)) {
          return context.l10n.pleaseEnterValidEmail;
        }
        return null;
      },
      style: context.textTheme.bodyMedium,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.kWhite,
        hintText: context.l10n.email,
        hintStyle: context.textTheme.bodyLarge!.copyWith(
          color: AppColors.kGreyDark,
        ),
        prefixIcon: const Icon(
          Icons.email_outlined,
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
