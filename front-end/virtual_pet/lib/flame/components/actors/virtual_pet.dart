import 'package:flame/components.dart';
import 'package:virtual_pet/flame/components/actors/virtual_pet_animation.dart';

class VirtualPet extends Component with HasGameRef {
  late VirtualPetAnimation virtualPetAnimation;

  VirtualPet() : super() {
    debugMode = true;
  }

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    virtualPetAnimation = VirtualPetAnimation();
    add(virtualPetAnimation);
  }

  @override
  Future<void> update(double dt) async {
    super.update(dt);
  }
}
