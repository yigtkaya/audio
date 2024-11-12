import 'package:audio/features/product_shop/bloc/products_bloc.dart';
import 'package:audio/localization/l10.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'filter_state.dart';

@injectable
class FilterCubit extends Cubit<FilterState> {
  final ProductsBloc _productsBloc;
  FilterCubit(this._productsBloc) : super(const FilterState());

  void selectCategory(ProductCategory category) {
    emit(state.copyWith(selectedCategory: category));
  }

  FilterState selectSortBy(SortBy sortBy) {
    emit(state.copyWith(selectedSort: sortBy));
    return state;
  }

  void setMinPrice(double price) {
    if (state.maxPrice != null && price > state.maxPrice!) return;
    emit(state.copyWith(minPrice: price));
  }

  void setMaxPrice(double price) {
    if (state.minPrice != null && price < state.minPrice!) return;
    emit(state.copyWith(maxPrice: price));
  }

  void resetFilters() {
    emit(const FilterState());
  }

  void applyFilters() {
    _productsBloc.add(FetchProducts(state));
  }
}
