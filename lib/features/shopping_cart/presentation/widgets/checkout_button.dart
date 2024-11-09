part of '../shopping_cart_view.dart';

final class _CheckoutButton extends StatelessWidget {
  const _CheckoutButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.all(AppDesignConstants.horizontalPaddingMedium),
          child: CustomRoundedButton(
            text: '${context.l10n.checkout} \$${state.totalPrice.toStringAsFixed(2)}',
            onTap: () {},
            bgColor: AppColors.kPrimary,
            height: 50.h,
          ),
        );
      },
    );
  }
}
