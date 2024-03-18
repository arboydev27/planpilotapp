// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class TimePickerField extends StatelessWidget {
  final TextEditingController controller;

  const TimePickerField({
    super.key,
    required this.controller
    });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final TimeOfDay? picked = await showTimePicker(
          context: context, 
          initialTime: TimeOfDay.now(),
          );

          if(picked != null) {
            //Format the time using DateFormat
            String formattedTime = DateFormat('HH.mm').format(DateTime(DateTime.now().year,
            DateTime.now().month, DateTime.now().day, picked.hour, picked.minute));
            controller.text = formattedTime;
          }
      },
      child: AbsorbPointer(
        child: TextField(
          controller: controller,
          style: GoogleFonts.poppins(),
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(12),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF43C6AC)),
              borderRadius: BorderRadius.circular(12)
            ),
            hintText: "Select your due time...",
            hintStyle: GoogleFonts.poppins(fontSize: 14, color: Colors.grey),
            fillColor: Color(0xFFDFDFDF),
            filled: true,
          ),
        ),
      ),
    );
  }
}