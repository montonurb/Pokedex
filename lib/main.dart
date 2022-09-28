import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const Pokedex());
}

class Pokedex extends StatefulWidget {
  const Pokedex({super.key});

  @override
  State<Pokedex> createState() => _PokedexState();
}

class _PokedexState extends State<Pokedex> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
