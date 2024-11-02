import 'package:audio/core/cubit/base_cubit.dart';
import 'package:injectable/injectable.dart';

part 'category_state.dart';

@injectable
final class CategoryCubit extends BaseCubit<CategoryState> {
  CategoryCubit() : super(CategoryState.initial());

  void selectCategory(String category) {
    emit(
      state.copyWith(
        selectedCategory: category,
      ),
    );
  }

  void updateCategories(List<String> categories) {
    emit(
      state.copyWith(
        categories: categories,
      ),
    );
  }
}
