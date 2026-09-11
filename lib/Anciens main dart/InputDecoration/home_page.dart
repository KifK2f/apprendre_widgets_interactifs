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
  final FocusNode _focus = FocusNode();
  final FocusNode _nextFocus = FocusNode();


  //Rabbatre le clavier lorsque l'on clique en dehors du champ de saisie
  void unfocusMethod1(){
    FocusScope.of(context).unfocus();
  }

  void unfocusMethod2(){
    FocusScope.of(context).requestFocus(FocusNode());
  }

  void unfocusMethod3(FocusNode focusNode){
    focusNode.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: InkWell(
        onTap: (){
            // unfocusMethod3(_focus);
            unfocusMethod1(); //Fermer le clavier quand on tape hors de la zone de saisie
            print("***Clique hors zone saisie Ok !");
        },
        child: Center(
          child: Column(
            children: [
              Text("Valeur saisie : $_simple"),
              Row(
                children: [
                  Expanded( //Expanded car on ve que la Row prenne le maximim de place
                      child: TextField(

                        textAlign: TextAlign.center, //Centrer le curseur de saisie
                        keyboardType: TextInputType.text, //Choisir le type de clavier
                        onSubmitted: (submittedString){
                          setState(() {
                            _simple = submittedString;
                          });
                        },
                        focusNode: _focus,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: (){
                              FocusScope.of(context).requestFocus(_nextFocus);
                            },
                            icon: const Icon(Icons.next_plan),
                          ),
                          suffixIconColor: Colors.pink
                        ),
                      ),
                  ),

                ],
              ),
              
              const SizedBox(height: 24),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  focusNode: _nextFocus,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50)
                    ),
                    icon: const Icon(Icons.person),
                    label: const Text("Nom de famille"),
                    hintText: "Entrer votre nom" //C'est une aide pour l'utilisateur
                  ),
                ),
              )
            ],
          ),
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