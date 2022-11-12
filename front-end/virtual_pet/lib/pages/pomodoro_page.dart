import 'package:flutter/material.dart';
import 'package:virtual_pet/widgets/app_bar.dart';

/// pomodoro page (pomodoro timer)
class PomodoroPage extends StatefulWidget {
  const PomodoroPage({super.key});

  @override
  PomodoroState createState() => PomodoroState();
}

/// the state of pomodoro page (timer)
class PomodoroState extends State<PomodoroPage> {
  static const String routeName = "/PomodoroPage";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        /// displays the "Pomodoro Timer" message at the top
        appBar: CustomAppBar(title: "Pomodoro Timer"),
        body: Text(
          "Pomodoro timer coming soon...",
          style: TextStyle(
            color: Colors.black,
            fontSize: 30.0,
          ),
        ),
    );
  }
}
