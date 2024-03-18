// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, prefer_typing_uninitialized_variables, unused_field, unused_element, unused_local_variable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:planpilot/components/date_picker.dart';
import 'package:planpilot/components/time_picker.dart';
import 'package:planpilot/models/ProjectModel.dart';
import 'package:planpilot/models/newpageinfo.dart';
import 'package:provider/provider.dart';

class CreateProjectPage extends StatefulWidget {
  const CreateProjectPage({super.key});

  @override
  State<CreateProjectPage> createState() => _CreateProjectPageState();
}

class _CreateProjectPageState extends State<CreateProjectPage> {

  final _projectNameController = TextEditingController();
  final _dueDateController = TextEditingController();
  final _dueTimeController = TextEditingController();
  final _descriptionController = TextEditingController();

  // Save the new Project
  void _createNewProject() {
    final newProject = NewProjectInfo(
      projectName: _projectNameController.text, 
      projectDueDate: _dueDateController.text, 
      projectDueTime: _dueTimeController.text, 
      projectDescription: _descriptionController.text,
      );

    _projectNameController.clear();
    _dueDateController.clear();
    _dueTimeController.clear();
    _descriptionController.clear();  

    Provider.of<ProjectModel>(context, listen: false).addProject(newProject);
  }

  @override
  void dispose() {
    super.dispose();
    _projectNameController.dispose();
    _dueDateController.dispose();
    _dueTimeController.dispose();
    _descriptionController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
          children: [
      
            // Title of Page
            Center(
              child: Text(
                "Create Project Page",
                style: GoogleFonts.poppins(fontSize: 30, fontWeight: FontWeight.bold),
                ),
            ),
      
            SizedBox(height: 10),
      
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  "Project name",
                  style: GoogleFonts.poppins(fontSize: 16),
                  textAlign: TextAlign.start,
                  ),
              ),
            ),
      
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
              child:TextField(
                        controller: _projectNameController, //Add text editing controller
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
                            hintText: "Write your project name...",
                            hintStyle: GoogleFonts.poppins(fontSize: 14, color: Colors.grey),
                            fillColor: Color(0xFFDFDFDF),
                            filled: true,
                          ),
                        ),
            ),
      
            SizedBox(height: 10),
      
            // Due Date
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  "Due Date",
                  style: GoogleFonts.poppins(fontSize: 16),
                  textAlign: TextAlign.start,
                  ),
              ),
            ),
      
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
              child: DatePickerField(controller: _dueDateController)
            ),
      
            SizedBox(height: 10),

            // Due Time
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  "Due Time",
                  style: GoogleFonts.poppins(fontSize: 16),
                  textAlign: TextAlign.start,
                  ),
              ),
            ),
      
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
              child: TimePickerField(controller: _dueTimeController),
            ),

            /*
            // Due time
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      "Due Date",
                      style: GoogleFonts.poppins(fontSize: 16),
                      textAlign: TextAlign.start,
                      ),
      
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                      child: Container(
                        height: 50,
                        width: 90,
                        child: TextField(
                            controller: null, //Add text editing controller
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
                                hintText: "...",
                                hintStyle: GoogleFonts.poppins(fontSize: 14, color: Colors.grey),
                                fillColor: Color(0xFFDFDFDF),
                                filled: true,
                              ),
                            ),
                      ),
                    ),
                  ],
                ),
      
                  Column(
                    children: [
                      Text(
                      "Due time",
                      style: GoogleFonts.poppins(fontSize: 16),
                      textAlign: TextAlign.start,
                      ),
      
                      Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                      child: Container(
                        height: 50,
                        width: 90,
                        child: TextField(
                            controller: null, //Add text editing controller
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
                                hintText: "...",
                                hintStyle: GoogleFonts.poppins(fontSize: 14, color: Colors.grey),
                                fillColor: Color(0xFFDFDFDF),
                                filled: true,
                              ),
                            ),
                      ),
                    ),
                    ],
                  ),
              ],
            ),
            */
      
            SizedBox(height: 10),
            
      
            // Description
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  "Description",
                  style: GoogleFonts.poppins(fontSize: 16),
                  textAlign: TextAlign.start,
                  ),
              ),
            ),
      
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
              child:Container(
                height: 200,
                width: 400,
                child: TextField(
                          controller: _descriptionController,
                          maxLines: null, //Add text editing controller
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
                              hintText: "Project description...",
                              hintStyle: GoogleFonts.poppins(fontSize: 14, color: Colors.grey),
                              fillColor: Color(0xFFDFDFDF),
                              filled: true,
                            ),
                          ),
              ),
            ),


            SizedBox(height: 100), // This might get weird for different screen sizes

            // Save Project button
           Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: GestureDetector(
                      onTap: _createNewProject,  //Add onTap method
                      child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondary,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text("Save Project",
                          style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
                          )
                          ),
                      ),
              ),
            ),
      
      
      
      
      
          ],
      ),
    );
  }
}