part of '../product_shop_view.dart';

final class _ProductsGrid extends StatelessWidget {
  const _ProductsGrid();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.kGreyLight1,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppDesignConstants.borderRadius),
          topRight: Radius.circular(AppDesignConstants.borderRadius),
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: AppDesignConstants.horizontalPaddingMedium,
        vertical: AppDesignConstants.verticalPaddingLarge,
      ),
      child: BlocBuilder<ProductsBloc, ProductsState>(
        builder: (context, state) {
          if (state is ProductsLoading || state is ProductsInitial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is ProductsError) {
            return Center(
              child: Text(
                context.l10n.somethingWentWrong,
              ),
            );
          }

          final products = (state as ProductsLoaded).products;

          if (products.isEmpty) {
            return Center(
              child: Text(
                context.l10n.noActiveTrips,
              ),
            );
          }
          return GridView.builder(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: products.length,
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
          );
        },
      ),
    );
  }
}
