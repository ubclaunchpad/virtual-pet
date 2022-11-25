// ignore: file_names
import 'package:flutter/material.dart';
import 'package:virtual_pet/inherited_widgets/inherited_virtual_pet_game_wrapper.dart';
import 'package:virtual_pet/widgets/app_bar.dart';

/// pomodoro page (pomodoro timer)
class TestingPage extends StatefulWidget {
  const TestingPage({super.key});

  @override
  TestingPageState createState() => TestingPageState();
}

/// the state of pomodoro page (timer)
class TestingPageState extends State<TestingPage> {
  static const String routeName = "/Test";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(title: "Test"),
        body: Column(
          children: [
            TextButton(
              onPressed: () {
                InheritedVirtualPetGameWrapper.of(context)
                  .virtualPetGame
                  .paused = true;
              },
              child: const Text('Pause Game')),
            TextButton(
              onPressed: () {
                InheritedVirtualPetGameWrapper.of(context)
                  .virtualPetGame
                  .paused = false;
              },
              child: const Text('Start Game')),
          ],
        ));
  }
}
