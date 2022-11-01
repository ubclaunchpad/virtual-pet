import 'package:flame/game.dart';

import '../components/virtual_pet.dart';

enum VirtualPetState {
  idle,
  walk,
}

class VirtualPetGame extends FlameGame {
  @override
  Future<void> onLoad() async {
    await super.onLoad();

    add(VirtualPet());
  }
}
