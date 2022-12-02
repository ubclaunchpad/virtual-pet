import 'package:flutter/foundation.dart';

class VirtualPetData {
  final level = ValueNotifier<int>(0);
  final health = ValueNotifier<int>(100);
  final walkCycle = ValueNotifier<int>(16);
}
