import 'package:flame/extensions.dart';
import 'package:flame_test/flame_test.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:virtual_pet/flame/components/timers/level_timer.dart';
import 'package:virtual_pet/flame/game/virtual_pet_game.dart';

const double xSize = 100;
const double ySize = 100;

final virtualPetGameTest = FlameTester(
  VirtualPetGame.new,
  gameSize: Vector2(xSize, ySize),
);

void main() {
  group('level timer tests', () {
    TestWidgetsFlutterBinding.ensureInitialized();

    late LevelTimer levelTimer;

    setUp(() {
      levelTimer = LevelTimer();
    });

    virtualPetGameTest
      ..test('level not maxed, timer runs normally', (game) async {
        game.virtualPetData.level.value = 50;
        game.add(levelTimer);

        expect(levelTimer.levelIntervalTimer.isRunning(), true);
      })
      ..test('level maxed, timer is stopped', (game) async {
        game.virtualPetData.level.value = 100;
        game.add(levelTimer);

        levelTimer.update(1);

        expect(levelTimer.levelIntervalTimer.isRunning(), false);
      });
  });
}
