import 'package:flame/game.dart';
import 'package:virtual_pet/flame/components/health_bar/health_bar.dart';
import 'package:virtual_pet/flame/components/sprite/virtual_pet_state.dart';
import '../components/sprite/virtual_pet.dart';

class VirtualPetGame extends FlameGame {
  late VirtualPetState virtualPetState;

  VirtualPetGame() {
    virtualPetState = VirtualPetState();
  }

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    add(virtualPetState);
    add(VirtualPet(virtualPetState));
    add(HealthBar(virtualPetState));
  }
}
