import 'package:flutter/material.dart';
import 'package:global_fitness_app/ui/bmi_screen.dart';
import 'package:global_fitness_app/ui/introscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Global Fitness',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      routes: {
        '/' :(context) => IntroScreen(),
        '/bmi' : (context) => BMIScreen(),
      },
      initialRoute: '/',
    );
  }
}

