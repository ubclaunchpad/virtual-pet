import 'package:flame/components.dart';
import 'package:virtual_pet/flame/components/animations/virtual_pet_animation_config.dart';
import 'package:virtual_pet/flame/components/animations/virtual_pet_animation_state.dart';
import 'package:virtual_pet/flame/game/vitural_pet_game.dart';

const double virtualPetSize = 200;

class VirtualPetAnimation extends SpriteAnimationComponent with HasGameRef<VirtualPetGame> {
  static final VirtualPetAnimationDataConfig _animationDataConfig = VirtualPetAnimationDataConfig();

  late final SpriteAnimation idleAnimation;
  late final SpriteAnimation walkAnimation;
  late final SpriteAnimation jumpAnimation;
  late final SpriteAnimation deathAnimation;

  double deltaY = 0.5;
  double deltaX = 0;
  double movementTime = 0;

  VirtualPetAnimation() : super(size: Vector2.all(virtualPetSize)) {
    debugMode = true;
  }

  void changeState(VirtualPetAnimationState animationState) {
    switch (animationState) {
      case VirtualPetAnimationState.idle:
        animation = idleAnimation;
        break;
      case VirtualPetAnimationState.walk:
        animation = walkAnimation;
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
    position = Vector2((gameRef.size.y / 2) - (size.y / 2), (gameRef.size.x / 2) - (size.x / 2));
    loadAnimations().then((_) => animation = idleAnimation);
  }

  @override
  Future<void> update(double dt) async {
    super.update(dt);

    if (gameRef.virtualPetData.health.value <= 0) {
      changeState(VirtualPetAnimationState.death);
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
        await gameRef.images.load(_animationDataConfig.deathAnimationData.animationPath),
        _animationDataConfig.deathAnimationData.animationData);
  }
}
