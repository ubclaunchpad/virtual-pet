import 'package:flame/game.dart';
import 'package:virtual_pet/flame/components/actors/virtual_pet.dart';
import 'package:virtual_pet/flame/components/health_bar/health_bar.dart';
import 'package:virtual_pet/flame/components/timers/health_timer.dart';

import '../components/actors/virtual_pet_data.dart';

class VirtualPetGame extends FlameGame {
  final VirtualPetData virtualPetData = VirtualPetData();

  @override
  Future<void> onLoad() async {
    add(HealthTimer());
    add(HealthBar());

    add(VirtualPet());

    return super.onLoad();
  }
}
