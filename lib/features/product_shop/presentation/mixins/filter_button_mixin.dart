part of '../product_shop_view.dart';

mixin _FilterButtonMixin on State<_FilterButton> {
  void onFilterButtonPressed() {
    final filterCubit = context.read<FilterCubit>();
    final productsBloc = context.read<ProductsBloc>();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      useRootNavigator: false,
      barrierColor: AppColors.kBlack.withOpacity(0.5),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(
            AppDesignConstants.borderRadius,
          ),
        ),
      ),
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.8,
        maxChildSize: 0.8,
        minChildSize: 0.5,
        expand: false,
        builder: (context, scrollController) => MultiBlocProvider(
          providers: [
            BlocProvider.value(value: filterCubit),
            BlocProvider.value(
              value: productsBloc,
            ),
          ],
          child: _FilterBottomSheet(),
        ),
      ),
    );
  }
}
