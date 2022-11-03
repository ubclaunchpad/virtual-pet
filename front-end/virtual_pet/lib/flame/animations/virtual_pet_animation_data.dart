import 'package:flame/components.dart';
import 'package:virtual_pet/flame/components/sprite/virtual_pet_state.dart';

class VirtualPetAnimationData {
  String animationPath;
  VirtualPetState virtualPetState;
  SpriteAnimationData animationData;

  VirtualPetAnimationData(
    this.animationPath,
    this.virtualPetState,
    this.animationData);
}
