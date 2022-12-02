import 'package:flame/components.dart';
import 'package:virtual_pet/flame/components/animations/virtual_pet_animation_config.dart';
import 'package:virtual_pet/flame/components/animations/virtual_pet_animation_state.dart';
import 'package:virtual_pet/flame/game/virtual_pet_game.dart';

const double virtualPetSize = 200;

class VirtualPetAnimation extends SpriteAnimationComponent
    with HasGameRef<VirtualPetGame> {
  static final VirtualPetAnimationDataConfig _animationDataConfig =
      VirtualPetAnimationDataConfig();

  late final SpriteAnimation idleAnimation;
  late final SpriteAnimation forwardWalkAnimation;
  late final SpriteAnimation backwardWalkAnimation;
  late final SpriteAnimation jumpAnimation;
  late final SpriteAnimation deathAnimation;

  double deltaY = 0.5;
  double deltaX = 0;
  double movementTime = 0;

  int direction = 0;

  bool facingRight = true;

  VirtualPetAnimation() : super(size: Vector2.all(virtualPetSize)) {
    debugMode = true;
  }

  void changeState(VirtualPetAnimationState animationState) {
    switch (animationState) {
      case VirtualPetAnimationState.idle:
        animation = idleAnimation;
        direction = 0;
        break;
      case VirtualPetAnimationState.walkForward:
        animation = forwardWalkAnimation;
        direction = 1;
        break;
      case VirtualPetAnimationState.walkBackward:
        animation = backwardWalkAnimation;
        direction = -1;
        break;
      case VirtualPetAnimationState.jump:
        animation = jumpAnimation;
        break;
      case VirtualPetAnimationState.death:
        animation = deathAnimation;
        break;
    }
  }

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    position = Vector2((gameRef.size.x / 3) - (size.x / 2),
        (gameRef.size.y / 2) - (size.y / 2));
    loadAnimations().then((_) => animation = idleAnimation);
  }

  @override
  Future<void> update(double dt) async {
    super.update(dt);

    if (direction == 1) {
      position.x += 1;
    }

    if (direction == 0) {
      position.x += 0;
    }

    if (direction == -1) {
      position.x -= 1;
    }

    if (gameRef.virtualPetData.walkCycle.value <= 16) {
      changeState(VirtualPetAnimationState.idle);
    }

    if (gameRef.virtualPetData.walkCycle.value < 14) {
      changeState(VirtualPetAnimationState.jump);
    }

    if (gameRef.virtualPetData.walkCycle.value < 12) {
      changeState(VirtualPetAnimationState.walkForward);
      if (facingRight == false) {
        flipHorizontallyAroundCenter();
        facingRight = true;
      }
    }

    if (gameRef.virtualPetData.walkCycle.value < 10) {
      changeState(VirtualPetAnimationState.idle);
    }

    if (gameRef.virtualPetData.walkCycle.value < 9) {
      changeState(VirtualPetAnimationState.jump);
    }

    if (gameRef.virtualPetData.walkCycle.value < 7) {
      changeState(VirtualPetAnimationState.idle);
    }

    if (gameRef.virtualPetData.walkCycle.value < 5) {
      changeState(VirtualPetAnimationState.walkBackward);
      if (facingRight) {
        flipHorizontallyAroundCenter();
        facingRight = false;
      }
    }

    if (gameRef.virtualPetData.walkCycle.value < 3) {
      changeState(VirtualPetAnimationState.idle);
    }

    if (gameRef.virtualPetData.health.value <= 0) {
      changeState(VirtualPetAnimationState.death);
    }
  }

  Future<void> loadAnimations() async {
    idleAnimation = SpriteAnimation.fromFrameData(
        await gameRef.images.load(_animationDataConfig.idleAnimationData.animationPath),
        _animationDataConfig.idleAnimationData.animationData);
    forwardWalkAnimation = SpriteAnimation.fromFrameData(
        await gameRef.images.load(_animationDataConfig.walkAnimationData.animationPath),
        _animationDataConfig.walkAnimationData.animationData);
    backwardWalkAnimation = SpriteAnimation.fromFrameData(
        await gameRef.images.load(_animationDataConfig.walkAnimationData.animationPath),
        _animationDataConfig.walkAnimationData.animationData);
    jumpAnimation = SpriteAnimation.fromFrameData(
        await gameRef.images.load(_animationDataConfig.jumpAnimationData.animationPath),
        _animationDataConfig.jumpAnimationData.animationData);
    deathAnimation = SpriteAnimation.fromFrameData(
        await gameRef.images.load(_animationDataConfig.deathAnimationData.animationPath),
        _animationDataConfig.deathAnimationData.animationData);
  }
}
