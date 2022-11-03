import 'package:flame/game.dart';

import '../components/sprite/virtual_pet.dart';

class VirtualPetGame extends FlameGame {
  @override
  Future<void> onLoad() async {
    await super.onLoad();

    add(VirtualPet());
  }
}
