// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_interpolation_to_compose_strings, unused_field

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:planpilot/project_cards/projectcard.dart';
import 'package:planpilot/project_cards/page_2.dart';
import 'package:planpilot/project_cards/page_3.dart';
import 'package:planpilot/project_cards/page_4.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final user = FirebaseAuth.instance.currentUser!;
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        actions: [
          IconButton(
            onPressed: () {}, 
            icon: Icon(Icons.person))
        ],
      ),

      drawer: Drawer(
        backgroundColor: Colors.grey[300]
        ),

      backgroundColor: Theme.of(context).colorScheme.background,

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Text(
            "Hello Arboy!",
            style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 30)
          ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Text(
            "Ready to conquer your day? ",
            style: GoogleFonts.poppins(fontWeight: FontWeight.w700, fontSize: 16)
          ),
        ),

        // project cards Page view
        SizedBox(
          height: 300,
          width: 500,
          child: PageView(
            controller: _pageController,
            children: [
              Page1(),
              Page2(),
              Page3(),
              Page4(),
            ],
          ),
        ),

        // Dot Indicator
        Center(
          child: SmoothPageIndicator(
            controller: _pageController, 
            count: 4,
            effect: ExpandingDotsEffect(
              activeDotColor: Color(0xFF43C6AC),
              dotColor: Color(0xFFD9D9D9),
              //dotHeight: ,
              //dotWidth: ,

            ),
            ),
            ),

        SizedBox(height: 25 ),

        // Today's Tasks
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Text(
            "Today's Tasks",
            style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 22)
          ),
        ),

      
        MaterialButton(
          onPressed: () {
            FirebaseAuth.instance.signOut();
          },
          color: Colors.blue,
          child: Text("Sign out"),
          )
      ],
      
            ),
    );
  }
}