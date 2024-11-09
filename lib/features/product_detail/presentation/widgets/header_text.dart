part of '../product_detail_view.dart';

// Updated _HeaderText widget
final class _HeaderText extends StatelessWidget {
  const _HeaderText();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is ProductInitial || state is ProductLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is ProductError) {
          return Center(
            child: Text(
              state.message,
              style: context.textTheme.bodyLarge!.copyWith(
                color: AppColors.kGrey,
              ),
            ),
          );
        }

        final product = (state as ProductLoaded).products;

        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppDesignConstants.horizontalPaddingMedium,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                '${product.price} \$',
                style: context.textTheme.titleMedium!.copyWith(
                  color: AppColors.kPrimary,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                product.name.toString(),
                style: context.textTheme.titleLarge?.copyWith(
                  color: AppColors.kBlack,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
