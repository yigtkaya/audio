import 'package:audio/core/network/failure.dart';
import 'package:audio/features/home/domain/product/product_model.dart';
import 'package:audio/features/product_shop/data/product_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:either_dart/src/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductRepository)
class ProductRepositoryImpl implements ProductRepository {
  final _db = FirebaseFirestore.instance;

  CollectionReference<Product> get productsRef => _db.collection('products').withConverter<Product>(
        fromFirestore: (snapshots, _) => Product.fromJson({
          ...snapshots.data()!,
          'id': snapshots.id,
        }),
        toFirestore: (product, _) => product.toJson()..remove('id'),
      );

  @override
  Future<Either<Failure, List<Product>>> fetchProducts() async {
    try {
      final response = await productsRef
          .orderBy(
            "publishDate",
            descending: true,
          )
          .get();

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
}
