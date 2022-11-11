import 'package:flame/extensions.dart';
import 'package:flame_test/flame_test.dart';
import 'package:virtual_pet/flame/components/timers/health_timer.dart';
import 'package:virtual_pet/flame/game/vitural_pet_game.dart';

import 'package:flutter_test/flutter_test.dart';

const double xSize = 100;
const double ySize = 100;

final virtualPetGameTest = FlameTester(
  VirtualPetGame.new,
  gameSize: Vector2(xSize, ySize),
);

void main() {
  group('health timer tests', () {
    TestWidgetsFlutterBinding.ensureInitialized();

    late HealthTimer healthTimer;

    setUp(() {
      healthTimer = HealthTimer();
    });

    virtualPetGameTest
      ..test('health full, timer runs normally', (game) async {
        game.virtualPetData.health.value = 100;
        game.add(healthTimer);

        expect(healthTimer.healthIntervalTimer.isRunning(), true);
      })
      ..test('health empty, timer is stopped', (game) async {
        game.virtualPetData.health.value = 0;
        game.add(healthTimer);

        healthTimer.update(1);

        expect(healthTimer.healthIntervalTimer.isRunning(), false);
      });
  });
}
