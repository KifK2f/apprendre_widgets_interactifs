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

  String _simple = "";

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
            Text("Valeur saisie : $_simple"),
            TextField(

              textAlign: TextAlign.center, //Centrer le champ de saisie
              // keyboardType: TextInputType.phone, //Choisir le type de clavier
              // keyboardType: TextInputType.number, //Choisir le type de clavier
              keyboardType: TextInputType.text, //Choisir le type de clavier

              obscureText: true,
              obscuringCharacter: "+", //Caractère à afficher à la place du point

              //Onchanged va affiher la valeurs en temps réels
              // onChanged: (newString){
              //   setState(() {
              //     _simple = newString;
              //     print('Vous avez saisi');
              //   });
              // },

              //onSubmitted va affiher la valeurs qu'après le submit ou cliqé sur le bouton envoyer
              onSubmitted: (submittedString){
                setState(() {
                  _simple = submittedString;
                });
              },


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