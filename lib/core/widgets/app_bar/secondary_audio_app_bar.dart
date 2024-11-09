import 'package:audio/core/constants/app_colors.dart';
import 'package:audio/core/constants/app_design_constant.dart';
import 'package:audio/core/router/app_router.gr.dart';
import 'package:audio/features/shopping_cart/cubit/cart_cubit.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            return GestureDetector(
              onTap: () => context.router.push(
                const ShoppingCartRoute(),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppDesignConstants.horizontalPaddingMedium,
                ),
                child: Badge(
                  label: state.items.isEmpty
                      ? null
                      : Text(
                          state.items.length.toString(),
                        ),
                  backgroundColor: state.items.isEmpty ? Colors.transparent : AppColors.kPrimary,
                  textColor: AppColors.kWhite,
                  child: Icon(
                    LucideIcons.shoppingCart,
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56.h);
}
