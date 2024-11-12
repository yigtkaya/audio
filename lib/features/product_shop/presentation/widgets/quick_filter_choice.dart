part of '../product_shop_view.dart';

final class _QuickFilterChoice extends StatelessWidget {
  final String choice;
  const _QuickFilterChoice(
    this.choice,
  );

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterCubit, FilterState>(
      builder: (context, state) {
        final isSelected = state.selectedSort == (choice == context.l10n.newest ? SortBy.newest : SortBy.mostExpensive);
        return GestureDetector(
          onTap: () {
            final sortBy = choice == context.l10n.newest ? SortBy.newest : SortBy.mostExpensive;
            final lastState = context.read<FilterCubit>().selectSortBy(sortBy);

            context.read<ProductsBloc>().add(
                  FetchProducts(
                    lastState,
                  ),
                );
          },
          child: Container(
            decoration: BoxDecoration(
              color: isSelected ? AppColors.kPrimary : AppColors.kWhite,
              borderRadius: BorderRadius.circular(
                AppDesignConstants.borderRadius,
              ),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: AppDesignConstants.horizontalPaddingMedium,
              vertical: AppDesignConstants.verticalPaddingMedium,
            ),
            child: Text(
              choice,
              style: context.textTheme.bodyMedium!.copyWith(
                color: isSelected ? AppColors.kWhite : AppColors.kBlack,
              ),
            ),
          ),
        );
      },
    );
  }
}
