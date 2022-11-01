import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:virtual_pet/flame/game/vitural_pet_game.dart';

class VirutalPetGameLayer extends StatelessWidget {
  const VirutalPetGameLayer({super.key});

  @override
  Widget build(BuildContext context) {
    return GameWidget(game: VirtualPetGame());
  }
}
