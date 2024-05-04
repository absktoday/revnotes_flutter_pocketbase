import 'package:flutter/material.dart';
import 'package:revnotes_flutter_pocketbase/src/config/go_router_config.dart';
import 'package:revnotes_flutter_pocketbase/src/config/theme_config.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'RevNotes',
      theme: ThemeConfig.lightTheme(context),
      darkTheme: ThemeConfig.dartTheme(context),
      routerConfig: GoRouterConfig.router,
    );
  }
}
