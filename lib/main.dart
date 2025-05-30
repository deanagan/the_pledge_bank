import 'package:flutter/material.dart';
import 'home_screen.dart';

void main() {
  runApp(ThePledgeBankApp());
}

class ThePledgeBankApp extends StatelessWidget {
  const ThePledgeBankApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Pledge Bank',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        scaffoldBackgroundColor: Colors.yellow[100],
      ),
      home: HomeScreen(),
    );
  }
}
