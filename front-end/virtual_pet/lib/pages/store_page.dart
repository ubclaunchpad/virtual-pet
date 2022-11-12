// ignore: file_names
import 'package:flutter/material.dart';
import 'package:virtual_pet/widgets/app_bar.dart';

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
    return const Scaffold(
      /// displays the "Store" message at the top
      appBar: CustomAppBar(title: "Store"),
      body: Text(
        "Store page goes here...",
        style: TextStyle(
          color: Colors.black,
          fontSize: 30.0,
        ),
      ),
    );
  }
}
