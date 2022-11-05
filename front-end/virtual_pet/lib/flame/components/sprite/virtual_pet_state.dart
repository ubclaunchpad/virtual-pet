import 'package:flame/components.dart';

const int initialHealth = 5;
const int deathHealth = 0;
const int initialLevel = 0;

class VirtualPetState extends Component with HasGameRef {
  int health = initialHealth;
  int level = initialLevel;

  late Timer healthIntervalTimer;
  late Timer levelIntervalTimer;

  VirtualPetState() {
    healthIntervalTimer = Timer(
      1,
      onTick: () => health -= 1,
      repeat: true,
    );
    levelIntervalTimer = Timer(
      1,
      onTick: () => level += 1,
      repeat: true,
    );
  }

  int getHealth() {
    return health;
  }

  @override
  void update(double dt) {
    if (health > deathHealth) {
      healthIntervalTimer.update(dt);
      levelIntervalTimer.update(dt);
    }
  }
}
