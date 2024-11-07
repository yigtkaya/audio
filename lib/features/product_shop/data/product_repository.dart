import 'package:audio/core/network/failure.dart';
import 'package:audio/features/home/domain/product/product_model.dart';
import 'package:either_dart/either.dart';

abstract interface class ProductRepository {
  Future<Either<Failure, List<Product>>> fetchProducts();
}
