import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:virtual_pet/flame/game/virtual_pet_game.dart';

class VirtualPetGameLayer extends StatelessWidget {
  const VirtualPetGameLayer({super.key});

  @override
  Widget build(BuildContext context) {
    return GameWidget(game: VirtualPetGame());
  }
}
