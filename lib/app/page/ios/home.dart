import 'package:flutter/cupertino.dart';

class HomePageIos extends StatefulWidget {
  const HomePageIos({super.key});

  @override
  State<HomePageIos> createState() => _HomePageIosState();
}

class _HomePageIosState extends State<HomePageIos> {
  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Pokedex"),
      ),
      child: Center(
        child: Text("Teste"),
      ),
    );
  }
}
