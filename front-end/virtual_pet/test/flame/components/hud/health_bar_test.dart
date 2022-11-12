import 'package:flame/extensions.dart';
import 'package:flame_test/flame_test.dart';
import 'package:virtual_pet/flame/components/hud/health_bar.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:virtual_pet/flame/game/virtual_pet_game.dart';

const double xSize = 100;
const double ySize = 100;

final virtualPetGameTest = FlameTester(
  VirtualPetGame.new,
  gameSize: Vector2(xSize, ySize),
);

void main() {
  group('health bar tests', () {
    TestWidgetsFlutterBinding.ensureInitialized();

    late HealthBar healthBar;

    setUp(() {
      healthBar = HealthBar();
    });

    virtualPetGameTest
      ..test('test initial health bar', (game) async {
        int fullHealth = 100;
        game.add(healthBar);

        game.virtualPetData.health.value = fullHealth;

        expect(healthBar.healthTextComponent.text, healthBar.healthDisplayMessage(fullHealth));
      })
      ..test('test not full health bar', (game) async {
        int reducedHealth = 50;
        game.add(healthBar);

        game.virtualPetData.health.value = reducedHealth;

        expect(healthBar.healthTextComponent.text, healthBar.healthDisplayMessage(reducedHealth));
      });
  });
}
