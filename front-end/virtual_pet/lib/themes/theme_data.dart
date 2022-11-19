import 'package:flutter/material.dart';

/// used for colour palette and styling
final ThemeData themeData = ThemeData(
  canvasColor: const Color.fromARGB(255, 200, 228, 185),
  colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.black),
  backgroundColor: const Color.fromARGB(255, 200, 228, 185),
  bottomSheetTheme: const BottomSheetThemeData(
    backgroundColor: Color.fromARGB(255, 200, 228, 185),
  ),
  iconTheme: const IconThemeData(
    color: Color.fromARGB(255, 0, 0, 0),
  ),
);
