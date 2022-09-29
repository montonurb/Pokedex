import 'package:flutter/material.dart';
import 'package:pokedex/app/model/pokedex.dart';
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
            return ListView.builder(
              itemBuilder: (context, index) {
                PokemonSimple pokemon = pokemonStore.pokemons[index];
                return Card(
                  child: Column(
                    children: [
                      GestureDetector(
                        child: ListTile(
                          leading: Icon(Icons.map),
                          title: Text("${pokemon.name}"),
                        ),
                      ),
                    ],
                  ),
                );
              },
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
