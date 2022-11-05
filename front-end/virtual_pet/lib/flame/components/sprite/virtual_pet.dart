import 'dart:math';

import 'package:flame/components.dart';
import 'package:virtual_pet/flame/animations/virtual_pet_animation_config.dart';
import 'package:virtual_pet/flame/components/sprite/virtual_pet_state.dart';
import 'package:virtual_pet/flame/enums/virtual_pet_animation_state.dart';

class VirtualPet extends SpriteAnimationComponent with HasGameRef {
  VirtualPet(this.virtualPetState) : super(size: Vector2.all(100)) {
    debugMode = true;
  }

  static final VirtualPetAnimationDataConfig _animationDataConfig = VirtualPetAnimationDataConfig();

  late final SpriteAnimation idleAnimation;
  late final SpriteAnimation walkAnimation;
  late final SpriteAnimation jumpAnimation;
  late final SpriteAnimation deathAnimation;

  double deltaY = 0.5;
  double deltaX = 0;
  double movementTime = 0;
  VirtualPetState virtualPetState;
  late VirtualPetAnimationState state;

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    position = Vector2(gameRef.size.y / 2, gameRef.size.x / 2);
    loadAnimations().then((_) => animation = walkAnimation);
  }

  @override
  Future<void> update(double dt) async {
    super.update(dt);

    if (virtualPetState.getHealth() > 0) {
      moveSelf(dt);
      if (deltaX == 0 || deltaY == 0) {
        deltaX = 0;
        deltaY = 0;
        animation = idleAnimation;
      } else {
        animation = walkAnimation;
      }
      randomizeMovement(dt);
    } else {
      animation = deathAnimation;
    }
  }

  void randomizeMovement(double delta) {
    Random rand = Random();
    if (movementTime > 0) {
      movementTime -= delta;
    } else {
      movementTime = 10 + (rand.nextInt(40) + 1) * delta;
      deltaX = (-1 + rand.nextInt(3) + 1);
      flipHorizontally();
      deltaY = (-1 + rand.nextInt(3) + 1);
    }
  }

  void moveSelf(double delta) {
    y = y + deltaY;
    x = x + deltaX;

    if (x <= 0 || x >= gameRef.canvasSize.x - 100) {
      deltaX *= -1;
      flipHorizontally();
    }

    if (y <= 0 || y >= gameRef.canvasSize.y - 120) {
      deltaY *= -1;
    }
  }

  Future<void> loadAnimations() async {
    idleAnimation = SpriteAnimation.fromFrameData(
        await gameRef.images.load(_animationDataConfig.idleAnimationData.animationPath),
        _animationDataConfig.idleAnimationData.animationData);
    walkAnimation = SpriteAnimation.fromFrameData(
        await gameRef.images.load(_animationDataConfig.walkAnimationData.animationPath),
        _animationDataConfig.walkAnimationData.animationData);
    jumpAnimation = SpriteAnimation.fromFrameData(
        await gameRef.images.load(_animationDataConfig.jumpAnimationData.animationPath),
        _animationDataConfig.jumpAnimationData.animationData);
    deathAnimation = SpriteAnimation.fromFrameData(
        await gameRef.images.load(_animationDataConfig.dieAnimationData.animationPath),
        _animationDataConfig.dieAnimationData.animationData);
  }
}
