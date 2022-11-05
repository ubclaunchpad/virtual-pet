import 'package:flame/components.dart';
import 'package:virtual_pet/flame/animations/virtual_pet_animation_data.dart';

const double stepTime = 0.30;
const double singleSpriteFrameSize = 32;

/// Base image folder is at assets/images. When specifying the animation .png path, provide the
/// file path relative to assets/images folder.

class VirtualPetAnimationDataConfig {
  final VirtualPetAnimationData idleAnimationData = VirtualPetAnimationData("owl/owlet_idle.png",
      SpriteAnimationData.sequenced(
        amount: 4, 
        stepTime: stepTime, 
        textureSize: Vector2.all(singleSpriteFrameSize)));

  final VirtualPetAnimationData walkAnimationData = VirtualPetAnimationData("owl/owlet_walk.png",
      SpriteAnimationData.sequenced(
        amount: 6, 
        stepTime: stepTime, 
        textureSize: Vector2.all(singleSpriteFrameSize)));

  final VirtualPetAnimationData jumpAnimationData = VirtualPetAnimationData("owl/owlet_jump.png",
      SpriteAnimationData.sequenced(
        amount: 8, 
        stepTime: stepTime, 
        textureSize: Vector2.all(singleSpriteFrameSize)));

  final VirtualPetAnimationData dieAnimationData = VirtualPetAnimationData(
      "owl/owlet_death.png",
      SpriteAnimationData.sequenced(
          amount: 9, 
          stepTime: stepTime, 
          textureSize: Vector2.all(singleSpriteFrameSize), 
          loop: false));
}
