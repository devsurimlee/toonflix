import 'package:flutter/material.dart';
import 'package:toonflix/screen/HomeScreen.dart';
import 'package:toonflix/services/api_service.dart';

void main() {
  ApiService().getTodaysWebtoons;
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
