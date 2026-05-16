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

  int _count = 0;

  _updateCount(){
    setState(() {
      _count++;
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
          children: [

            OutlinedButton(
                onPressed: _updateCount,
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                    width: 3.6,
                    color: Colors.redAccent,
                    style: BorderStyle.solid,
                  )
                ),
                child: Text("J'ai appuyé le bouton $_count fois")
            ),

          ],
        ),
      ),
    );
  }
}