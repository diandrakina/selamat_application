import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:selamat_application/styles/styles.dart';
import 'package:selamat_application/widget/chart/home_page_chart/tracking_duration/duration_bar_graph.dart';
import 'package:selamat_application/widget/widget_home_page.dart/button_home_page.dart';

class ContainerWorkSleepTime extends StatefulWidget {
  final IconData icon;
  final String text;
  final String numberhour;
  final String numberminute;
  final Color colorIcon;
  final double sizeIcon;
  final List startTime;
  final List endTime;

  final BoxDecoration? decoration;

  const ContainerWorkSleepTime(
      {Key? key,
      required this.icon,
      required this.text,
      required this.numberhour,
      required this.numberminute,
      required this.colorIcon,
      required this.sizeIcon,
      required this.startTime,
      required this.endTime,
      this.decoration})
      : super(key: key);

  @override
  _ContainerWorkSleepTimeState createState() => _ContainerWorkSleepTimeState();
}

class _ContainerWorkSleepTimeState extends State<ContainerWorkSleepTime> {
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 125,
          decoration: BoxDecoration(
              color: AppColors.darkModeCard,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12), topRight: Radius.circular(12))),
          child: Row(
            children: [
              Padding(padding: EdgeInsets.all(12)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(padding: EdgeInsets.all(10)),
                  Row(
                    children: [
                      FaIcon(
                        widget.icon,
                        size: widget.sizeIcon,
                        color: widget.colorIcon,
                      ),
                      Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
                      Text(
                        widget.numberhour,
                        style: TextStyles.bold_30,
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(
                        horizontal: 2,
                      )),
                      Text(
                        'h',
                        style: TextStyles.light_18,
                      ),
                      Padding(padding: EdgeInsets.symmetric(horizontal: 2)),
                      Text(
                        widget.numberminute,
                        style: TextStyles.bold_30,
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(
                        horizontal: 2,
                      )),
                      Text(
                        'm',
                        style: TextStyles.light_18,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ButtonHomePage(
                      buttonText: 'Record this time', onPressed: () {}),
                ],
              ),
              Padding(padding: EdgeInsets.all(25)),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.text,
                    style: TextStyles.regular_18,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: Colors.amber),
                    height: 20,
                    width: 115,
                    child: DurationBarGraph(
                        timeStart: widget.startTime,
                        timeEnd: widget.endTime,
                        barColor: widget.colorIcon),
                  )
                ],
              )
            ],
          ),
        ),
        Container(
          height: 35,
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: AppColors.inactiveCalendar,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
          ),
          padding: EdgeInsets.only(top: 5),
          child: Text(
            "View all",
            style: TextStyles.medium_18,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
