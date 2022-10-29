import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/layers/yeti_game.dart';

class FlameLayer extends StatelessWidget {
  const FlameLayer({super.key});

  @override
  Widget build(BuildContext context) {
    return GameWidget(game: YetiGame());
  }
}