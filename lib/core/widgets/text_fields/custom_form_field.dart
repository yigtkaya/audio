import 'package:audio/core/constants/app_colors.dart';
import 'package:audio/core/constants/app_design_constant.dart';
import 'package:audio/core/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    this.controller,
    this.inputType,
    this.labelText,
    this.prefixText,
    this.maxLines,
    this.maxLength,
    this.validator,
    this.inputFormatters,
    this.onChanged,
    this.hasCurrencySymbol,
    this.enabled,
    this.suffixText,
    this.hintText,
    this.hasSearchIcon,
    this.prefixIcon,
    this.readOnly,
  });
  final TextEditingController? controller;
  final TextInputType? inputType;
  final String? labelText, prefixText, suffixText, hintText;
  final bool? hasCurrencySymbol;
  final int? maxLines, maxLength;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatters;
  final ValueChanged<String>? onChanged;
  final bool? enabled;
  final bool? hasSearchIcon;
  final Widget? prefixIcon;
  final bool? readOnly;

  @override
  State<StatefulWidget> createState() => TextFieldState();
}

class TextFieldState extends State<CustomTextField> {
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
      autovalidateMode: AutovalidateMode.onUserInteraction,
      textInputAction: TextInputAction.next,
      style: context.textTheme.bodyMedium,
      cursorColor: AppColors.kSecondary600,
      enabled: widget.enabled,
      focusNode: myFocusNode,
      controller: widget.controller,
      keyboardType: widget.inputType,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        hintText: widget.hintText,
        border: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        enabledBorder: outlineInputBorder,
        errorBorder: outlineInputBorder,
        disabledBorder: outlineInputBorder,
        focusedErrorBorder: outlineInputBorder,
        fillColor: AppColors.kWhite,
        filled: true,
        hintStyle: context.textTheme.bodyMedium!.copyWith(
          color: AppColors.kGreyDark,
        ),
        errorStyle: context.textTheme.bodyMedium!.copyWith(
          fontSize: 12.sp,
          fontWeight: FontWeight.normal,
          color: Colors.red,
        ),
        prefix: widget.prefixIcon,
        errorMaxLines: 1,
      ),
      maxLines: widget.maxLines,
      maxLength: widget.maxLength,
      validator: widget.validator,
      inputFormatters: widget.inputFormatters,
    );
  }

  OutlineInputBorder get outlineInputBorder => OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          AppDesignConstants.borderRadiusSmall,
        ),
        borderSide: BorderSide(
          width: 1.w,
          color: AppColors.kGreyDark,
        ),
      );
}
