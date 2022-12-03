import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:virtual_pet/pages/store_page.dart';
import 'package:virtual_pet/pages/settings_page.dart';
import 'package:virtual_pet/pages/testing_page.dart';
import 'package:virtual_pet/pages/todolist_page.dart';
import 'package:virtual_pet/pages/pomodoro_page.dart';
import 'package:virtual_pet/widgets/task_complete.dart';
import '../inherited_widgets/inherited_virtual_pet_game_wrapper.dart';

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
        body: SafeArea(
          child: Center(
            child: GameWidget(game: InheritedVirtualPetGameWrapper.of(context).virtualPetGame),
          ),
        ),

        /// instead of using bottom sheet, we could also try bottomNavigationBar
        bottomSheet: Container(
            padding: const EdgeInsets.only(bottom: 10.0),
            width: MediaQuery.of(context).size.width,
            height: 70.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    /// when pressed, the push function will be called for UI to display page two
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const TodoListPage()),
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
                    /// when pressed on button, the app will pop up a task-complete window
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TaskComplete(),
                        ));
                  },
                  icon: const Icon(Icons.text_fields, size: 50.0),
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
                IconButton(
                  onPressed: () {
                    /// when pressed, the push function will be called for UI to display store menu
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const TestingPage()),
                    );
                  },
                  icon: const Icon(Icons.science, size: 50.0),
                ),
              ],
            )));
  }
}
