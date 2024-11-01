// import 'package:flutter/foundation.dart';
// import 'package:audio/localization/helper/bloc/language_bloc.dart';

// /// EMAIL REGEX
// String emailRegex =
//     r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$'; //r'^[^@]+@[^@]+\.[^@]+'

// String eduMailRegex = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@([a-zA-Z0-9-]+\.)+edu$';

// String turkishNumberPlate =
//     r'^(0[1-9]|[1-7][0-9]|8[01])((\s?[a-zA-Z]\s?)(\d{4,5})|(\s?[a-zA-Z]{2}\s?)(\d{3,4})|(\s?[a-zA-Z]{3}\s?)(\d{2,3}))$';

// @immutable
// class Validators {
//   static String? emailValidator(value) {
//     if (value!.toString().isEmpty) {
//       return tr.pleaseEnterEmail;
//     } else if (!RegExp(emailRegex).hasMatch(value)) {
//       return tr.pleaseEnterValidEmail;
//     }
//     return null;
//   }

//   static String? passwordValidator(value) {
//     if (value!.toString().isEmpty) {
//       return tr.pleaseEnterPassword;
//     } else if (value.toString().length < 8) {
//       return tr.aPasswordShouldBeAtLeast8Characters;
//     }
//     return null;
//   }

//   static String? numberPlateValidator(value) {
//     final turkishNumberPlate = RegExp(
//       r'^(0[1-9]|[1-7][0-9]|8[01])((\s?[a-zA-Z]\s?)(\d{4,5})|(\s?[a-zA-Z]{2}\s?)(\d{3,4})|(\s?[a-zA-Z]{3}\s?)(\d{2,3}))$',
//       caseSensitive: false, // Ensure case-insensitivity
//     );

//     if (!turkishNumberPlate.hasMatch(value.trim())) {
//       return tr.notAvalidNumberPlate;
//     }
//     return null;
//   }

//   static String? phoneOTPValidator(String? value) {
//     if (value!.toString().length != 6) {
//       return "tr.yourVerificationCodeShouldBe6Digits";
//     }
//     return null;
//   }
// }
