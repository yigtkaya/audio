// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductImpl _$$ProductImplFromJson(Map<String, dynamic> json) => _$ProductImpl(
      name: json['name'] as String?,
      price: (json['price'] as num?)?.toInt(),
      category: json['category'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
      photo: (json['photos'] as List<dynamic>?)?.map((e) => e as String).toList(),
      description: json['description'] as String?,
      publishDate: json['publishDate'] as String?,
      features: (json['features'] as List<dynamic>?)?.map((e) => Features.fromJson(e as Map<String, dynamic>)).toList(),
    );

Map<String, dynamic> _$$ProductImplToJson(_$ProductImpl instance) => <String, dynamic>{
      'name': instance.name,
      'price': instance.price,
      'category': instance.category,
      'rating': instance.rating,
      'photos': instance.photo,
      'description': instance.description,
      'publishDate': instance.publishDate,
      'features': instance.features,
    };
