import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:virtual_pet/flame/layers/virtual_pet_game_layer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Flame.device.setPortrait();
  runApp(MaterialApp(
    home: MyApp(),
    theme: themeData,
  ));
}

/// used for colour palette and styling
final ThemeData themeData = ThemeData(
  canvasColor: Colors.green[100],
  colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.black),
);

/// the main app
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

/// home page
class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

/// state of home page
class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: themeData.canvasColor,
        body: const Center(
          child: VirutalPetGameLayer(),
        ),

        /// instead of using bottom sheet, we could also try bottomNavigationBar
        bottomSheet: Container(
          color: themeData.canvasColor,
          width: MediaQuery.of(context).size.width,
          height: 80.0,
          child: IconButton(
            onPressed: () {
              /// when pressed, the push function will be called for UI to display page two
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PageTwo()),
              );
            },
            icon: const Icon(Icons.event_available, size: 60.0),
          ),
        ));
  }
}

/// page two (to do list)
class PageTwo extends StatefulWidget {
  @override
  PageTwoState createState() => PageTwoState();
}

/// the state of page two (to do list)
class PageTwoState extends State<PageTwo> {
  static const String routeName = "/PageTwo";

  /// checkboxes are set to false (unchecked) by default
  bool check1 = false;
  bool check2 = false;
  bool check3 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        /// displays the "To Do:" message at the top
        appBar: AppBar(
          backgroundColor: Theme.of(context).canvasColor,
          elevation: 1.0,
          title: const Text(
            "To Do:",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Container(

            /// column to organize checkboxes
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          /// below are the checkboxes widgets
          CheckboxListTile(
            //checkbox positioned at right
            value: check1,
            controlAffinity: ListTileControlAffinity.leading,
            onChanged: (bool? value) {
              setState(() {
                check1 = value!;
              });
            },
            title: Text("Reply to Odin on Slack"),
          ),
          CheckboxListTile(
            //checkbox positioned at right
            value: check2,
            controlAffinity: ListTileControlAffinity.leading,
            onChanged: (bool? value) {
              setState(() {
                check2 = value!;
              });
            },
            title: Text("Study for math midterm"),
          ),

          CheckboxListTile(
            //checkbox positioned at left
            value: check3,
            controlAffinity: ListTileControlAffinity.leading,
            onChanged: (bool? value) {
              setState(() {
                check3 = value!;
              });
            },
            title: Text("Some other boring task"),
          ),
        ])));
  }
}
