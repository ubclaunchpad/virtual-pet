import 'package:flame/components.dart';
import 'package:virtual_pet/flame/game/vitural_pet_game.dart';

class HealthTimer extends Component with HasGameRef<VirtualPetGame> {
  late Timer healthIntervalTimer;

  HealthTimer() {
    healthIntervalTimer = Timer(
      1,
      onTick: () => gameRef.virtualPetData.health.value -= 1,
      repeat: true,
    );
  }

  @override
  void update(double dt) {
    if (gameRef.virtualPetData.health.value <= 0) {
      healthIntervalTimer.stop();
    } else {
      healthIntervalTimer.update(dt);
    }
  }
}
