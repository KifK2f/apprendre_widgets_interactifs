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

  // Changer l'oganisation de notre colonne grace au bouton filled
  CrossAxisAlignment _alignment =  CrossAxisAlignment.center;

  _setToStart(){
    setState(() {
      _alignment = CrossAxisAlignment.start;
    });
  }

  _setToEnd(){
    setState(() {
      _alignment = CrossAxisAlignment.end;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Apprendre les intercatifs"),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      backgroundColor: _backgroundColor,
      body: Center( //On enleve const car on va ajouter quelque chose qui ne sera pas constant
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: _alignment,
          children: [

            Container(
              width: 220,
              height: 220,
              color: Colors.blue,
            ),

            const SizedBox(height: 20),

            const Text("Bonjour Flutter"),

            //Ce type de bouton n'a pas d'élevation
            // les .tonal prennent une couleur différentes de ceux simples
            FilledButton(
               onPressed: _setToStart,
                child: const Text("Start"),
            ),
             FilledButton.tonal(
                onPressed: _setToEnd,
                child: const Text("End")
            ),
            FilledButton.icon(
                onPressed: (){
                  setState(() {
                    _alignment = CrossAxisAlignment.center;
                  });
                },
                label: Wrap(
                  children: [
                    const Icon(Icons.restart_alt),
                    const Text("Center")
                  ],
                )
            ),


          ],
        ),
      ),
    );
  }
}