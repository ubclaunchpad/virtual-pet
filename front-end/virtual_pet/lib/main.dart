import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:virtual_pet/pages/home.dart';
import 'package:virtual_pet/themes/theme_data.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Flame.device.setPortrait();
  runApp(MaterialApp(
    home: const MyApp(),
    theme: themeData,
  ));
}

/// the main app
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Home(),
      theme: themeData,
    );
  }
}
