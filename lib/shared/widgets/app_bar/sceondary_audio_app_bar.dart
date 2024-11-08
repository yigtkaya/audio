import 'package:audio/core/constants/app_design_constant.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

final class SecondaryAudioAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SecondaryAudioAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(
          LucideIcons.chevronLeft,
          size: AppDesignConstants.iconSize,
        ),
        onPressed: () {
          context.router.back();
        },
      ),
      actions: [
        IconButton(
          icon: Icon(
            LucideIcons.shoppingCart,
          ),
          onPressed: () {
            // context.read<ProductsBloc>().searchProducts('query');
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56.h);
}
