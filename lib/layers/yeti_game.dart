
import 'package:flame/game.dart';

import '../components/yeti.dart';

enum YetiState {
  idle,
  walk,
}

class YetiGame extends FlameGame {

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    add(Yeti());
  }
}
