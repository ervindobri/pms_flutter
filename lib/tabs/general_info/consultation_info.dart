
import 'package:flutter_projects/constants/theme_data.dart';
import 'package:flutter_projects/models/consultation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConsultationInfo extends StatelessWidget {
  final Consultation consultation;


  const ConsultationInfo({Key? key, required this.consultation}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return Container(
      color: Colors.transparent,
      child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Date",
                      textAlign: TextAlign.left,
                      style: ThemeColors.thickDarkstyle,
                    ),
                    Text(
                        consultation.date,
                      textAlign: TextAlign.left,

                      style: ThemeColors.mediumDarkStyle,
                    ),
                  ],
                ),
              ),
              Divider(
                color: ThemeColors.greyTextColor,
                  height: 2,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,

                  children: [
                    Text(
                      "Finish date",
                      textAlign: TextAlign.left,

                      style: ThemeColors.thickDarkstyle,
                    ),
                    Text(
                      consultation.finishDate,
                      textAlign: TextAlign.left,

                      style: ThemeColors.mediumDarkStyle,
                    ),
                  ],
                ),
              ),
              Divider(
                color: ThemeColors.greyTextColor,
                height: 2,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,

                  children: [
                    Text(
                      "Hour",
                      textAlign: TextAlign.left,

                      style: ThemeColors.thickDarkstyle,
                    ),
                    Text(
                      consultation.hour,
                      textAlign: TextAlign.left,

                      style: ThemeColors.mediumDarkStyle,
                    ),
                  ],
                ),
              ),
              Divider(
                color: ThemeColors.greyTextColor,
                height: 2,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,

                  children: [
                    Text(
                      "Duration",
                      textAlign: TextAlign.left,

                      style: ThemeColors.thickDarkstyle,
                    ),
                    Text(
                      consultation.duration,
                      textAlign: TextAlign.left,

                      style: ThemeColors.mediumDarkStyle,
                    ),
                  ],
                ),
              ),
              Divider(
                color: ThemeColors.greyTextColor,
                height: 2,
              ),
            ],
          ),
      );
  }
}
