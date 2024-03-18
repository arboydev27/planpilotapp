// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, must_be_immutable, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';

class TaskTile extends StatelessWidget {

  final String taskName;
  final bool isTaskCompleted;
  Function(bool?) ? onChanged;
  Function(BuildContext)? deleteFunction;
  Function(BuildContext)? editFunction;

  TaskTile({
    super.key,
    required this.taskName,
    required this.isTaskCompleted,
    required this.onChanged,
    required this.deleteFunction,
    required this.editFunction,
    });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 7),
      
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(), 
          children: [

            // Edit Slidable action
            SlidableAction(
              onPressed: editFunction,
              icon: Icons.edit_outlined,
              backgroundColor: Color(0xFF1AACEB),
              foregroundColor: Colors.white,
              borderRadius: BorderRadius.circular(12),
              ),

            // Delete slidable action
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Color(0xFFDF1B1B),
              borderRadius: BorderRadius.circular(12),
              ),

          ]
          ),
        child: Container(
          padding: EdgeInsets.all(10),
          child: ListTile(
            leading: Checkbox(value: isTaskCompleted, onChanged: onChanged, activeColor: Color(0xFF43C6AC),),
            
            title: Text(
              taskName,
              style: GoogleFonts.poppins(
                decoration: isTaskCompleted 
                ? TextDecoration.lineThrough 
                : TextDecoration.none),
            ),
          ),
          decoration: BoxDecoration(
            color: Color(0xFFDFDFDF),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}