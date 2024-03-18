// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:planpilot/components/percent_indicator.dart';
import 'package:planpilot/models/newpageinfo.dart';

class Page1 extends StatelessWidget {
  final NewProjectInfo projectInfo;

  const Page1({
    super.key,
    required this.projectInfo
    });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25, bottom: 15, left: 40, right: 40),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Container(
            color: Color(0xFF191645),
            child: Column(
              children: [

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: Image(
                      image: AssetImage('assets/icons/project.png')
                      ),
                  
                    title: Text(
                      projectInfo.projectName,
                      style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child:  Text(
                    projectInfo.projectDescription,
                    style: GoogleFonts.poppins(color: Colors.white),
                    ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: ListTile(
                    title: Text(
                      projectInfo.projectDueDate, // Add project Description
                      style: GoogleFonts.poppins(color: Colors.white, fontSize: 12),
                      ),
                  
                    trailing: Text(
                      "80%", // Add project progress
                      style: GoogleFonts.poppins(color: Colors.white, fontSize: 12),
                      ),
                  ),
                ),

                PercentIndicator(),


              ],
            ),
          ),
        ),
    );
  }
}