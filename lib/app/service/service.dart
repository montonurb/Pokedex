// ignore_for_file: avoid_print
import 'package:dio/dio.dart';
import 'package:pokedex/app/model/pokedex.dart';

class PokedexService {
  Future<List<PokemonSimple>> buscarDados() async {
    var response = await Dio().get('https://pokeapi.co/api/v2/pokemon');

    final data = response.data['results'] as List;
    final pokemons = data
        .map((e) => PokemonSimple(
              name: e['name'],
              url: e['url'],
            ))
        .toList();

    print("1: $pokemons");
    return pokemons;
  }
}
