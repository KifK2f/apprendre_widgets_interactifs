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

  DateTime? _datePicked = DateTime.now(); //Sélectionn ela date d'aujourd'hu par défaut au démarrage de l'app
  TimeOfDay? _timePicked = TimeOfDay.now();

  Future<void> _pickDate() async { //car on va atendre que l'utilisateur choisissse la date
    final newDate = await showDatePicker(
        context: context,
        firstDate: DateTime(1980), //Date de début ==> on ne peut pas choisir une date dont l'année est inféreure à 1980
        lastDate: DateTime(2222) , //Date de fin ==> on ne peut pas choisir une date dont l'année est supéreire à 2222
        currentDate: _datePicked, //Pour que ça me donne  la date séletctionné
      // initialEntryMode: DatePickerEntryMode.input
      // initialEntryMode: DatePickerEntryMode.inputOnly
      // initialEntryMode: DatePickerEntryMode.calendarOnly
      // initialEntryMode: DatePickerEntryMode.calendar

    );
    if (newDate != null && newDate != _datePicked){
      setState(() {
        _datePicked = newDate;
      });
    }
  }

  Future<void> _pickTime() async {
    //car on va atendre que l'utilisateur choisissse l'heure
    final newTime = await showTimePicker(
        context: context,
        initialTime: _timePicked ?? TimeOfDay.now(),
      initialEntryMode: TimePickerEntryMode.input //Le time picker a 2 facon de s eprésenter le mode input siginfie que on saisie les valer à la main
    );
    if (newTime != null && newTime != _timePicked){
      setState(() {
        _timePicked = newTime;
      });
    }
  }

  String readableDate(DateTime? date){
    if (date == null){
      return "Aucune date n'a été choisié";
    } else {
      final year = date.year;
      final month = date.month;
      final day = date.day;
      return "La date choisie est : $day/$month/$year";
    }
  }

  String readable(){
    final hour = _timePicked?.hour;
    final minutes = _timePicked?.minute;
    return "$hour:$minutes";
  }

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(readableDate(_datePicked)),
            TextButton(
                onPressed: _pickDate,
                child: const Text("Modifier la date")
            ),
            // Text(_timePicked?.toString() ?? "Aucune date"),
            Text(readable()),
            TextButton(
                onPressed: _pickTime,
                child: const Text("Modifier l'heure")
            )
          ],
        )
      ),
    );
  }
}
