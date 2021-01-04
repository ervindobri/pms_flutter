import 'dart:math';

import 'package:flutter/rendering.dart';
import 'package:flutter_projects/constants/global_variables.dart';
import 'package:flutter_projects/constants/theme_data.dart';
import 'package:flutter_projects/models/task.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/tasks/card_view.dart';
import 'package:flutter_projects/tasks/kanban_view.dart';
import 'package:flutter_projects/tasks/table_view.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_table/responsive_table.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:simple_animations/simple_animations.dart';

import 'kanban_test.dart';

class SwitchViewExample extends StatefulWidget {
  @override
  _SwitchViewExampleState createState() => _SwitchViewExampleState();
}

class _SwitchViewExampleState extends State<SwitchViewExample> {

  static const Color blue = Color(0xff0052cc);

  int _currentView  = 1;
  int _maxView = 3;


  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: width,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5,
                      spreadRadius: -2,
                      offset: Offset(0, 5))
                ]),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  // color: Colors.grey.withAlpha(50),
                  width: width * .8,
                  height: height,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              FlatButton(
                                onPressed: () {
                                  //TODO: open dialog to create task
                                },
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                hoverColor: Colors.white.withOpacity(.2),
                                color: blue,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Create",
                                    style: GoogleFonts.lato(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                ),
                              ),
                              FlatButton(
                                onPressed: () {
                                  //TODO: switch view
                                  setState(() {
                                    if ( _currentView < _maxView){
                                      _currentView++;
                                    }
                                    else{
                                      _currentView = 1;
                                    }
                                  });
                                },
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                hoverColor: blue.withOpacity(.1),
                                color: Colors.grey.shade300,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                        child: Text(
                                          "Switch view",
                                          style: GoogleFonts.lato(
                                              color: Colors.black, fontSize: 15),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                        child: FaIcon(
                                          FontAwesomeIcons.listAlt,
                                          size: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        AnimatedSwitcher(
                          duration: Duration(milliseconds: 300),
                          reverseDuration: Duration(milliseconds: 300),
                          switchInCurve: Curves.easeInOut,
                          child: getCurrentView(),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  createDataTable() {
    return TableView();
  }

  createGridView(){
      return CardView();
  }
  getCurrentView() {
    switch(this._currentView){
      case 1:
        //List View
        return createDataTable();
        break;
      case 2:
        //Card View
        return createGridView();
        break;
      case 3:
        //KanBan View
        return createKanbanView();
        break;
    }
  }

  createKanbanView() {
    return KanbanView();
  }
}
