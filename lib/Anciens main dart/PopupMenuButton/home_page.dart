import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  final String title;

  const HomePage({super.key, required this.title});

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }

}

// Créer l'état de Homepage pour lui permettre de muter
// State est une clase générique
class _HomePageState extends State<HomePage>{

  List<String> values = ["Chat", "Chien", "Renard"];
  String _selected = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          PopupMenuButton<String>(
            // icon: const Icon(Icons.settings),
            onSelected: (newValue) {
              setState(() {
                _selected = newValue;
              });
            },
              itemBuilder: (context) {
                return values.map((animal){
                  return PopupMenuItem<String>(
                      value: animal,
                      child: Text(animal),
                  );
                }).toList();
              }
          ),
        ],
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
            child: Text(_selected),
      ),
    );
  }
}