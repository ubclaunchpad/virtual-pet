import 'package:flutter/material.dart';

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
    return Scaffold(

        /// displays the "Pomodoro Timer" message at the top
        appBar: AppBar(
          backgroundColor: Theme.of(context).canvasColor,
          elevation: 1.0,
          title: const Text(
            "Pomodoro Timer",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body:
        const Text(
          "Pomodoro timer coming soon...",
          style: TextStyle(
            color: Colors.black,
            fontSize: 30.0,
          ),
        ),
    );
  }
}
