import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:virtual_pet/flame/components/sprite/virtual_pet_state.dart';

class HealthBar extends Component with HasGameRef {
  HealthBar(this.virtualPetState) : super();

  VirtualPetState virtualPetState;

  TextPaint textPaint = TextPaint(
    style: const TextStyle(
      fontSize: 48.0,
      fontFamily: 'Awesome Font',
    ),
  );

  @override
  void render(Canvas canvas) {
    textPaint.render(canvas, '${virtualPetState.getHealth()}', Vector2.all(100));
  }
}
