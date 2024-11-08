import 'package:audio/features/home/domain/features/features_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
class Product with _$Product {
  const factory Product({
    @JsonKey(name: "id") String? id,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "price") int? price,
    @JsonKey(name: "category") String? category,
    @JsonKey(name: "rating") double? rating,
    @JsonKey(name: "photos") List<String>? photo,
    @JsonKey(name: "description") String? description,
    @JsonKey(name: "publishDate") String? publishDate,
    @JsonKey(name: "features") List<Features>? features,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
}
