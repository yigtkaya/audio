part of '../product_shop_view.dart';

final class _ProductsGrid extends StatelessWidget {
  const _ProductsGrid();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsBloc, ProductsState>(
      builder: (context, state) {
        if (state is ProductsLoading || state is ProductsInitial) {
          return const Center(
            child: CircularProgressIndicator.adaptive(
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.kPrimary),
            ),
          );
        }

        if (state is ProductsError) {
          return Center(
            child: Text(
              context.l10n.somethingWentWrong,
            ),
          );
        }

        if (state is ProductsLoaded) {
          if (state.products.isEmpty) {
            return Center(
              child: Text(
                context.l10n.noProductsFound,
                style: context.textTheme.bodyMedium!.copyWith(
                  color: AppColors.kGrey,
                ),
              ),
            );
          }

          return Container(
            decoration: BoxDecoration(
              color: AppColors.kGreyLight1,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(AppDesignConstants.borderRadiusCircular),
                topRight: Radius.circular(AppDesignConstants.borderRadiusCircular),
              ),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: AppDesignConstants.horizontalPaddingMedium,
              vertical: AppDesignConstants.verticalPaddingLarge,
            ),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemCount: state.products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                childAspectRatio: 0.7,
              ),
              itemBuilder: (context, index) {
                final product = state.products[index];
                return ProductCard(
                  product: product,
                );
              },
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
