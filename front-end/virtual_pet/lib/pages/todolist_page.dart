import 'package:flutter/material.dart';

/// to do list
class ToDoListPage extends StatefulWidget {
  const ToDoListPage({super.key});

  @override
  ToDoState createState() => ToDoState();
}

/// the state of page two (to do list)
class ToDoState extends State<ToDoListPage> {
  static const String routeName = "/ToDoListPage";

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
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
            title: const Text("Reply to Odin on Slack"),
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
            title: const Text("Study for math midterm"),
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
            title: const Text("Some other boring task"),
          ),
        ]));
  }
}
