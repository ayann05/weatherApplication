import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weatherapp/splash_screen/splash_screen.dart';

void main() {
  runApp(weatherapp());
}

class weatherapp extends StatefulWidget {
  const weatherapp({super.key});

  @override
  State<weatherapp> createState() => _weatherappState();
}

class _weatherappState extends State<weatherapp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryTextTheme: GoogleFonts.nunitoTextTheme(),
      ),
      routes: {
        '/': (context) => const splash(),
      },
    );
  }
}
