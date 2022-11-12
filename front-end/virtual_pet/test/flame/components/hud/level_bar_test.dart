import 'package:flame/extensions.dart';
import 'package:flame_test/flame_test.dart';
import 'package:virtual_pet/flame/components/hud/level_bar.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:virtual_pet/flame/game/virtual_pet_game.dart';

const double xSize = 100;
const double ySize = 100;

final virtualPetGameTest = FlameTester(
  VirtualPetGame.new,
  gameSize: Vector2(xSize, ySize),
);

void main() {
  group('level bar tests', () {
    TestWidgetsFlutterBinding.ensureInitialized();

    late LevelBar levelBar;

    setUp(() {
      levelBar = LevelBar();
    });

    virtualPetGameTest
      ..test('test initial level bar', (game) async {
        int startingLevel = 50;

        game.virtualPetData.level.value = startingLevel;
        game.add(levelBar);

        expect(levelBar.levelTextComponent.text, levelBar.levelDisplayMessage(startingLevel));
      })
      ..test('test max level bar', (game) async {
        int maxLevel = 100;

        game.virtualPetData.level.value = maxLevel;
        game.add(levelBar);

        expect(levelBar.levelTextComponent.text, levelBar.levelDisplayMessage(maxLevel));
      });
  });
}
