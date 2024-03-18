// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:planpilot/models/newpageinfo.dart';

class ProjectModel extends ChangeNotifier {
  List<NewProjectInfo> _projects = [];

  List<NewProjectInfo> get projects => _projects;

  void addProject(NewProjectInfo project) {
    _projects.add(project);
    notifyListeners();
  }
}