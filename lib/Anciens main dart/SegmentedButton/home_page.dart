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

  // Set<int> _selection = {0};

  final List<Animal> _animals = [
    Animal("Chien", "🐕"),
    Animal("Chat", "🐈‍⬛"),
    Animal("Mouton", "🐑")
  ];

  //lat veut dire que ça sera initialisé plus tard
  late Set<Animal> _selection; //Car on a créé une class Animal cette fois ci

  @override
  void initState() {
    super.initState();
    _selection = {_animals[0]};
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          children: [
            // SegmentedButton(
            //     segments: [
            //         ButtonSegment<int>(
            //             value: 0,
            //             icon: const Text("🐝"),
            //             label: const Text("Abeille")
            //         ),
            //         ButtonSegment<int>(
            //             value: 1,
            //             icon: const Text("🐘"),
            //             label: const Text("Eléphant")
            //         ),
            //         ButtonSegment<int>(
            //             value: 2,
            //             icon: const Text("🐓"),
            //             label: const Text("Coq")
            //         ),
            //     ],
            //     onSelectionChanged: (newSet){
            //       setState(() {
            //           _selection = newSet;
            //       });
            //     },
            //     selected: _selection
            // ),
            SegmentedButton<Animal>(
                segments: _animals.map((animal) {
                  return ButtonSegment<Animal>(
                      value: animal,
                      label: Text(animal.name),
                      icon: Text(animal.icon)
                  );
                }).toList(),
                onSelectionChanged: (newSet){
                  setState(() {
                      _selection = newSet;
                  });
                },
                selected: _selection,
            ),

            Expanded(
                child: Center(
                  child: Text("Mon animal préféré est: \n ${_selection.first.icon} ${_selection.first.name}",
                    style: Theme.of(context).textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  ),
                ),
            )
          ],
        ),
      ),
    );
  }
}

class Animal{
  String name;
  String icon;

  Animal(this.name, this.icon);

}