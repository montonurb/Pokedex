import 'package:pokedex/app/model/pokedex.dart';

abstract class PokemonState {
  const PokemonState();
}

class EmptyPokemonState extends PokemonState {}

class LoadingPokemonState extends PokemonState {}

class SuccessPokemonState extends PokemonState {
  final List<PokemonSimple> pokemons;
  SuccessPokemonState(this.pokemons);
}

class ErrorPokemonState extends PokemonState {
  final String error;
  ErrorPokemonState({required this.error});
}
