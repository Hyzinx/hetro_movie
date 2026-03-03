import 'package:flutter/material.dart';
import 'package:hetro_anime/presentation/screens/home_screen.dart';
import 'package:hetro_anime/presentation/themes/main_theme.dart';

void main() {
  runApp(HetroAnime());
}

class HetroAnime extends StatelessWidget {
  const HetroAnime({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: mainTheme,
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
