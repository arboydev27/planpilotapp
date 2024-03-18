// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:planpilot/components/myDialog_button.dart';

class DialogBox extends StatelessWidget {

  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel
    });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color(0xFFF0F0F0),

      // Container of DialogBox
      content: Container(
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // Get user input
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF43C6AC)),
                        borderRadius: BorderRadius.circular(12)
                    ),
                  hintText: "Input task",
                  hintStyle: GoogleFonts.poppins()
                ),
                
              ),
            ),

            // Buttons "Save" and "Cancel"
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Save button
                MyDialogButton(text: "Save", onPressed: onSave),

                SizedBox(width: 15),
                // Cancel button
                MyDialogButton(text: "Cancel", onPressed: onCancel)
              ],
            )

          ],
        ),
      ),
    );
  }
}