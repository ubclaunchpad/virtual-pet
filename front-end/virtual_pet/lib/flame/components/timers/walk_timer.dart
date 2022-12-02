import 'package:flame/components.dart';
import 'package:virtual_pet/flame/game/virtual_pet_game.dart';

class WalkTimer extends Component with HasGameRef<VirtualPetGame> {
  late Timer walkIntervalTimer;

  WalkTimer() {
    walkIntervalTimer = Timer(
      1,
      onTick: () => gameRef.virtualPetData.walkCycle.value -= 1,
      repeat: true,
    );
  }

  @override
  void update(double dt) {
    if (gameRef.virtualPetData.walkCycle.value <= 0) {
      gameRef.virtualPetData.walkCycle.value = 16;
    } else {
      walkIntervalTimer.update(dt);
    }
  }
}
