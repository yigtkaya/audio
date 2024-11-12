part of '../product_shop_view.dart';

mixin _FilterContentMixin on State<_FilterContent> {
  final minPriceController = TextEditingController();
  final maxPriceController = TextEditingController();

  @override
  void initState() {
    super.initState();
    minPriceController.text = (context.read<FilterCubit>().state.minPrice ?? '').toString();
    maxPriceController.text = (context.read<FilterCubit>().state.maxPrice ?? '').toString();
  }

  @override
  void dispose() {
    minPriceController.dispose();
    maxPriceController.dispose();
    super.dispose();
  }

  void onApplyFiltersPressed() {
    context.read<ProductsBloc>().add(
          FetchProducts(context.read<FilterCubit>().state),
        );
    context.router.maybePop();
  }

  void onClearFiltersPressed() {
    context.read<FilterCubit>().resetFilters();
    minPriceController.text = '';
    maxPriceController.text = '';
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
