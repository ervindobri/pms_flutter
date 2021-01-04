import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/constants/global_variables.dart';
import 'package:flutter_projects/models/task.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_table/ResponsiveDatatable.dart';
import 'package:simple_animations/simple_animations.dart';

class TableView extends StatefulWidget {
  @override
  _TableViewState createState() => _TableViewState();
}

class _TableViewState extends State<TableView> with AnimationMixin {
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



  List<Map<String, dynamic>> _loadData() {
    final List source = GlobalVariables.dummyTasks;
    List<Map<String, dynamic>> temps = List<Map<String, dynamic>>();
    var i = _source.length;
    // print(i);
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
    Future.delayed(Duration(seconds: 1)).then((value) {
      _source.addAll(_loadData()); //1000
      setState(() => _isLoading = false);
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initData();
    _currentPerPage = _perPages.first;
  }
  @override
  Widget build(BuildContext context) {
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
}
