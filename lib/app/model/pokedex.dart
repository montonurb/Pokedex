// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PokemonSimple {
  String name;
  String url;

  PokemonSimple({
    required this.name,
    required this.url,
  });

  PokemonSimple copyWith({
    String? name,
    String? url,
  }) {
    return PokemonSimple(
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'url': url,
    };
  }

  factory PokemonSimple.fromMap(Map<String, dynamic> map) {
    return PokemonSimple(
      name: map['name'] as String,
      url: map['url'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PokemonSimple.fromJson(String source) =>
      PokemonSimple.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'PokemonSimple(name: $name, url: $url)';

  @override
  bool operator ==(covariant PokemonSimple other) {
    if (identical(this, other)) return true;

    return other.name == name && other.url == url;
  }

  @override
  int get hashCode => name.hashCode ^ url.hashCode;
}
