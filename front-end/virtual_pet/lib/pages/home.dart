import 'package:flutter/material.dart';
import 'package:virtual_pet/pages/page_two.dart';
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
        color: Theme.of(context).canvasColor,
        width: MediaQuery.of(context).size.width,
        height: 80.0,
        child: IconButton(
          onPressed: () {
            /// when pressed, the push function will be called for UI to display page two
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PageTwo()),
            );
          },
          icon: const Icon(Icons.event_available, size: 60.0),
        ),
      )
    );
  }
}
