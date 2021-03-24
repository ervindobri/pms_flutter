import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/constants/global_variables.dart';
import 'package:flutter_projects/constants/theme_data.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class KanbanView extends StatefulWidget {
  final List<dynamic>? data;
  final int? columns;
  final Color? columnColor;
  const KanbanView({Key? key,  this.data, this.columns, this.columnColor}) : super(key: key);
  @override
  _KanbanViewState createState() => _KanbanViewState();
}

class _KanbanViewState extends State<KanbanView> {

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;


    return SingleChildScrollView(
      child: Container(
        width: width * .8,
        height: height,
        child: AnimationLimiter(
          child: new StaggeredGridView.countBuilder(
              crossAxisCount: 4,
              itemCount: 4,
              staggeredTileBuilder: (int index) =>
              new StaggeredTile.count(1, 2),
              mainAxisSpacing: 1.0,
              crossAxisSpacing: 6.0,
              itemBuilder: (BuildContext context, int index) {
                print(index);
                return AnimationConfiguration.staggeredGrid(
                    position: index,
                    duration: Duration(milliseconds: 300+(index*100)),
                    columnCount: 4,
                    child: SlideAnimation(
                      verticalOffset: 100,
                      child: FadeInAnimation(
                        child: Container(
                          decoration: BoxDecoration(
                            // color: Colors.white,
                            color: GlobalVariables.columnTaskNames[index][1].withOpacity(.15),
                            borderRadius: BorderRadius.circular(12),
                            // boxShadow: [BoxShadow(
                            //   color: Colors.black.withOpacity(.15),
                            // )]
                          ),
                          child: Column(
                            children: [
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: FaIcon(
                                          GlobalVariables.columnTaskNames[index].last,
                                          color: ThemeColors.almostBlack,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          GlobalVariables.columnTaskNames[index].first,
                                          style: GoogleFonts.lato(
                                            // color: Colors.white,
                                              color: ThemeColors.almostBlack,
                                              fontSize: 25,
                                              fontWeight: FontWeight.w900
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Column(
                                children: List.generate(GlobalVariables.columnTasks[index % 4].length, (x)
                                => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(12),
                                    hoverColor: GlobalVariables.columnTaskNames[index][1].withOpacity(.5),
                                    splashColor: GlobalVariables.columnTaskNames[index][1].withOpacity(.8),
                                    onTap: () => print("kecske"),
                                    child: Container(
                                      width: width,
                                      decoration: BoxDecoration(
                                        // color: GlobalVariables.columnTaskNames[index].last.withOpacity(.5),
                                          color: Colors.white.withOpacity(.5),
                                          borderRadius: BorderRadius.circular(12)
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              GlobalVariables.columnTasks[index % 4][x].name,
                                              style: GoogleFonts.lato(
                                                // color: Colors.white,
                                                  color: ThemeColors.almostBlack,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w500
                                              ),
                                            ),
                                            Text(
                                              GlobalVariables.columnTasks[index % 4][x].description,
                                              style: GoogleFonts.lato(
                                                // color: Colors.white,
                                                  color: ThemeColors.almostBlack,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w300
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(2.0),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: FaIcon(
                                                      GlobalVariables.columnTasks[index % 4][x].getPriority()[1],
                                                      color: GlobalVariables.columnTasks[index % 4][x].getPriority()[2],

                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Text(
                                                      GlobalVariables.columnTasks[index % 4][x].getPriority()[0],
                                                      style: GoogleFonts.lato(
                                                        // color: Colors.white,
                                                          color: GlobalVariables.columnTasks[index % 4][x].getPriority()[2],
                                                          fontSize: 14,
                                                          fontWeight: FontWeight.w300
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )

                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                )),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                );
              }

          ),
        ),
      ),
    );
    //ERP ORDERS
    // return Padding(
    //   padding: const EdgeInsets.all(8.0),
    //   child: Container(
    //     width: width,
    //     height: height,
    //     color: Colors.white,
    //     child: Row(
    //       children: List.generate(SalesForceGlobals.leadColumnNames.length, (index) {
    //         int nrLeads = widget.data.where((element) => element.status == SalesForceGlobals.leadColumnNames[index].last).toList().length;
    //         return Expanded(
    //           child: Container(
    //             width: width/SalesForceGlobals.leadColumnNames.length,
    //             height: height,
    //             decoration: BoxDecoration(
    //               border: Border.all(color: SalesForceGlobals.textColor.withOpacity(.2)),
    //             ),
    //             child: Column(
    //               mainAxisAlignment: MainAxisAlignment.start,
    //               children: [
    //                 Container(
    //                   height:40,
    //                   width: width/SalesForceGlobals.leadColumnNames.length,
    //                   decoration: BoxDecoration(
    //                       color: SalesForceGlobals.blueColor,
    //                       borderRadius: BorderRadius.circular(25)
    //                   ),
    //                   child: Center(
    //                     child: AutoSizeText(
    //                       "${SalesForceGlobals.leadColumnNames[index].first}   ($nrLeads)",
    //                       maxLines: 1,
    //                       style: GoogleFonts.openSans(
    //                           color: Colors.white,
    //                           fontWeight: FontWeight.w500
    //                       ),
    //                     ),
    //                   ),
    //                 ),
    //                 Expanded(
    //                   flex: 1,
    //                   child: SingleChildScrollView(
    //                     child: Column(
    //                       children: List.generate(widget.data.where((element) => element.status == SalesForceGlobals.leadColumnNames[index].last).toList().length,
    //                               (lindex) => LeadCard(lead: widget.data[index]),
    //                       ),
    //                     ),
    //                   ),
    //                 )
    //
    //               ],
    //             ),
    //           ),
    //         );
    //       }
    //
    //       ),
    //     )
    //   ),
    // );
    //TODOS

  }
}
