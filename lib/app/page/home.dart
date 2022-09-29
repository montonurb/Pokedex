import 'package:flutter/material.dart';
import 'package:pokedex/app/model/pokemon_model.dart';
import 'package:pokedex/app/service/service.dart';
import 'package:pokedex/app/state/pokemon_state.dart';
import 'package:pokedex/app/store/pokemon_store.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final pokemonStore = PokemonStore(PokedexService());

  @override
  void initState() {
    pokemonStore.buscarPokemons();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pokedex".toUpperCase()),
        centerTitle: true,
      ),
      body: ValueListenableBuilder<PokemonState>(
        valueListenable: pokemonStore,
        builder: (context, state, child) {
          if (state is LoadingPokemonState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is SuccessPokemonState) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 300,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                ),
                itemBuilder: (context, index) {
                  PokemonModel pokemon = pokemonStore.pokemons[index];
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network(pokemon.img),
                          Text(pokemon.name.toUpperCase()),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          } else if (state is EmptyPokemonState) {
            return const Center(
              child: Text("Nenhum pokemon encontrado!"),
            );
          } else {
            return const Center(
              child: Text("Ocorreu algum erro!"),
            );
          }
        },
      ),
    );
  }
}
