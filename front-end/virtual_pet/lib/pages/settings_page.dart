import 'package:flutter/material.dart';

/// pomodoro page (pomodoro timer)
class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  SettingsPageState createState() => SettingsPageState();
}

/// the state of pomodoro page (timer)
class SettingsPageState extends State<SettingsPage> {
  static const String routeName = "/SettingsPage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// displays the "Settings" message at the top
      appBar: AppBar(
        backgroundColor: Theme.of(context).canvasColor,
        elevation: 1.0,
        title: const Text(
          "Settings",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: const Text(
        "Settings goes here...",
        style: TextStyle(
          color: Colors.black,
          fontSize: 30.0,
        ),
      ),
    );
  }
}
