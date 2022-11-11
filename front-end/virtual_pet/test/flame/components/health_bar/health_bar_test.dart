import 'package:flame/extensions.dart';
import 'package:flame_test/flame_test.dart';
import 'package:virtual_pet/flame/components/health_bar/health_bar.dart';
import 'package:virtual_pet/flame/game/vitural_pet_game.dart';

import 'package:flutter_test/flutter_test.dart';

const double xSize = 100;
const double ySize = 100;

final virtualPetGameTest = FlameTester(
  VirtualPetGame.new,
  gameSize: Vector2(xSize, ySize),
);

void main() {
  group('health bar tests', () {
    TestWidgetsFlutterBinding.ensureInitialized();
    virtualPetGameTest
      ..test('test initial health bar', (game) async {
        HealthBar healthBar = HealthBar();
        game.add(healthBar);

        game.virtualPetData.health.value = 100;

        expect(healthBar.healthTextComponent.text, "Health: 100/100");
      })

      ..test('test not full health bar', (game) async {
        HealthBar healthBar = HealthBar();
        game.add(healthBar);

        game.virtualPetData.health.value = 50;

        expect(healthBar.healthTextComponent.text, "Health: 50/100");
      });
  });
}
