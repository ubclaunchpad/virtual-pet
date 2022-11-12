import 'package:flutter/material.dart';

class TaskComplete extends StatelessWidget {
  const TaskComplete({super.key});

  @override
  Widget build(BuildContext context) {
    return taskCompletePOP(context);
  }

  Widget taskCompletePOP(BuildContext context) {
    return AlertDialog(
      title: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const <Widget>[
          Text("You Did It!",
              style: TextStyle(
                  fontStyle: FontStyle.normal, fontWeight: FontWeight.bold)),
        ],
      ),
      alignment: Alignment.center,
      ////%
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const <Widget>[
          Text("You have earned 10 coins!",
              style: TextStyle(fontStyle: FontStyle.italic)),
          Text("But wait! To earn your coins, check in",
              style: TextStyle(fontStyle: FontStyle.italic)),
          Text("and tell us how your rest went!",
              style: TextStyle(fontStyle: FontStyle.italic))
          //TODO: ADD PICTURE HERE IF NEEDED IN THE FUTURE.
        ],
      ),
      ////%
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            'Yup! :)',
            textAlign: TextAlign.end,
          ),
        ),

        ///%
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            'Nope! :(',
            textAlign: TextAlign.end,
          ),
        ),
      ],
      ////%
      elevation: 10.0,
    );
  }
}
