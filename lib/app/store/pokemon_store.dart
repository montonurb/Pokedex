import 'package:flutter/material.dart';
import 'package:pokedex/app/model/pokemon_model.dart';
import 'package:pokedex/app/service/service.dart';
import 'package:pokedex/app/state/pokemon_state.dart';

class PokemonStore extends ValueNotifier<PokemonState> {
  final PokedexService service;
  List<PokemonModel> pokemons = [];
  String urlImagem = "";

  PokemonStore(this.service) : super(EmptyPokemonState());

  buscarPokemons() async {
    try {
      value = LoadingPokemonState();
      var pokemonsList = await service.buscarDados();
      for (var pokemon in pokemonsList) {
        pokemons.add(pokemon);
        notifyListeners();
      }
      value = SuccessPokemonState(pokemons);
    } catch (error) {
      print("ERRO! $error");
      value = ErrorPokemonState(error: error.toString());
    }
  }
}
