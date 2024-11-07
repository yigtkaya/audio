import 'package:audio/features/home/domain/product/product_model.dart';
import 'package:audio/core/bloc/base_bloc.dart';
import 'package:audio/features/product_shop/data/product_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'products_event.dart';
part 'products_state.dart';

@injectable
final class ProductsBloc extends BaseBloc<ProductsEvent, ProductsState> {
  final ProductRepository _repository;

  ProductsBloc(this._repository) : super(ProductsInitial()) {
    on<FetchProducts>(_onFetchProducts);
  }

  Future<void> _onFetchProducts(
    FetchProducts event,
    Emitter<ProductsState> emit,
  ) async {
    emit(ProductsLoading());

    final result = await _repository.fetchProducts();

    result.fold(
      (failure) => emit(
        ProductsError(
          message: failure.message,
        ),
      ),
      (products) => emit(
        ProductsLoaded(
          products: products,
        ),
      ),
    );
  }

  // Optional: Method for search
  // Future<void> searchProducts(String query) async {
  //   emit(ProductsLoading());

  //   final result = await _repository.searchProducts(query);

  //   result.fold(
  //     (failure) => emit(ProductsError(message: failure.message)),
  //     (products) => emit(ProductsLoaded(products: products)),
  //   );
  // }
}
