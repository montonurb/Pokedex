import 'package:flutter/material.dart';

class HomePageAndroid extends StatefulWidget {
  const HomePageAndroid({super.key});

  @override
  State<HomePageAndroid> createState() => _HomePageAndroidState();
}

class _HomePageAndroidState extends State<HomePageAndroid> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pokedex"),
        centerTitle: true,
      ),
    );
  }
}
