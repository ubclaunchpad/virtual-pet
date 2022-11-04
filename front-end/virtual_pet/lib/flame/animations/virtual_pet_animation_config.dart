import 'package:flame/components.dart';
import 'package:virtual_pet/flame/animations/virtual_pet_animation_data.dart';
import 'package:virtual_pet/flame/components/sprite/virtual_pet_state.dart';

/// Base image folder is at assets/images. When specifying the animation .png path, provide the
/// file path relative to assets/images folder. 
class VirtualPetAnimationDataConfig {
  final VirtualPetAnimationData idleAnimationData = VirtualPetAnimationData(
      "owl/owlet_idle.png",
      VirtualPetState.idle,
      SpriteAnimationData.sequenced(
          amount: 5, stepTime: 0.30, textureSize: Vector2.all(32)));

  final VirtualPetAnimationData walkAnimationData = VirtualPetAnimationData(
      "owl/owlet_walk.png",
      VirtualPetState.walk,
      SpriteAnimationData.sequenced(
          amount: 5, stepTime: 0.30, textureSize: Vector2.all(32)));

  final VirtualPetAnimationData jumpAnimationData = VirtualPetAnimationData(
      "owl/owlet_jump.png",
      VirtualPetState.jump,
      SpriteAnimationData.sequenced(
          amount: 5, stepTime: 0.30, textureSize: Vector2.all(32)));
}
