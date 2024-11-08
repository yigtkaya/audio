part of '../product_shop_view.dart';

mixin _FilterContentMixin on State<_FilterContent> {
  void onApplyFiltersPressed() {
    context.router.maybePop();
  }

  void onCategorySelected(ProductCategory category) {
    context.read<FilterCubit>().selectCategory(category);
  }

  void onSortBySelected(SortBy sortBy) {
    context.read<FilterCubit>().selectSortBy(sortBy);
  }

  void onMinPriceChanged(String price) {
    context.read<FilterCubit>().setMinPrice(double.parse(price));
  }

  void onMaxPriceChanged(String price) {
    context.read<FilterCubit>().setMaxPrice(double.parse(price));
  }
}
