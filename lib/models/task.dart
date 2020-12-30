
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

enum Priority{
  VERY_LOW, LOW,MEDIUM, HIGH, VERY_HIGH
}

enum Status {
  BACKLOG, TO_DO, IN_PROGRESS, DONE
}
class Task{
  int id;
  String name;
  String description;
  String assignee;
  String reporter;
  Priority priority;
  Status status;

  Task.name(this.id, this.name, this.description, this.assignee, this.reporter,
      this.priority, this.status);

  getStatusLabel() {
    IconData icon = FontAwesomeIcons.checkCircle;
     var labelColor = null;
    String label = "Done";
    switch(this.status){

      case Status.BACKLOG:
        label = "Backlog";
        icon = FontAwesomeIcons.layerGroup;
        labelColor = Colors.blueGrey;
        break;
      case Status.TO_DO:
        label = "To Do";
        icon = FontAwesomeIcons.thumbtack;
        labelColor = Colors.blue;
        break;
      case Status.IN_PROGRESS:
        label = "In Progress";
        icon = FontAwesomeIcons.spinner;

        labelColor = Colors.blue;
        break;
      case Status.DONE:
        label = "Done";
        labelColor = Colors.green;
        break;
    }
    return [label, labelColor, icon];
  }

  getPriority() {
    IconData icon = FontAwesomeIcons.arrowUp;
    var iconColor = null;
    String label = "Low";
    switch(this.priority){
      case Priority.VERY_LOW:
        icon = FontAwesomeIcons.arrowDown;
        label = "Very Low";
        iconColor = Colors.greenAccent;
        break;
      case Priority.LOW:
        icon = FontAwesomeIcons.arrowDown;
        label = "Low";
        iconColor = Colors.green;
        break;
      case Priority.MEDIUM:
        icon = FontAwesomeIcons.arrowUp;
        label = "Medium";
        iconColor = Colors.orange;
        break;
      case Priority.HIGH:
        icon = FontAwesomeIcons.arrowUp;
        label = "High";
        iconColor = Colors.red;
        break;
      case Priority.VERY_HIGH:
        icon = FontAwesomeIcons.arrowUp;
        label = "Very High";
        iconColor = Colors.redAccent;
        break;
    }
    return [label, icon, iconColor];
  }
}