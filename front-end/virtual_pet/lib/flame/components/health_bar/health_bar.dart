import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:virtual_pet/flame/game/vitural_pet_game.dart';

class HealthBar extends Component with HasGameRef<VirtualPetGame> {
  late final TextComponent healthTextComponent;
  late final ShapeComponent healthContainer;
  late final ShapeComponent healthBar;

  HealthBar() : super();

  @override
  Future<void> onLoad() async {
    gameRef.virtualPetData.health.addListener(onHealthChange);

    healthTextComponent = TextComponent(text: "", anchor: Anchor.topLeft);
    healthTextComponent.text = "Health: ${gameRef.virtualPetData.health.value}/100";
    add(healthTextComponent);

    return super.onLoad();
  }

  @override
  void render(Canvas canvas) {
    Rect healthContainer =
        Rect.fromCenter(center: Offset.zero, width: calculateHealthBarSize(), height: 50);
    canvas.drawRect(healthContainer, Paint()..color = Colors.green);
  }

  @override
  void onRemove() {
    gameRef.virtualPetData.health.removeListener(onHealthChange);
    super.onRemove();
  }

  double calculateHealthBarSize() {
    return 2 * gameRef.size.x * (gameRef.virtualPetData.health.value / 100);
  }

  void onHealthChange() {
    healthTextComponent.text = "Health: ${gameRef.virtualPetData.health.value}/100";
  }
}
