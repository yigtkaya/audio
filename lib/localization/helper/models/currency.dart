part of 'language.dart';

@immutable
class Currency {
  const Currency({
    required this.code,
    required this.name,
    required this.shortName,
    required this.symbol,
  });

  factory Currency.fromJson(String source) => Currency.fromMap(json.decode(source) as Map<String, dynamic>);

  factory Currency.fromMap(Map<String, dynamic> map) {
    return Currency(
      code: map['code'] as int,
      name: map['name'] as String,
      shortName: map['shortName'] as String,
      symbol: map['symbol'] as String,
    );
  }
  final int code;
  final String name;
  final String shortName;
  final String symbol;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'code': code,
      'name': name,
      'shortName': shortName,
      'symbol': symbol,
    };
  }

  String toJson() => json.encode(toMap());

  Currency copyWith({
    int? code,
    String? name,
    String? shortName,
    String? symbol,
  }) {
    return Currency(
      code: code ?? this.code,
      name: name ?? this.name,
      shortName: shortName ?? this.shortName,
      symbol: symbol ?? this.symbol,
    );
  }

  @override
  String toString() {
    return 'Currency(code: $code, name: $name, shortName: $shortName, symbol: $symbol)';
  }

  @override
  bool operator ==(covariant Currency other) {
    if (identical(this, other)) {
      return true;
    }

    return other.code == code && other.name == name && other.shortName == shortName && other.symbol == symbol;
  }

  @override
  int get hashCode {
    return code.hashCode ^ name.hashCode ^ shortName.hashCode ^ symbol.hashCode;
  }
}
