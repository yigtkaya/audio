part of '../product_detail_view.dart';

final class _FeaturesTabView extends StatelessWidget {
  const _FeaturesTabView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is ProductLoading || state is ProductInitial) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is ProductError) {
          return Center(
            child: Text(state.message),
          );
        }

        final product = (state as ProductLoaded).products;

        if (product.features.isNullOrEmpty) {
          return const Center(
            child: Text('No features available'),
          );
        }

        return SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(
            horizontal: AppDesignConstants.horizontalPaddingMedium,
          ),
          child: Column(
            children: [
              for (final feature in product.features!) ...[
                _FeatureItem(feature),
                SizedBox(
                  height: AppDesignConstants.verticalPaddingMedium,
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}
