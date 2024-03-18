// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class DatePickerField extends StatelessWidget {
  final TextEditingController controller;

  const DatePickerField({
    super.key,
    required this.controller
    });


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final DateTime? picked = await showDatePicker(
          context: context, 
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2100),
        );

        if (picked != null) {
          // Format the date using DateFormat
          String formattedDate = DateFormat('yyyy-MM-dd').format(picked);
          controller.text = formattedDate;
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
            hintText: "Select your due date...",
            hintStyle: GoogleFonts.poppins(fontSize: 14, color: Colors.grey),
            fillColor: Color(0xFFDFDFDF),
            filled: true,
          ),
        ),
      ),
    );
  }
}