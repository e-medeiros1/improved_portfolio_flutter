import 'package:flutter/material.dart';

import 'portfolio/home/homePage.dart';

void main() => runApp(const MyPortfolioApp());

class MyPortfolioApp extends StatelessWidget {
  const MyPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'John’s Portfolio',
      theme: ThemeData(
        fontFamily: 'Heebo',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
