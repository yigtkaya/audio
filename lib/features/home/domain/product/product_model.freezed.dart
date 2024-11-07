// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Product _$ProductFromJson(Map<String, dynamic> json) {
  return _Product.fromJson(json);
}

/// @nodoc
mixin _$Product {
  @JsonKey(name: "name")
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: "price")
  int? get price => throw _privateConstructorUsedError;
  @JsonKey(name: "category")
  String? get category => throw _privateConstructorUsedError;
  @JsonKey(name: "rating")
  double? get rating => throw _privateConstructorUsedError;
  @JsonKey(name: "photos")
  List<String>? get photo => throw _privateConstructorUsedError;
  @JsonKey(name: "description")
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: "publishDate")
  String? get publishDate => throw _privateConstructorUsedError;
  @JsonKey(name: "features")
  List<Features>? get features => throw _privateConstructorUsedError;

  /// Serializes this Product to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductCopyWith<Product> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductCopyWith<$Res> {
  factory $ProductCopyWith(Product value, $Res Function(Product) then) = _$ProductCopyWithImpl<$Res, Product>;
  @useResult
  $Res call(
      {@JsonKey(name: "name") String? name,
      @JsonKey(name: "price") int? price,
      @JsonKey(name: "category") String? category,
      @JsonKey(name: "rating") double? rating,
      @JsonKey(name: "photos") List<String>? photo,
      @JsonKey(name: "description") String? description,
      @JsonKey(name: "publishDate") String? publishDate,
      @JsonKey(name: "features") List<Features>? features});
}

/// @nodoc
class _$ProductCopyWithImpl<$Res, $Val extends Product> implements $ProductCopyWith<$Res> {
  _$ProductCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? price = freezed,
    Object? category = freezed,
    Object? rating = freezed,
    Object? photo = freezed,
    Object? description = freezed,
    Object? publishDate = freezed,
    Object? features = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      publishDate: freezed == publishDate
          ? _value.publishDate
          : publishDate // ignore: cast_nullable_to_non_nullable
              as String?,
      features: freezed == features
          ? _value.features
          : features // ignore: cast_nullable_to_non_nullable
              as List<Features>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductImplCopyWith<$Res> implements $ProductCopyWith<$Res> {
  factory _$$ProductImplCopyWith(_$ProductImpl value, $Res Function(_$ProductImpl) then) =
      __$$ProductImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "name") String? name,
      @JsonKey(name: "price") int? price,
      @JsonKey(name: "category") String? category,
      @JsonKey(name: "rating") double? rating,
      @JsonKey(name: "photos") List<String>? photo,
      @JsonKey(name: "description") String? description,
      @JsonKey(name: "publishDate") String? publishDate,
      @JsonKey(name: "features") List<Features>? features});
}

/// @nodoc
class __$$ProductImplCopyWithImpl<$Res> extends _$ProductCopyWithImpl<$Res, _$ProductImpl>
    implements _$$ProductImplCopyWith<$Res> {
  __$$ProductImplCopyWithImpl(_$ProductImpl _value, $Res Function(_$ProductImpl) _then) : super(_value, _then);

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? price = freezed,
    Object? category = freezed,
    Object? rating = freezed,
    Object? photo = freezed,
    Object? description = freezed,
    Object? publishDate = freezed,
    Object? features = freezed,
  }) {
    return _then(_$ProductImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
      photo: freezed == photo
          ? _value._photo
          : photo // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      publishDate: freezed == publishDate
          ? _value.publishDate
          : publishDate // ignore: cast_nullable_to_non_nullable
              as String?,
      features: freezed == features
          ? _value._features
          : features // ignore: cast_nullable_to_non_nullable
              as List<Features>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductImpl implements _Product {
  const _$ProductImpl(
      {@JsonKey(name: "name") this.name,
      @JsonKey(name: "price") this.price,
      @JsonKey(name: "category") this.category,
      @JsonKey(name: "rating") this.rating,
      @JsonKey(name: "photos") final List<String>? photo,
      @JsonKey(name: "description") this.description,
      @JsonKey(name: "publishDate") this.publishDate,
      @JsonKey(name: "features") final List<Features>? features})
      : _photo = photo,
        _features = features;

  factory _$ProductImpl.fromJson(Map<String, dynamic> json) => _$$ProductImplFromJson(json);

  @override
  @JsonKey(name: "name")
  final String? name;
  @override
  @JsonKey(name: "price")
  final int? price;
  @override
  @JsonKey(name: "category")
  final String? category;
  @override
  @JsonKey(name: "rating")
  final double? rating;
  final List<String>? _photo;
  @override
  @JsonKey(name: "photos")
  List<String>? get photo {
    final value = _photo;
    if (value == null) return null;
    if (_photo is EqualUnmodifiableListView) return _photo;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: "description")
  final String? description;
  @override
  @JsonKey(name: "publishDate")
  final String? publishDate;
  final List<Features>? _features;
  @override
  @JsonKey(name: "features")
  List<Features>? get features {
    final value = _features;
    if (value == null) return null;
    if (_features is EqualUnmodifiableListView) return _features;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Product(name: $name, price: $price, category: $category, rating: $rating, photo: $photo, description: $description, publishDate: $publishDate, features: $features)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.category, category) || other.category == category) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            const DeepCollectionEquality().equals(other._photo, _photo) &&
            (identical(other.description, description) || other.description == description) &&
            (identical(other.publishDate, publishDate) || other.publishDate == publishDate) &&
            const DeepCollectionEquality().equals(other._features, _features));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      price,
      category,
      rating,
      const DeepCollectionEquality().hash(_photo),
      description,
      publishDate,
      const DeepCollectionEquality().hash(_features));

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductImplCopyWith<_$ProductImpl> get copyWith => __$$ProductImplCopyWithImpl<_$ProductImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductImplToJson(
      this,
    );
  }
}

abstract class _Product implements Product {
  const factory _Product(
      {@JsonKey(name: "name") final String? name,
      @JsonKey(name: "price") final int? price,
      @JsonKey(name: "category") final String? category,
      @JsonKey(name: "rating") final double? rating,
      @JsonKey(name: "photos") final List<String>? photo,
      @JsonKey(name: "description") final String? description,
      @JsonKey(name: "publishDate") final String? publishDate,
      @JsonKey(name: "features") final List<Features>? features}) = _$ProductImpl;

  factory _Product.fromJson(Map<String, dynamic> json) = _$ProductImpl.fromJson;

  @override
  @JsonKey(name: "name")
  String? get name;
  @override
  @JsonKey(name: "price")
  int? get price;
  @override
  @JsonKey(name: "category")
  String? get category;
  @override
  @JsonKey(name: "rating")
  double? get rating;
  @override
  @JsonKey(name: "photos")
  List<String>? get photo;
  @override
  @JsonKey(name: "description")
  String? get description;
  @override
  @JsonKey(name: "publishDate")
  String? get publishDate;
  @override
  @JsonKey(name: "features")
  List<Features>? get features;

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductImplCopyWith<_$ProductImpl> get copyWith => throw _privateConstructorUsedError;
}
