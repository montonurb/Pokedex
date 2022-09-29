// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PokemonModel {
  int id;
  String num;
  String name;
  String img;
  String height;
  String weight;
  String candy;
  String egg;

  PokemonModel({
    required this.id,
    required this.num,
    required this.name,
    required this.img,
    required this.height,
    required this.weight,
    required this.candy,
    required this.egg,
  });

  PokemonModel copyWith({
    int? id,
    String? num,
    String? name,
    String? img,
    String? height,
    String? weight,
    String? candy,
    String? egg,
  }) {
    return PokemonModel(
      id: id ?? this.id,
      num: num ?? this.num,
      name: name ?? this.name,
      img: img ?? this.img,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      candy: candy ?? this.candy,
      egg: egg ?? this.egg,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'num': num,
      'name': name,
      'img': img,
      'height': height,
      'weight': weight,
      'candy': candy,
      'egg': egg,
    };
  }

  factory PokemonModel.fromMap(Map<String, dynamic> map) {
    return PokemonModel(
      id: map['id'] as int,
      num: map['num'] as String,
      name: map['name'] as String,
      img: map['img'] as String,
      height: map['height'] as String,
      weight: map['weight'] as String,
      candy: map['candy'] as String,
      egg: map['egg'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PokemonModel.fromJson(String source) =>
      PokemonModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PokemonModel(id: $id, num: $num, name: $name, img: $img, height: $height, weight: $weight, candy: $candy, egg: $egg)';
  }

  @override
  bool operator ==(covariant PokemonModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.num == num &&
        other.name == name &&
        other.img == img &&
        other.height == height &&
        other.weight == weight &&
        other.candy == candy &&
        other.egg == egg;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        num.hashCode ^
        name.hashCode ^
        img.hashCode ^
        height.hashCode ^
        weight.hashCode ^
        candy.hashCode ^
        egg.hashCode;
  }
}
