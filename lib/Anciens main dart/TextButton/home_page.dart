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

  //Appui court : Si l'arrière plan n'est en blanc alors on passe au noir
  _updateBackground(){
    setState(() {
      _backgroundColor = (_backgroundColor == Colors.white)
          ? Colors.black54
          : Colors.white;
    });
  }
  //Appui long : Si l'arrière plan n'est en blanc alors on passe au deepOrangeAccent
  _updateLongPressed(){
    setState(() {
      _backgroundColor = (_backgroundColor == Colors.white)
          ? Colors.deepOrangeAccent
          : Colors.white;
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
      backgroundColor: _backgroundColor,
      body: Center( //On enleve const car on va ajouter quelque chose qui ne sera pas constant
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           TextButton(
                onPressed: _updateBackground,
               // onPressed: (){
               //   setState(() {
               //     backgroundColor = (backgroundColor == Colors.white)
               //         ? Colors.black54
               //         : Colors.white;
               //   });
               // },
               onLongPress: _updateLongPressed,
               child: const Text("TextButton")
           ) ,
            TextButton.icon(
               onPressed: (){
                 setState(() {
                   _backgroundColor = (_backgroundColor == Colors.green)
                       ? Colors.yellow
                       : Colors.green;
                 });
               },
               label: const Icon(Icons.palette)
           )
          ],
        ),
      ),
    );
  }
}