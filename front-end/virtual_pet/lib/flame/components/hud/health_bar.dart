import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:virtual_pet/flame/game/virtual_pet_game.dart';

class HealthBar extends Component with HasGameRef<VirtualPetGame> {
  late final TextComponent healthTextComponent;

  HealthBar() : super();

  @override
  Future<void> onLoad() async {
    gameRef.virtualPetData.health.addListener(onHealthChange);

    healthTextComponent = TextComponent(
        text: healthDisplayMessage(gameRef.virtualPetData.health.value),
        anchor: Anchor.topLeft);
    add(healthTextComponent);

    return super.onLoad();
  }

  @override
  void render(Canvas canvas) {
    Rect healthContainer = Rect.fromCenter(
        center: Offset.zero, width: calculateHealthBarSize(), height: 50);
    canvas.drawRect(healthContainer, Paint()..color = Colors.green);
  }

  @override
  void onRemove() {
    gameRef.virtualPetData.health.removeListener(onHealthChange);
    super.onRemove();
  }

  double calculateHealthBarSize() {
    return 2.0 * gameRef.size.x * (gameRef.virtualPetData.health.value / 100);
  }

  String healthDisplayMessage(int health) {
    return "Health: $health/100";
  }

  void onHealthChange() {
    healthTextComponent.text =
        healthDisplayMessage(gameRef.virtualPetData.health.value);
  }
}
