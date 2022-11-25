import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:virtual_pet/flame/layers/virtual_pet_game_layer.dart';
import 'package:virtual_pet/pages/home.dart';
import 'package:virtual_pet/themes/theme_data.dart';

import 'flame/game/virtual_pet_game.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Flame.device.setPortrait();
  runApp(InheritedVirtualPetGameWrapper(
    virtualPetGame: VirtualPetGame(), 
    child: const VirtualPetApp()
  ));
}

/// the main app
class VirtualPetApp extends StatelessWidget {
  const VirtualPetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Home(),
      theme: themeData,
    );
  }
}
