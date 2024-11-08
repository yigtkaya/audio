part of 'filter_cubit.dart';

enum ProductCategory {
  headphone,
  headband,
  earpads,
  cable;

  String getLocalizedName(BuildContext context) {
    switch (this) {
      case ProductCategory.headphone:
        return context.l10n.headphone;
      case ProductCategory.headband:
        return context.l10n.headband;
      case ProductCategory.earpads:
        return context.l10n.earpads;
      case ProductCategory.cable:
        return context.l10n.cable;
    }
  }
}

enum SortBy {
  rating,
  newest,
  oldest,
  mostExpensive;

  String getLocalizedName(BuildContext context) {
    switch (this) {
      case SortBy.rating:
        return context.l10n.rating;
      case SortBy.newest:
        return context.l10n.newest;
      case SortBy.oldest:
        return context.l10n.oldest;
      case SortBy.mostExpensive:
        return context.l10n.mostExpensive;
    }
  }
}

class FilterState extends Equatable {
  final ProductCategory? selectedCategory;
  final SortBy? selectedSort;
  final double? minPrice;
  final double? maxPrice;

  const FilterState({
    this.selectedCategory,
    this.selectedSort,
    this.minPrice,
    this.maxPrice,
  });

  FilterState copyWith({
    ProductCategory? selectedCategory,
    SortBy? selectedSort,
    double? minPrice,
    double? maxPrice,
  }) {
    return FilterState(
      selectedCategory: selectedCategory ?? this.selectedCategory,
      selectedSort: selectedSort ?? this.selectedSort,
      minPrice: minPrice ?? this.minPrice,
      maxPrice: maxPrice ?? this.maxPrice,
    );
  }

  @override
  List<Object?> get props => [selectedCategory, selectedSort, minPrice, maxPrice];
}
