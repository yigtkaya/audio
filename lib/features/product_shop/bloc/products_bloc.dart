import 'package:audio/features/home/domain/product/product_model.dart';
import 'package:audio/core/bloc/base_bloc.dart';
import 'package:audio/features/product_shop/cubit/filter_cubit.dart';
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

  /// Fetch products from the repository
  Future<void> _onFetchProducts(
    FetchProducts event,
    Emitter<ProductsState> emit,
  ) async {
    emit(ProductsLoading());

    final result = await _repository.fetchProducts(
      event.filterState,
    );

    /// Handle the result of the fetch
    result.fold(
      (failure) => safeEmit(
        ProductsError(
          message: failure.message,
        ),
        emit,
      ),
      (products) {
        safeEmit(
          ProductsLoaded(
            products: products,
          ),
          emit,
        );
      },
    );
  }
}
