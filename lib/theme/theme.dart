// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    background: Color(0xFFF0F0F0),
    secondary: Color(0xFF43C6AC),
    tertiary: Colors.black,
    
  )
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    background: Colors.grey.shade900,
    primary: Color(0xFF43C6AC),
    secondary: Color(0xFF191645),
    tertiary: Colors.white
  )
);