part of '../product_detail_view.dart';

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

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 24.h),
            Text(
              '${product.price} \$',
              style: context.textTheme.titleSmall!.copyWith(
                color: AppColors.kPrimary,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              product.name.toString(),
              style: context.textTheme.titleMedium,
            ),
            SizedBox(height: 24.h),
          ],
        );
      },
    );
  }
}
