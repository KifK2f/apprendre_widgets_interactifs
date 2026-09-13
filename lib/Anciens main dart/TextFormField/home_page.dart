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
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _controller; //Tee de base au d au démarrage de l'application

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
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose(); //On le met avant le dispose pour que notre application ne génère pas trop de de mémoire
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        child: InkWell(
          onTap: (){
              // unfocusMethod3(_focus);
              unfocusMethod1(); //Fermer le clavier quand on tape hors de la zone de saisie
              print("***Clique hors zone saisie Ok !");
          },
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Text("Valeur saisie : $_simple"),
                  TextField(
        
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
        
                  const SizedBox(height: 24),
        
                  TextField(
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
        
                  const SizedBox(height: 24),
                  TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Vouyons si vous arrivez à me lire en appuyant sur ce bouton",
                    ),
                  ),
        
                  const SizedBox(height: 24),
                  ElevatedButton(
                      onPressed: (() {
                        setState(() {
                          unfocusMethod2(); //Afin de fermer le clavier en cliquant sur le boutoon "Révele le texte"
                        });
                      }),
                      child: const Text("Révèle le texte"),
                  ),
        
                  //Le controller va nous permetter de récupérer la valeur saisie lorsque l'on valide la saisie
                  Text(_controller.text),
                  Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            validator: (value){
                              if (value == null || value.isEmpty){
                                return "L'addresse mail ne peut pas être vide";
                              } else {
                                null;
                              }
                            },
                            decoration: const InputDecoration(
                              hintText: "Entrez votre addresse mail",
                              label: Text("Adresse mail"),
                            ),
                            keyboardType: TextInputType.emailAddress, //Pour que la clavier ait la touche @ déja là
                          ),
                          TextButton(
                              onPressed: (){
                                if (_formKey.currentState!.validate()) {
                                    unfocusMethod2();
                                } else {
                                    print("Nope");
                                }
                              }, 
                              child: const Text("Valider")
                          )
                        ],
                      ),
                  )
                ],
              ),
            )
          ),
        ),
      ),
    );
  }
}