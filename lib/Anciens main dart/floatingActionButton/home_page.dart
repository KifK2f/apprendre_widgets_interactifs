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

  int _counter =0;

  void _onButtonPressed(){
    // print("Appuyé !");
    // _counter++;

    // setState est une fonction qu iva dire à notre Framework que l'état de ce objet a changé afin qu'il le prenne en compte
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      // body: const Center(
      body: Center( //On enleve const car on va ajouter quelque chose qui ne sera pas constant
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                "Vous avez appuyé sur le bouton",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
                "$_counter fois",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 34
                ),
            )
          ],
        ),
      ),
      // floatingActionButton
      // floatingActionButton: FloatingActionButton(
      //   // onPressed: null,
      //   onPressed: _onButtonPressed,
      //   tooltip: "Incrémenter le compteur", // tooltip : Le texte qui apparaît lorsque l'utilisateur maintient le doigt sur le bouton
      //   child: const Icon(Icons.add),
      // ),

      // //floatingActionButton.extended
      // floatingActionButton: FloatingActionButton.extended(
      //   // onPressed: null,
      //   onPressed: _onButtonPressed,
      //   tooltip: "Incrémenter le compteur", //tooltip est de type String
      //   label: const Text("Appuyéez moi !"), // label est de type Widget donc doit prendre un widget comme valeur
      //   icon: const Icon(Icons.add),
      //   backgroundColor: Colors.lightBlue,
      //   foregroundColor: Colors.red,
      //   elevation: 0,
      // ),

      // //floatingActionButton.large
      // floatingActionButton: FloatingActionButton.large(
      //   // onPressed: null,
      //   onPressed: _onButtonPressed,
      //   tooltip: "Incrémenter le compteur", //tooltip est de type String
      //   backgroundColor: Colors.lightBlue,
      //   foregroundColor: Colors.red,
      //   elevation: 0,
      //   child: const Icon(Icons.add),
      // ),

      //floatingActionButton.small
      floatingActionButton: FloatingActionButton.small(
        // onPressed: null,
        onPressed: _onButtonPressed,
        tooltip: "Incrémenter le compteur", //tooltip est de type String
        backgroundColor: Colors.lightBlue,
        foregroundColor: Colors.red,
        elevation: 0,
        child: const Icon(Icons.add),
      ),

      
      //Changer la osition de n'importe quelle FloatingActin Button que ce soit simple, extendes, large ou small
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,

    );
  }
}