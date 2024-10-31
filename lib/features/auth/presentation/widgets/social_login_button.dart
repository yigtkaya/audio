import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

final class SocialLoginButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String icon;

  const SocialLoginButton({
    super.key,
    required this.onPressed,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: SvgPicture.asset(
          icon,
          width: 24,
          height: 24,
        ),
        padding: EdgeInsets.zero,
      ),
    );
  }
}
