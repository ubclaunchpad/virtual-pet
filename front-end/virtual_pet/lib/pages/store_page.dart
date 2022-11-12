// ignore: file_names
import 'package:flutter/material.dart';

/// pomodoro page (pomodoro timer)
class StorePage extends StatefulWidget {
  const StorePage({super.key});

  @override
  StorePageState createState() => StorePageState();
}

/// the state of pomodoro page (timer)
class StorePageState extends State<StorePage> {
  static const String routeName = "/StorePage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// displays the "Store" message at the top
      appBar: AppBar(
        backgroundColor: Theme.of(context).canvasColor,
        elevation: 1.0,
        title: const Text(
          "Store",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: const Text(
        "Store page goes here...",
        style: TextStyle(
          color: Colors.black,
          fontSize: 30.0,
        ),
      ),
    );
  }
}
