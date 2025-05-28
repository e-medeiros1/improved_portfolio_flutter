import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'portfolio/home/homePage.dart';
import 'portfolio/utils/theme_provider.dart';

void main() => runApp(
      ChangeNotifierProvider(
        create: (_) => ThemeProvider(),
        child: const MyPortfolioApp(),
      ),
    );

class MyPortfolioApp extends StatelessWidget {
  const MyPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          title: "Medeiros's Portfolio",
          theme: themeProvider.currentTheme,
          home: const HomePage(),
        );
      },
    );
  }
}
