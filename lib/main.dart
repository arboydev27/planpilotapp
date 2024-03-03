// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:planpilot/authentication_pages/login_page.dart';
import 'package:planpilot/authentication_pages/register_page.dart';
import 'package:planpilot/authentication_pages/resetpassword_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ResetPasswordPage(),
    );
  }
}
