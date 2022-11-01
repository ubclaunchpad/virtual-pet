import 'dart:math';

import 'package:flame/components.dart';
import 'package:virtual_pet/flame/game/vitural_pet_game.dart';

class VirtualPet extends SpriteAnimationComponent with HasGameRef {
  VirtualPet() : super(position: Vector2.all(32), size: Vector2.all(100)) {
    debugMode = true;
  }

  double deltaY = 0.5;
  double deltaX = 0;
  double movementTime = 0;
  VirtualPetState state = VirtualPetState.idle;

  final animationData = SpriteAnimationData.sequenced(
      amount: 5, stepTime: 0.3, textureSize: Vector2.all(64));
  late final SpriteAnimation idleAnimation;
  late final SpriteAnimation walkAnimation;

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    loadAnimations().then((_) => animation = walkAnimation);
  }

  @override
  Future<void> update(double dt) async {
    super.update(dt);
    moveSelf(dt);
    if (deltaX == 0 || deltaY == 0) {
      deltaX = 0;
      deltaY = 0;
      animation = idleAnimation;
    } else {
      animation = walkAnimation;
    }
    randomizeMovement(dt);
  }

  void randomizeMovement(double delta) {
    Random _rand = Random();
    if (movementTime > 0) {
      movementTime -= delta;
    } else {
      movementTime = 10 + (_rand.nextInt(40) + 1) * delta;
      deltaX = (-1 + _rand.nextInt(3) + 1);
      flipHorizontally();
      deltaY = (-1 + _rand.nextInt(3) + 1);
    }
  }

  void moveSelf(double delta) {
    y = y + deltaY;
    x = x + deltaX;

    if (x <= 0 || x >= gameRef.canvasSize.x - 64) {
      deltaX *= -1;
      flipHorizontally();
    }

    if (y <= 0 || y >= gameRef.canvasSize.y - 64) {
      deltaY *= -1;
    }
  }

  Future<void> loadAnimations() async {
    idleAnimation = SpriteAnimation.fromFrameData(
        await gameRef.images.load('yeti_idle.png'), animationData);
    walkAnimation = SpriteAnimation.fromFrameData(
        await gameRef.images.load('yeti_walk.png'), animationData);
  }
}
