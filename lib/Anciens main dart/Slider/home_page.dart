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

  bool isOn = true;
  double min = 0;
  double max = 100;
  double current = 33;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.white, // Fond blanc pur pour le Sacafold
        appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      backgroundColor: isOn ? Colors.white : Colors.black45,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    "Couleur de background: ${isOn ? 'Light' : "Dark"}",
                    style: TextStyle(
                      color: isOn ? Colors.black45 : Colors.white
                    ),
                ),
                Switch(
                    value: isOn,
                    onChanged: (newBool){
                      setState(() {
                        isOn = newBool;
                      });
                    },
                  //Couleur pour le bouton actif ou inactif
                  activeThumbColor: Colors.redAccent,
                  inactiveThumbColor: Colors.orangeAccent,
                  inactiveTrackColor: Colors.lightGreenAccent,
                  activeTrackColor: Colors.yellow,
                )
              ],
            ),
            Row(
              children: [
                Text(min.toString()),
                Expanded(
                    child: Slider(
                      min: min,
                      max: max,
                      value: current,
                      onChanged: (newValue){
                        setState(() {
                          current = newValue;
                        });
                      },
                      divisions: 5, //On divise en 5 parties égales ==> On ne pourra choisir que 0; 20; 40 ; 60 ;  80 ; 100 jamais une valeur entre
                      activeColor: Colors.pink,
                      inactiveColor: Colors.black12,
                    )
                ),
                Text(max.toString()),
              ],
            ),
            // Text("Valeur du slider = $current")
            Text("Valeur du slider = ${current.toInt()}") //.toInt() pour avoir des nombre entier
          ],
        ),
      )
    );
  }
}