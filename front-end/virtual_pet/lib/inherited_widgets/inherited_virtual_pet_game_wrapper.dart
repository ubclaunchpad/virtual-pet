import 'package:flutter/material.dart';
import 'package:virtual_pet/flame/game/virtual_pet_game.dart';

class InheritedVirtualPetGameWrapper extends InheritedWidget {
  final VirtualPetGame virtualPetGame;

  const InheritedVirtualPetGameWrapper({
    required this.virtualPetGame, 
    required Widget child, 
    super.key}) : super(child: child);

  @override 
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static InheritedVirtualPetGameWrapper of(BuildContext context) {
    final InheritedVirtualPetGameWrapper? result = context
      .dependOnInheritedWidgetOfExactType<InheritedVirtualPetGameWrapper>();
    assert(result != null, 'No Game Wrapper is present in context');
    return result!;
  }
}
