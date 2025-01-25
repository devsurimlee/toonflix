import 'package:flutter/material.dart';
import 'package:toonflix/screen/HomeScreen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
