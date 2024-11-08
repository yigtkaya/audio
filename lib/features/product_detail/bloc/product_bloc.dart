import 'package:audio/core/bloc/base_bloc.dart';
import 'package:audio/features/home/domain/product/product_model.dart';
import 'package:audio/features/product_shop/data/product_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

part 'product_state.dart';
part 'product_event.dart';

@injectable
final class ProductBloc extends BaseBloc<ProductEvent, ProductState> {
  final ProductRepository _productRepository;
  ProductBloc(
    this._productRepository,
  ) : super(ProductInitial()) {
    on<FetchProduct>(_onFetchProduct);
  }

  void _onFetchProduct(FetchProduct event, Emitter<ProductState> emit) async {
    safeEmit(ProductLoading(), emit);
    final response = await _productRepository.fetchProduct(event.id);

    response.fold(
      (failure) => safeEmit(
        ProductError(
          message: failure.message,
        ),
        emit,
      ),
      (product) => safeEmit(
        ProductLoaded(
          products: product,
        ),
        emit,
      ),
    );
  }
}
