import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/layers/flame_layer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Flame.device.setLandscape();
  runApp(const YetiApp());
}

class YetiApp extends StatelessWidget {
  const YetiApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Stack(
      children: [FlameLayer(), Container()],
    )));
  }
}
