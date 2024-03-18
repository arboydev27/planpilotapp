// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:planpilot/authentication_pages/auth_page.dart';
import 'package:planpilot/main_ui_pages/home_page.dart';
import 'package:planpilot/main_ui_pages/main_skeleton.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return MainSkeleton();
        } 
        else{
          return AuthPage();
        }
      },
      ),
    );
  }
}