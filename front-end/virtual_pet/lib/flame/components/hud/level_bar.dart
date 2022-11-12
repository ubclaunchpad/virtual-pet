import 'package:flame/components.dart';
import 'package:virtual_pet/flame/game/virtual_pet_game.dart';

class LevelBar extends Component with HasGameRef<VirtualPetGame> {
  late final TextComponent levelTextComponent;

  LevelBar() : super();

  @override
  Future<void> onLoad() async {
    gameRef.virtualPetData.level.addListener(onLevelChange);

    levelTextComponent = TextComponent(
        text: levelDisplayMessage(gameRef.virtualPetData.level.value), 
        anchor: Anchor.topLeft,
        position: Vector2(0, 50),
    );
    add(levelTextComponent);

    return super.onLoad();
  }

  @override
  void onRemove() {
    gameRef.virtualPetData.level.removeListener(onLevelChange);
    super.onRemove();
  }

  String levelDisplayMessage(int level) {
    return "Level: $level";
  }

  void onLevelChange() {
    levelTextComponent.text = levelDisplayMessage(gameRef.virtualPetData.level.value);
  }
}
