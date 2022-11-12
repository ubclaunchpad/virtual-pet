import 'package:flutter/material.dart';
import 'package:virtual_pet/pages/store_page.dart';
import 'package:virtual_pet/pages/settings_page.dart';
import 'package:virtual_pet/pages/todolist_page.dart';
import 'package:virtual_pet/pages/pomodoro_page.dart';
import '../flame/layers/virtual_pet_game_layer.dart';

/// home page
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  HomeState createState() => HomeState();
}

/// state of home page
class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).canvasColor,
        body: const Center(
          child: VirutalPetGameLayer(),
        ),

        /// instead of using bottom sheet, we could also try bottomNavigationBar
        bottomSheet: Container(
            padding: const EdgeInsets.only(bottom: 10.0),
            color: Theme.of(context).canvasColor,
            width: MediaQuery.of(context).size.width,
            height: 60.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    /// when pressed, the push function will be called for UI to display page two
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ToDoListPage()),
                    );
                  },
                  icon: const Icon(Icons.event_available, size: 50.0),
                ),
                IconButton(
                  onPressed: () {
                    /// when pressed, the push function will be called for UI to display pomodoro page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PomodoroPage()),
                    );
                  },
                  icon: const Icon(Icons.timer, size: 50.0),
                ),
                IconButton(
                  onPressed: () {
                    /// when pressed, the push function will be called for UI to display settings menu
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SettingsPage()),
                    );
                  },
                  icon: const Icon(Icons.settings, size: 50.0),
                ),
                IconButton(
                  onPressed: () {
                    /// when pressed, the push function will be called for UI to display store menu
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const StorePage()),
                    );
                  },
                  icon: const Icon(Icons.store, size: 50.0),
                ),
              ],
            )
        )
    );
  }
}
