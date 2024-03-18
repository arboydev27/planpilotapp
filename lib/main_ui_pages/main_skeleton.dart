// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_final_fields, unused_element, unused_field, avoid_unnecessary_containers

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:planpilot/main_ui_pages/calendarview_page.dart';
import 'package:planpilot/main_ui_pages/createproject_page.dart';
import 'package:planpilot/main_ui_pages/createtask_page.dart';
import 'package:planpilot/main_ui_pages/home_page.dart';

class MainSkeleton extends StatefulWidget {
  MainSkeleton({super.key});

  @override
  State<MainSkeleton> createState() => _MainSkeletonState();
}

class _MainSkeletonState extends State<MainSkeleton> {
  // Index to track the current page to display
  int _selectedPageIndex = 0;

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  // The pages we have in our app
  final List _pages = [
    //HomePage
    HomePage(),

    //CalendarPage
    CalendarViewPage(),

    //Create Project Page
    CreateProjectPage(),

    //New project Page
    CreateTaskPage(),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        actions: [
          IconButton(
            onPressed: () {}, 
            icon: Icon(Icons.person)
            )
        ],
      ),
      
      drawer: Drawer(
        backgroundColor: Colors.grey[300]
      ),

      body: _pages[_selectedPageIndex],

      bottomNavigationBar: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          child: GNav(
            selectedIndex: _selectedPageIndex,
            onTabChange: _navigateBottomBar,
            textStyle: GoogleFonts.poppins(fontSize: 14,),
            color: Colors.grey,
            activeColor: Color(0xFF43C6AC),
            hoverColor: Color(0x3343C6AC),
            //tabBackgroundColor: Color(0x3343C6AC),
            //rippleColor: Colors.red,
            tabActiveBorder: Border.all(color: Color(0xFF43C6AC), width: 1.5),

          
            gap: 8,
            padding: EdgeInsets.all(16),
          
            tabs: const [
              GButton(
                icon: Icons.home_outlined,
                text: "Home",
              ),
              GButton(
                icon: Icons.calendar_month_outlined,
                text: "Calendar"
              ),
              GButton(
                icon: Icons.task_outlined,
                text: "New task",
              ),
              GButton(
                icon: Icons.query_stats_rounded,
                text: "Statistics",
              ),
            ]
            ),
        ),
      ),
    ); 
  }
}