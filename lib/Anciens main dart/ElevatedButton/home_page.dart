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

  // _ underscore our dire que l'attribut est en private
  Color _backgroundColor = Colors.white;

  //Liste de titre possoible
  List<String> _titles = [
    "Apprendre les interactifs",
    "I love Flutter",
    "Eat, Sleep, Code, Repeat"
  ];

  int _titleIndex = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_titleIndex]),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      backgroundColor: _backgroundColor,
      body: Center( //On enleve const car on va ajouter quelque chose qui ne sera pas constant
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: (){
                  setState(() {
                    int newRandomTitle = Random().nextInt(_titles.length);
                    _titleIndex = newRandomTitle;
                  });
                },
                // style: ButtonStyle(
                //   backgroundColor: WidgetStatePropertyAll<Color>(Colors.lightGreenAccent),
                //   textStyle: WidgetStatePropertyAll<TextStyle>(TextStyle (fontSize: 45))
                // ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                  foregroundColor: Colors.white
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.edit),
                    Text("Changer le titre")
                  ],
                )
            )
          ],
        ),
      ),
    );
  }
}