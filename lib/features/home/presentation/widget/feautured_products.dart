part of '../home_view.dart';

final class _FeauturedProducts extends StatelessWidget {
  final ScrollController scrollController;
  const _FeauturedProducts(this.scrollController);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsBloc, ProductsState>(
      builder: (context, state) {
        if (state is ProductsLoading || state is ProductsInitial) {
          return Center(
            child: _FeaturedProductsSkeleton(),
          );
        }

        if (state is ProductsError) {
          return Center(
            child: Text("Error: ${state.message}"),
          );
        }

        final products = (state as ProductsLoaded).products.take(4).toList();

        return ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: 250.h,
          ),
          child: ListView.separated(
            padding: EdgeInsets.symmetric(
              horizontal: AppDesignConstants.horizontalPaddingLarge,
            ),
            controller: scrollController,
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            separatorBuilder: (context, index) => SizedBox(
              width: AppDesignConstants.horizontalPaddingMedium,
            ),
            itemBuilder: (context, index) {
              return _ProductCard(
                product: products[index],
              );
            },
          ),
        );
      },
    );
  }
}
