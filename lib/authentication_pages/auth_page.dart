import 'package:flutter/material.dart';
import 'package:planpilot/authentication_pages/login_page.dart';
import 'package:planpilot/authentication_pages/register_page.dart';
import 'package:planpilot/authentication_pages/resetpassword_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {

  // initially show the login page
  int currentPage = 0;

  void showLoginPage() {
    setState(() {
      currentPage = 0;
    });
  }

  void showRegisterPage() {
    setState(() {
      currentPage = 1;
    });
  }

  void showResetPasswordPage() {
    setState(() {
      currentPage = 2;
    });
  }
  
  /*
  // initially show the login page
  bool showLoginPage = true;

  void toggleScreens() {
    setState(() {
      showLoginPage = !showLoginPage; // Its a reverse
    });
  }
  */

  @override
  Widget build(BuildContext context) {

    if (currentPage == 0) {
      return LoginPage(showRegisterPage: showRegisterPage, showResetPasswordPage: showResetPasswordPage);
    } else if (currentPage == 1) {
      return RegisterPage(showLoginPage: showLoginPage);
    } else {
      return ResetPasswordPage(showLoginPage: showLoginPage, showRegisterPage: showRegisterPage);
    }

    /*
    if (showLoginPage) {
      return LoginPage(showRegisterPage: toggleScreens);
    }
    else {
      return RegisterPage(showLoginPage: toggleScreens);
    }
  }
  */
  }
}