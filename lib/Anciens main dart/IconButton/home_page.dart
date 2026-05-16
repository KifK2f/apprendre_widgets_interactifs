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

  double _iconsize1 = 16;
  double _iconsize2 = 10;

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

            IconButton(
                onPressed: (){
                  setState(() {
                    //Avoir un nombre alétaoire en tre 0 et 250
                    _iconsize1 = Random().nextInt(150).toDouble();
                  });
                },
                icon: Icon(
                    Icons.add,
                    size: _iconsize1
                ),
            ),

            IconButton.filled(
                onPressed: (){
                  setState(() {
                    //Avoir un nombre alétaoire en tre 0 et 250
                    _iconsize2 = Random().nextInt(250).toDouble();
                  });
                },
                icon: Icon(
                    Icons.add,
                    size: _iconsize2
                ),
            ),

          ],
        ),
      ),
    );
  }
}