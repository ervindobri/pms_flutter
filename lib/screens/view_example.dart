import 'dart:math';

import 'package:flutter/rendering.dart';
import 'package:flutter_projects/constants/global_variables.dart';
import 'package:flutter_projects/constants/theme_data.dart';
import 'package:flutter_projects/models/task.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/tasks/kanban_view.dart';
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

class _SwitchViewExampleState extends State<SwitchViewExample> with AnimationMixin {
  static const Color blue = Color(0xff0052cc);

  List<int> _perPages = [5, 10, 15, 100];
  int _total = 100;
  int _currentPerPage;
  int _currentPage = 1;
  bool _isSearch = false;
  List<Map<String, dynamic>> _source = List<Map<String, dynamic>>();
  List<Map<String, dynamic>> _selecteds = List<Map<String, dynamic>>();
  String _selectableKey = "id";

  String _sortColumn;
  bool _sortAscending = true;
  bool _isLoading = true;
  bool _showSelect = true;

  int _currentView  = 1;
  int _maxView = 3;

  List<Map<String, dynamic>> _loadData() {
    final List source = GlobalVariables.dummyTasks;
    List<Map<String, dynamic>> temps = List<Map<String, dynamic>>();
    var i = _source.length;
    print(i);
    for (Task data in source) {
      temps.add({
        "id": data.id,
        "name": data.name,
        "description": data.description,
        "status": data.getStatusLabel(),
        "assignee": data.assignee,
        "reporter": data.reporter,
        "priority": data.getPriority(),
      });
      i++;
    }
    return temps;
  }

