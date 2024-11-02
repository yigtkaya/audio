part of 'category_cubit.dart';

final class CategoryState extends BaseState {
  final String selectedCategory;
  final List<String> categories;

  const CategoryState({
    required this.selectedCategory,
    required this.categories,
  });

  factory CategoryState.initial() {
    return const CategoryState(
      selectedCategory: 'Headphone',
      categories: ['Headphone', 'Headband', 'Earpads', 'Cable'],
    );
  }

  CategoryState copyWith({
    String? selectedCategory,
    List<String>? categories,
  }) {
    return CategoryState(
      selectedCategory: selectedCategory ?? this.selectedCategory,
      categories: categories ?? this.categories,
    );
  }

  @override
  List<Object?> get props => [selectedCategory, categories];
}
