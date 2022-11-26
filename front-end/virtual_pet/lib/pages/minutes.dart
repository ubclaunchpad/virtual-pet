import 'package:flutter/material.dart';

class MyMinutes extends StatelessWidget {
  final int mins;

  const MyMinutes({required this.mins, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Center(
        child: Text(
          // mins < 10 ? '0' + mins.toString() : mins.toString(),
          mins < 10 ? '0 ${mins.toString()}' : mins.toString(),
          style: const TextStyle(
            fontSize: 40,
            // color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
