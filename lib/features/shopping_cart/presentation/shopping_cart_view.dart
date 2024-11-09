import 'package:audio/core/constants/app_colors.dart';
import 'package:audio/core/constants/app_design_constant.dart';
import 'package:audio/core/extensions/build_context_extension.dart';
import 'package:audio/core/widgets/buttons/custom_elevated_button.dart';
import 'package:audio/features/shopping_cart/cubit/cart_cubit.dart';
import 'package:audio/features/shopping_cart/cubit/cart_item.dart';
import 'package:audio/localization/l10.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

part './widgets/cart_item.dart';
part './widgets/checkout_button.dart';
part './widgets/shopping_app_bar.dart';
part './mixin/shopping_cart_mixin.dart';

@RoutePage()
final class ShoppingCartView extends StatefulWidget {
  const ShoppingCartView({super.key});

  @override
  State<ShoppingCartView> createState() => _ShoppingCartViewState();
}

class _ShoppingCartViewState extends State<ShoppingCartView> with ShoppingCartMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: _ShoppingAppBar(onClear),
      bottomNavigationBar: _CheckoutButton(),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state.items.isEmpty) {
            return Center(
              child: Text(
                context.l10n.emptyCart,
                style: context.textTheme.bodyMedium!.copyWith(
                  color: AppColors.kGrey,
                ),
              ),
            );
          }

          return ListView.builder(
            itemCount: state.items.length,
            itemBuilder: (context, index) {
              final item = state.items.values.elementAt(index);
              return _CartItem(
                item: item,
                onRemove: () => onRemove(item),
                onUpdateQuantity: (quantity) => onUpdateQuantity(item, quantity),
              );
            },
          );
        },
      ),
    );
  }
}
