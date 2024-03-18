// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_interpolation_to_compose_strings, unused_field, non_constant_identifier_names, avoid_types_as_parameter_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:planpilot/colors/colors.dart';
import 'package:planpilot/components/dialog_box.dart';
import 'package:planpilot/components/task_tile.dart';
import 'package:planpilot/main_ui_pages/createproject_page.dart';
import 'package:planpilot/models/ProjectModel.dart';
import 'package:planpilot/project_cards/projectcard.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final user = FirebaseAuth.instance.currentUser!;
  final _pageController = PageController();

  // Text controller
  final _textController = TextEditingController();

  // List of Tasks
  List taskList = [
    ["UI Design", false],
    ["Go to work", false],
  ];

  // CheckBox was tapped
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      taskList[index][1] = !taskList[index][1];
    });
  }

  //Save new task
  void saveNewTask() {
    setState(() {
      taskList.add([_textController.text.trim(), false]);
    });
    _textController.clear();
    Navigator.of(context).pop();
  }

  // Create a new task
  void addNewTask() {
    showDialog(
      context: context, 
      builder: (context) {
        return DialogBox(
          controller: _textController, 
          onCancel: () => Navigator.of(context).pop(),
          onSave: saveNewTask,
        );
      },
      );
  }

  // Edit task
  void editTask(int index) {
  showDialog(
    context: context, 
    builder: (context) {
      _textController.text = taskList[index][0]; // pre-fill the text field with the current task name
      return DialogBox(
        controller: _textController, 
        onCancel: () => Navigator.of(context).pop(),
        onSave: () {
          setState(() {
            taskList[index][0] = _textController.text.trim(); // update the task name
          });
          _textController.clear();
          Navigator.of(context).pop();
        },
      );
    },
  );
}


  // Delete task
  void deleteTask(int index) {
    setState(() {
      taskList.removeAt(index);
    });
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
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
            height: 250,
            width: 500,
            child: Consumer<ProjectModel>(
              builder: (context, projectModel, child) {
              return PageView(
                controller: _pageController,
                  children: projectModel.projects.map((project) => Page1(projectInfo: project)).toList(),
                  /*
                  Page2(),
                  Page3(),
                  Page4(),
                  */
              );
              }
            ),
          ),
      
          // Dot Indicator
          Center(
            child: Consumer<ProjectModel>(
              builder: (context, projectModel, child) {
              return SmoothPageIndicator(
                controller: _pageController, 
                count: projectModel.projects.length,
                effect: ExpandingDotsEffect(
                  activeDotColor: Color(0xFF43C6AC),
                  dotColor: Color(0xFFD9D9D9),
                  //dotHeight: ,
                  //dotWidth: ,
                    
                ),
                );
              }
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
      
          SizedBox(height: 10),
      
          // Return tiles of tasks
          Expanded(
            child: Stack(
              children: [
            ListView.builder(
              itemCount: taskList.length,
              itemBuilder: (context, index) {
                return TaskTile(
                  taskName: taskList[index][0], 
                  isTaskCompleted: taskList[index][1], 
                  onChanged: (value) => checkBoxChanged(value, index), 
                  deleteFunction: (context) => deleteTask(index),
                  editFunction: (context) => editTask(index),
                  );
              }
              ),
            
            SizedBox(height: 5),
            
      
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    
                  // Add Task button
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.4),
                          spreadRadius: 3,
                          blurRadius: 5,
                          offset: Offset(0, 3)
                        )
                      ]
                    ),
                    child: ElevatedButton(
                      onPressed: addNewTask,
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        backgroundColor: MaterialStateProperty.all<Color>(planPilotGreen),
                      ), 
                      child: Text(
                        "Add Task",
                        style: GoogleFonts.poppins(color: Colors.white),
                        ),
                      ),
                  ),
              
                    SizedBox(width: 10),
              
                  // Create project button
                 Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.4),
                          spreadRadius: 3,
                          blurRadius: 5,
                          offset: Offset(0, 3)
                        )
                      ]
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CreateProjectPage()
                            )
                          );
                      },
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        backgroundColor: MaterialStateProperty.all<Color>(planPilotGreen),
                      ), 
                      child: Text(
                        "Add Project",
                        style: GoogleFonts.poppins(color: Colors.white),
                        ),
                      ),
                  ),
              
                ],
              ),
            ),
              ]
            ),
          ),
      
          SizedBox(height: 5),
          
      
        /*
          MaterialButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
            color: Colors.blue,
            child: Text("Sign out"),
            )
            */
        ],
      ),
    );
  }
}