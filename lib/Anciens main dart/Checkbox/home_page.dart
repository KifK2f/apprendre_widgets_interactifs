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

  RugbyClub? rugbyClub;

  Map<String, bool> groceries = {
    "Banane" : false,
    "Oeufs" :  false,
    "Pates" : false,
    "Beurre" : false,
    "Poulet" : false,
    "Mayonnaise" : false,
    "Quinoa" : false,
    "Céréales" : false,
    "Café" : false,
    "Ail" : false,
    "Persil" : false,
    "Courgettes" : false
  };

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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: groceries.keys.map((key){
            return CheckboxListTile(
                title: Text(key),
                subtitle: Text(groceries[key]! ? "Dans le panier" : " A acheter"),
                value: groceries[key],
                onChanged: (b){
                  setState(() {
                    groceries[key] = b ?? false;
                  });
                }
            );
          }).toList(),
        ),
      )
    );
  }
}

enum RugbyClub {
  Toulon, Toulouse, Biarritz, Bayonne, Racing, Clermont;
}