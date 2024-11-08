import 'package:audio/localization/l10.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'filter_state.dart';

@injectable
class FilterCubit extends Cubit<FilterState> {
  FilterCubit() : super(const FilterState());

  void selectCategory(ProductCategory category) {
    emit(state.copyWith(selectedCategory: category));
  }

  void selectSortBy(SortBy sortBy) {
    emit(state.copyWith(selectedSort: sortBy));
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
    // Here you can implement the logic to actually apply the filters
    // For example, triggering an API call or filtering local data
    // TODO
  }
}
