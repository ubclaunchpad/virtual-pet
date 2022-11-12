import 'package:flame/components.dart';
import 'package:virtual_pet/flame/game/virtual_pet_game.dart';

class LevelTimer extends Component with HasGameRef<VirtualPetGame> {
  late Timer levelIntervalTimer;

  LevelTimer() : super() {
    levelIntervalTimer = Timer(
      1,
      onTick: () => gameRef.virtualPetData.level.value += 1,
      repeat: true,
    );
  }

  @override
  void update(double dt) {
    if (gameRef.virtualPetData.level.value >= 100) {
      levelIntervalTimer.stop();
    } else {
      levelIntervalTimer.update(dt);
    }
  }
}
