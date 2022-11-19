import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:virtual_pet/flame/components/actors/virtual_pet.dart';
import 'package:virtual_pet/flame/components/actors/virtual_pet_data.dart';
import 'package:virtual_pet/flame/components/hud/health_bar.dart';
import 'package:virtual_pet/flame/components/hud/level_bar.dart';
import 'package:virtual_pet/flame/components/timers/health_timer.dart';
import 'package:virtual_pet/flame/components/timers/level_timer.dart';

class VirtualPetGame extends FlameGame {
  final VirtualPetData virtualPetData = VirtualPetData();

  @override
  Color backgroundColor() => const Color.fromARGB(255, 200, 228, 185);

  @override
  Future<void> onLoad() async {
    add(HealthTimer());
    add(HealthBar());

    add(LevelTimer());
    add(LevelBar());

    add(VirtualPet());

    return super.onLoad();
  }
}
