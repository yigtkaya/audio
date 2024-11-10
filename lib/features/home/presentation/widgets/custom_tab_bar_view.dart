part of '../home_view.dart';

final class _CustomTabBarView extends StatelessWidget {
  final TabController tabController;

  const _CustomTabBarView(this.tabController);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsBloc, ProductsState>(
      builder: (context, state) {
        if (state is ProductsLoading || state is ProductsInitial) {
          return _CustomTabBarViewSkeleton(tabController);
        }

        if (state is ProductsError) {
          return Center(
            child: Text(
              state.message,
              style: context.textTheme.bodyMedium,
            ),
          );
        }
        // get categories and their first product
        final categories = (state as ProductsLoaded).products.map((product) => product.category).toSet().toList();

        final showCaseProducts = categories.map((category) {
          final product = (state).products.firstWhere((product) => product.category == category);
          return Padding(
            padding: EdgeInsets.only(
              left: AppDesignConstants.horizontalPaddingMedium,
              right: AppDesignConstants.horizontalPaddingMedium,
            ),
            child: _ProductBuyNowCard(
              product: product,
            ),
          );
        }).toList();

        return SizedBox(
          height: 200.h,
          child: TabBarView(
            controller: tabController,
            children: showCaseProducts,
          ),
        );
      },
    );
  }
}
