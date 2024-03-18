// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyDialogButton extends StatelessWidget {
  final String text;
  VoidCallback onPressed;

  MyDialogButton({
    super.key,
    required this.text,
    required this.onPressed
    });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Color(0xFF43C6AC),
      child: Text(
        text,
        style: GoogleFonts.poppins(color: Colors.white),
        ),
      );
  }
}