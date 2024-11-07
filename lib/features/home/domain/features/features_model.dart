import 'package:freezed_annotation/freezed_annotation.dart';

part 'features_model.freezed.dart';
part 'features_model.g.dart';

@freezed
class Features with _$Features {
  const factory Features({
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "description") String? description,
    @JsonKey(name: "photo") String? photo,
  }) = _Features;

  factory Features.fromJson(Map<String, dynamic> json) => _$FeaturesFromJson(json);
}
