import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:virtual_pet/inherited_widgets/inherited_virtual_pet_game_wrapper.dart';
import 'package:virtual_pet/pages/home.dart';
import 'package:virtual_pet/themes/theme_data.dart';

import 'flame/game/virtual_pet_game.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Flame.device.setPortrait();
  runApp(InheritedVirtualPetGameWrapper(
    virtualPetGame: VirtualPetGame(), 
    child: const VirtalPetApp()
  ));
}

/// the main app
class VirtalPetApp extends StatelessWidget {
  const VirtalPetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Home(),
      theme: themeData,
    );
  }
}
