import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:revnotes_flutter_pocketbase/src/config/go_router_config.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'RevNotes',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blue, brightness: Brightness.dark),
        useMaterial3: true,
        textTheme: GoogleFonts.figtreeTextTheme(
          Theme.of(context).primaryTextTheme,
        ),
      ),
      routerConfig: GoRouterConfig.router,
    );
  }
}