  _initData() async {
    setState(() => _isLoading = true);
    Future.delayed(Duration(seconds: 3)).then((value) {
      _source.addAll(_loadData()); //1000
      setState(() => _isLoading = false);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initData();
  }

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
    return SingleChildScrollView(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(0),
                constraints: BoxConstraints(
                  maxHeight: 700,
                ),
                child: Card(
                    elevation: 1,
                    shadowColor: Colors.black,
                    clipBehavior: Clip.none,
                    child: ResponsiveDatatable(
                      title: Container(),
                      titleStyle: GoogleFonts.lato(
                        color: Colors.black,
                        fontWeight: FontWeight.w600
                      ),
                      actions: null,
                      headers: GlobalVariables.dummyHeaders,
                      source: _source,
                      selecteds: _selecteds,
                      showSelect: _showSelect,
                      autoHeight: false,
                      checkColor: blue,
                      onTabRow: (data) {
                        print(data);
                      },
                      onSort: (value) {
                        setState(() {
                          _sortColumn = value;
                          _sortAscending = !_sortAscending;
                          if (_sortAscending) {
                            if (_source[0]["$_sortColumn"] is List) {
                              _source.sort((a, b) => b["$_sortColumn"][0]
                                  .compareTo(a["$_sortColumn"][0]));
                            } else {
                              _source.sort((a, b) => b["$_sortColumn"]
                                  .compareTo(a["$_sortColumn"]));
                            }
                          }
                          else {
                            if (_source[0]["$_sortColumn"] is List) {
                              _source.sort((a, b) => a["$_sortColumn"][0]
                                  .compareTo(b["$_sortColumn"][0]));
                            } else {
                              _source.sort((a, b) => a["$_sortColumn"]
                                  .compareTo(b["$_sortColumn"]));
                            }
                          }
                        });
                      },
                      sortAscending: _sortAscending,
                      sortColumn: _sortColumn,
                      isLoading: _isLoading,
                      onSelect: (value, item) {
                        print("$value  $item ");
                        if (value) {
                          setState(() => _selecteds.add(item));
                        } else {
                          setState(() =>
                              _selecteds.removeAt(_selecteds.indexOf(item)));
                        }
                      },
                      onSelectAll: (value) {
                        if (value) {
                          setState(() => _selecteds =
                              _source.map((entry) => entry).toList().cast());
                        } else {
                          setState(() => _selecteds.clear());
                        }
                      },
                      footers: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Text("Rows per page:"),
                        ),
                        if (_perPages != null)
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: DropdownButton(
                                value: _currentPerPage,
                                items: _perPages
                                    .map((e) => DropdownMenuItem(
                                          child: Text("$e"),
                                          value: e,
                                        ))
                                    .toList(),
                                onChanged: (value) {
                                  setState(() {
                                    _currentPerPage = value;
                                  });
                                }),
                          ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                              "$_currentPage - $_currentPerPage of $_total"),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios,
                            size: 16,
                          ),
                          onPressed: () {
                            setState(() {
                              _currentPage =
                                  _currentPage >= 2 ? _currentPage - 1 : 1;
                            });
                          },
                          padding: EdgeInsets.symmetric(horizontal: 15),
                        ),
                        IconButton(
                          icon: Icon(Icons.arrow_forward_ios, size: 16),
                          onPressed: () {
                            setState(() {
                              _currentPage++;
                            });
                          },
                          padding: EdgeInsets.symmetric(horizontal: 15),
                        )
                      ],
                    )))
          ]),
    );
  }

  createGridView(){
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
      return SingleChildScrollView(
        child: Container(
            width: width * .8,
            height: height,
            child: AnimationLimiter(
              child: new StaggeredGridView.countBuilder(
                crossAxisCount: 4,
                itemCount: GlobalVariables.dummyTasks.length,
                itemBuilder: (BuildContext context, int index) =>
                AnimationConfiguration.staggeredGrid(
                  position: index,
                  duration: Duration(milliseconds: 500+(index*100)),
                  columnCount: 4,
                  child: SlideAnimation(
                    verticalOffset: -20,
                    child: FadeInAnimation(
                      child: InkWell(
                        onTap: () => print("kecske"),
                        onHover: (hovered) => null,
                        child: Card(
                          elevation: 10,
                          shadowColor: Colors.black.withOpacity(.15),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Container(
                                color: Colors.white,
                                height: 150,
                                child: Stack(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(18.0),
                                      child: Column(
                                        crossAxisAlignment:CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              '${GlobalVariables.dummyTasks[index].name}',
                                            textAlign: TextAlign.left,
                                            style: GoogleFonts.lato(
                                              color: ThemeColors.almostBlack,
                                              fontSize: 25,
                                              fontWeight: FontWeight.w900
                                            ),
                                          ),
                                          Container(
                                            height: 50,
                                            child: Text(
                                              '${GlobalVariables.dummyTasks[index].description}',
                                              style: GoogleFonts.lato(
                                                  color: ThemeColors.almostBlack,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w300
                                              ),
                                            ),
                                          ),

                                        ],
                                      ),
                                    ),
                                    Positioned(
                                      right: 0,
                                      child: Container(
                                        width: 50,
                                        height: 50,
                                        decoration: BoxDecoration(
                                            color: GlobalVariables.dummyTasks[index].getStatusLabel()[1],
                                            borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(10.0),
                                          )
                                        ),
                                        child: Center(
                                          child: FaIcon(
                                              GlobalVariables.dummyTasks[index].getStatusLabel()[2],
                                              color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      // alignment: Alignment.bottomCenter,
                                      bottom: 50,
                                      child: Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Container(
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: Text(
                                                        'Assignee',
                                                        style: GoogleFonts.lato(
                                                            color: ThemeColors.almostBlack,
                                                            fontSize: 16,
                                                            fontWeight: FontWeight.w700
                                                        ),
                                                      ),
                                                    ),
                                                    Row(
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      children: [
                                                        Container(
                                                          decoration: BoxDecoration(
                                                              shape: BoxShape.circle
                                                          ),
                                                          child: FaIcon(
                                                            FontAwesomeIcons.userCircle,
                                                            color: ThemeColors.almostBlack,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.all(8.0),
                                                          child: Text(
                                                            '${GlobalVariables.dummyTasks[index].assignee}',
                                                            style: GoogleFonts.lato(
                                                                color: ThemeColors.almostBlack,
                                                                fontSize: 16,
                                                                fontWeight: FontWeight.w300
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),


                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: Text(
                                                        'Reporter',
                                                        style: GoogleFonts.lato(
                                                            color: ThemeColors.almostBlack,
                                                            fontSize: 16,
                                                            fontWeight: FontWeight.w700
                                                        ),
                                                      ),
                                                    ),
                                                    Row(
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      children: [
                                                        Container(
                                                          decoration: BoxDecoration(
                                                              shape: BoxShape.circle
                                                          ),
                                                          child: FaIcon(
                                                            FontAwesomeIcons.userCircle,
                                                            color: ThemeColors.almostBlack,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.all(8.0),
                                                          child: Text(
                                                            '${GlobalVariables.dummyTasks[index].reporter}',
                                                            style: GoogleFonts.lato(
                                                                color: ThemeColors.almostBlack,
                                                                fontSize: 16,
                                                                fontWeight: FontWeight.w300
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),


                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(12),
                                          child: Container(
                                            color: (GlobalVariables.dummyTasks[index].getPriority()[2]).withOpacity(0.2),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    GlobalVariables.dummyTasks[index].getPriority()[0],
                                                    style: GoogleFonts.lato(
                                                        color: (GlobalVariables.dummyTasks[index].getPriority()[2]).withOpacity(1),

                                                        fontSize: 20,
                                                        fontWeight: FontWeight.w300
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: FaIcon(
                                                    GlobalVariables.dummyTasks[index].getPriority()[1],
                                                    color: (GlobalVariables.dummyTasks[index].getPriority()[2]).withOpacity(1),

                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                )),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                staggeredTileBuilder: (int index) =>
                new StaggeredTile.count(1, 1.2),
                mainAxisSpacing: 4.0,
                crossAxisSpacing: 4.0,
              ),
            ),
        ),
      );
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
