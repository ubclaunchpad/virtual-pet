import 'package:flutter/material.dart';
import 'package:virtual_pet/widgets/app_bar.dart';

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
    return const Scaffold(
      /// displays the "Settings" message at the top
      appBar: CustomAppBar(title: "Settings"),
      body: Text(
        "Settings goes here...",
        style: TextStyle(
          color: Colors.black,
          fontSize: 30.0,
        ),
      ),
    );
  }
}
