import 'package:flutter/material.dart';
import 'package:revnotes_flutter_pocketbase/src/landing.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RevNotes',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.brown, brightness: Brightness.dark),
        useMaterial3: true,
        // textTheme: GoogleFonts.interTextTheme(TextTheme(

        // )),
      ),
      home: const Landing(),
    );
  }
}
