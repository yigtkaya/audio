part of '../shopping_cart_view.dart';

final class _CheckoutButton extends StatelessWidget {
  const _CheckoutButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.all(AppDesignConstants.horizontalPaddingMedium),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${context.l10n.total}:',
                    style: context.textTheme.bodyMedium,
                  ),
                  Text(
                    '\$${state.totalPrice.toStringAsFixed(2)}',
                    style: context.textTheme.bodyLarge,
                  ),
                ],
              ),
              SizedBox(
                height: AppDesignConstants.verticalPaddingLarge,
              ),
              CustomRoundedButton(
                width: double.infinity,
                text: context.l10n.checkout,
                onTap: () {},
                bgColor: AppColors.kPrimary,
                height: 50.h,
              ),
            ],
          ),
        );
      },
    );
  }
}
