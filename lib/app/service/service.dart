import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:pokedex/app/model/pokemon_model.dart';

class PokedexService {
  Future<List<PokemonModel>> buscarDados() async {
    var response = await Dio().get(
        'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json');
    final json = jsonDecode(response.data) as Map<String, dynamic>;
    List list = json["pokemon"];

    return list
        .map((e) => PokemonModel(
              id: e['id'],
              num: e['num'],
              name: e['name'],
              img: e['img'],
              height: e['height'],
              weight: e['weight'],
              candy: e['candy'],
              egg: e['egg'],
            ))
        .toList();
  }
}
