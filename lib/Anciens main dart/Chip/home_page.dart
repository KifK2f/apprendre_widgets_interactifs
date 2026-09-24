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

  List<User> users = [
    User("Gérard", Colors.brown),
    User("Marie", Colors.purple),
    User("Stéphane", Colors.blue),
    User("Johnny", Colors.red),
    User("Friedo", Colors.green),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.white, // Fond blanc pur pour le Sacafold
        appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Wrap(
          children: users.map((user) {
            return Chip(
              label: Text(user.name),
              avatar: CircleAvatar(
                backgroundColor: user.color,
                child: Text(user.name[0]),
              ),
              onDeleted: (){
                setState(() {
                  users.remove(user);
                });
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}

class User {
  String name;
  Color color;

  User(this.name, this.color);

}