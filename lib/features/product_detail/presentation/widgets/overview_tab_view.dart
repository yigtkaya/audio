part of '../product_detail_view.dart';

final class _OverviewTabView extends StatelessWidget {
  const _OverviewTabView();

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

        return SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(
            horizontal: AppDesignConstants.horizontalPaddingMedium,
          ),
          child: Column(
            children: [
              if (product.photo.isNotNullOrEmpty) ...[
                SizedBox(
                  height: 40.h,
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: 240.h),
                  child: CarouselView(
                    backgroundColor: Colors.transparent,
                    itemExtent: context.screenWidth,
                    shrinkExtent: 180.h,
                    padding: EdgeInsets.symmetric(
                      horizontal: AppDesignConstants.horizontalPaddingMedium,
                    ),
                    children: product.photo!.map(
                      (photo) {
                        return CachedNetworkImage(
                          imageUrl: photo,
                          fit: BoxFit.fitHeight,
                          placeholder: (context, url) => const Center(
                            child: CircularProgressIndicator(),
                          ),
                          errorWidget: (context, url, error) => const Icon(Icons.error),
                        );
                      },
                    ).toList(),
                  ),
                ),
              ],
              SizedBox(
                height: 40.h,
              ),
              Text(
                product.description.toString() * 10,
                style: context.textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
