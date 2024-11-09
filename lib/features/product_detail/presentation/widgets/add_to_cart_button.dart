part of '../product_detail_view.dart';

final class _AddToCartButton extends StatelessWidget {
  final Function(Product) onTap;
  const _AddToCartButton(this.onTap);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is ProductLoading || state is ProductInitial) {
          return const LinearProgressIndicator();
        }

        if (state is ProductError) {
          return Center(
            child: Text(context.l10n.somethingWentWrong),
          );
        }

        final product = (state as ProductLoaded).products;

        return Padding(
          padding: EdgeInsets.all(
            AppDesignConstants.horizontalPaddingMedium,
          ),
          child: CustomRoundedButton(
            width: double.infinity,
            height: 50.h,
            bgColor: AppColors.kPrimary,
            text: context.l10n.addToCart,
            textStyle: context.textTheme.bodyMedium!.copyWith(
              color: Colors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
            onTap: () => onTap(product),
          ),
        );
      },
    );
  }
}
