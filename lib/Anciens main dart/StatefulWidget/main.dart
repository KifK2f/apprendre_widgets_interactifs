import 'package:apprendre_widgets_interactifs/home_page.dart';
import 'package:flutter/material.dart';

//Un StatefulWidget est un widget avec un état mutable.
// Il peut changer au fil du temps en réponse aux interactions de l'utilisateur
// ou aux événements.
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const HomePage(title: 'Les widgets Flutter intercatifs'),
    );
  }
}
