// ignore_for_file: implementation_imports

import 'package:audio/core/network/failure.dart';
import 'package:audio/features/home/domain/product/product_model.dart';
import 'package:audio/features/product_shop/cubit/filter_cubit.dart';
import 'package:audio/features/product_shop/data/product_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:either_dart/src/either.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductRepository)
class ProductRepositoryImpl implements ProductRepository {
  final _db = FirebaseFirestore.instance;

  /// Reference to the products collection
  CollectionReference<Product> get productsRef => _db.collection('products').withConverter<Product>(
        fromFirestore: (snapshots, _) => Product.fromJson({
          ...snapshots.data()!,
          'id': snapshots.id,
        }),
        toFirestore: (product, _) => product.toJson()..remove('id'),
      );

  /// Fetches the products from the firestore database
  @override
  Future<Either<Failure, List<Product>>> fetchProducts(FilterState filters) async {
    try {
      // Start with base query
      Query<Product> query = productsRef;

      print('Applying filters:');
      print('Category: ${filters.selectedCategory?.name}');
      print('Min Price: ${filters.minPrice}');
      print('Max Price: ${filters.maxPrice}');

      // Apply category filter if present
      if (filters.selectedCategory != null) {
        print('Adding category filter');
        query = query.where('category', isEqualTo: filters.selectedCategory!.name);
      }

      // Apply price filters if present
      if (filters.minPrice != null || filters.maxPrice != null) {
        print('Adding price filters');

        if (filters.minPrice != null) {
          print('Adding min price filter: ${filters.minPrice}');
          query = query.where('price', isGreaterThanOrEqualTo: filters.minPrice);
        }

        if (filters.maxPrice != null) {
          print('Adding max price filter: ${filters.maxPrice}');
          query = query.where('price', isLessThanOrEqualTo: filters.maxPrice);
        }
      }

      // Add ordering last
      print('Adding price ordering');
      query = query.orderBy('price', descending: true);

      final response = await query.get();

      return Right(
        response.docs.map((e) => e.data()).toList(),
      );
    } on FirebaseException catch (e) {
      return Left(
        Failure(
          message: e.message.toString(),
          code: e.code,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, Product>> fetchProduct(String id) async {
    try {
      final repsonse = await productsRef.doc(id).get();

      return Right(
        repsonse.data()!,
      );
    } on FirebaseException catch (e) {
      return Left(
        Failure(
          message: e.message.toString(),
          code: e.code,
        ),
      );
    }
  }
}
