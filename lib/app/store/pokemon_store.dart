import 'package:flutter/material.dart';
import 'package:pokedex/app/model/pokedex.dart';
import 'package:pokedex/app/service/service.dart';
import 'package:pokedex/app/state/pokemon_state.dart';

class PokemonStore extends ValueNotifier<PokemonState> {
  final PokedexService service;
  List<PokemonSimple> pokemons = [];

  PokemonStore(this.service) : super(EmptyPokemonState());

  buscarPokemons() async {
    try {
      value = LoadingPokemonState();
      final pokemonsList = await service.buscarDados();

      for (var pokemon in pokemonsList) {
        pokemons.add(pokemon);
        notifyListeners();
      }
      value = SuccessPokemonState(pokemons);
    } catch (error) {
      value = ErrorPokemonState(error: error.toString());
    }
  }
}
