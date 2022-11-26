// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'minutes.dart';
import 'dart:async';

/// pomodoro page (pomodoro timer)
class PomodoroPage extends StatefulWidget {
  const PomodoroPage({super.key});
  @override
  PomodoroState createState() => PomodoroState();
}

/// the state of pomodoro page (timer)
class PomodoroState extends State<PomodoroPage> {
  int timeLeft = 0;
  static const String routeName = "/PomodoroPage";
  bool inProgress = false;
  int lastValue = 0;

  @override
  void initState() {
    super.initState();
  }

  void _startCountDown() {
    setState(() {
      inProgress = true;
      lastValue = timeLeft;
    });
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timeLeft > 0) {
        setState(() {
          timeLeft--;
        });
      } else {
        setState(() {
          inProgress = false;
        });
        timer.cancel();
      }
    });
  }

  void _stopTimer() {
    setState(() {
      timeLeft = 0;
      inProgress = false;
    });
  }

  void _restartTimer() {
    setState(() {
      timeLeft = lastValue;
    });
    _startCountDown();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey[900],
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // minutes wheel
          Container(
            width: 70,
            child: ListWheelScrollView.useDelegate(
              onSelectedItemChanged: (value) {
                if (inProgress == true) {
                } else {
                  setState(() {
                    timeLeft = value;
                  });
                }
              },
              itemExtent: 50,
              perspective: 0.005,
              diameterRatio: 1.2,
              physics: const FixedExtentScrollPhysics(),
              childDelegate: ListWheelChildBuilderDelegate(
                childCount: 60,
                builder: (context, index) {
                  return MyMinutes(
                    mins: index,
                  );
                },
              ),
            ),
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Text(inProgress.toString()),
              // Text("LAST VALUE IS " + lastValue.toString()),
              Text(
                timeLeft == 0 ? "DONE" : timeLeft.toString(),
                style: const TextStyle(fontSize: 50),
              ),
              MaterialButton(
                onPressed: _startCountDown,
                color: Colors.blue,
                child: const Text("START TIMER"),
              ),
              MaterialButton(
                onPressed: inProgress == true ? _stopTimer : null,
                color: Colors.blue,
                child: const Text("STOP TIMER"),
              ),
              MaterialButton(
                onPressed: inProgress == true ? null : _restartTimer,
                color: Colors.blue,
                // child: Text("RESTART TIMER (" + lastValue.toString() + ")"),
                child: Text("RESTART TIMER (${lastValue.toString()})"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
