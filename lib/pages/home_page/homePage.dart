import 'dart:ffi';

import 'package:flutter/material.dart';
// import 'dart:html';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:selamat_application/pages/chat_page/ChatPage.dart';
import 'package:selamat_application/pages/chat_page/ContactPage.dart';
import 'package:selamat_application/styles/styles.dart';
import 'package:selamat_application/widget/bottom_sheet_timer_widget.dart';
import 'package:selamat_application/widget/drawerWidget.dart';
import 'package:selamat_application/widget/navbar.dart';
import 'package:selamat_application/widget/searchBar.dart';
import 'package:selamat_application/widget/widget_home_page.dart/container_work_sleep_time.dart';
import 'package:selamat_application/widget/widget_home_page.dart/timing_home_page.dart';
import 'package:selamat_application/widget/widget_login_register/customElevatedButton.dart';

import '../../widget/chart/home_page_chart/tracking_time/bar_graph.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Store data chart membandingkan waktu
  List<double> activityTime = [35, 47, 31];
  //exercise time, work time, leisure time

  //Store data chart Work Time
  List<double> workTimeStart = [519.0];
  List<double> workTimeEnd = [939.0];

  //Store data chart Sleep Time
  List<double> sleepTimeStart = [127.0];
  List<double> sleepTimeEnd = [553.0];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        //APP BAR
        appBar: AppBar(
          toolbarHeight: 80,
          leadingWidth: double.maxFinite,
          leading: Builder(builder: (context) {
            return Container(
              color: AppColors.bgDarkMode,
              padding: const EdgeInsets.only(left: 20, right: 15),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Scaffold.of(context).openDrawer();
                    },
                    child: Container(
                      height: 36,
                      width: 36,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage(
                                "assets/images/discovery_page/psikolog/ChenZheyuan.jpg"),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const CustomSearchBar2(
                    width: 270,
                    height: 37.5,
                    color: AppColors.floatingGrey,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ContactPage(),
                        ),
                      );
                    },
                    child: const FaIcon(
                      FontAwesomeIcons.solidCommentDots,
                      size: 25,
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
            );
          }),
        ),

        //DRAWER
        drawer: DrawerWidget(),

        //BODY
        body: Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ElevatedButton(
                //   onPressed: () {
                //     // Show the bottom sheet when the button is pressed
                //     showModalBottomSheet(
                //       context: context,
                //       // isScrollControlled: true,
                //       builder: (BuildContext context) {
                //         return BottomSheetTimer();
                //       },
                //     );
                //   }, child: Text('Test Button'),
                // ),
                const SizedBox(
                  height: 5,
                ),

                //CONTAINER PERTAMA
                Container(
                  width: double.maxFinite,
                  height: 225,
                  decoration: const BoxDecoration(
                      color: AppColors.darkModeCard,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 15),
                      Text(
                        "01 Nov 2023 - 30 Nov 2023",
                        style: TextStyles.regular_18,
                      ),
                      const Padding(padding: EdgeInsets.all(10)),
                      Row(
                        children: [
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Padding(padding: EdgeInsets.all(8)),
                              TimingHomePage(
                                  icon: FontAwesomeIcons.fire,
                                  text1: "35 hrs",
                                  text2: 'Exercise',
                                  sizeIcon: 35,
                                  colorIcon: AppColors.pastelRed),
                              SizedBox(
                                height: 5,
                              ),
                              TimingHomePage(
                                  icon: Icons.work_rounded,
                                  text1: "47 hrs",
                                  text2: 'Work',
                                  sizeIcon: 28,
                                  colorIcon: AppColors.baseColor),
                              SizedBox(
                                height: 5,
                              ),
                              TimingHomePage(
                                  icon: FontAwesomeIcons.gamepad,
                                  text1: "31 hrs",
                                  text2: 'Leisure',
                                  sizeIcon: 25.0,
                                  colorIcon: AppColors.pastelGreenHealth),
                            ],
                          ),
                          const Padding(padding: EdgeInsets.all(8)),
                          SizedBox(
                            height: 150,
                            width: 110,
                            child: BarGraph_Time(
                              activityTime: activityTime,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                _viewAll(context),
                const SizedBox(
                  height: 20,
                ),

                //CONTAINER KEDUA
                Text(
                  "Ongoing Schedule",
                  style: TextStyles.bold_30,
                ),
                const SizedBox(
                  height: 10,
                ),
                const ScheduleBox(
                    icon: Icons.work,
                    activity: "Go To Work",
                    status: true,
                    time: '09:00'),
                const SizedBox(
                  height: 10,
                ),

                //CONTAINER KETIGA
                Text("Next Schedule", style: TextStyles.medium_18),
                const SizedBox(
                  height: 10,
                ),
                const ScheduleBox(
                    icon: Icons.work,
                    activity: "Go To Work",
                    status: false,
                    time: '09:00'),
                const SizedBox(
                  height: 10,
                ),
                const ScheduleBox(
                    icon: Icons.work,
                    activity: "Go To Work",
                    status: false,
                    time: '09:00'),
                const SizedBox(
                  height: 10,
                ),

                Text(
                  "Work Time",
                  style: TextStyles.bold_30,
                ),
                const SizedBox(
                  height: 15,
                ),
                ContainerWorkSleepTime(
                    icon: Icons.work,
                    text: "08.39 - 15.39",
                    numberhour: "7",
                    numberminute: '0',
                    colorIcon: AppColors.bluePowder,
                    sizeIcon: 30,
                    startTime: workTimeStart,
                    endTime: workTimeEnd),
                const SizedBox(
                  height: 20,
                ),

                //CONTAINER KEEMPAT
                Text(
                  "Sleep Time",
                  style: TextStyles.bold_30,
                ),
                const SizedBox(
                  height: 15,
                ),
                ContainerWorkSleepTime(
                  icon: Icons.bed,
                  text: "22.07 - 05.37",
                  numberhour: "7",
                  numberminute: "6",
                  colorIcon: AppColors.pastelPurple,
                  sizeIcon: 32,
                  startTime: sleepTimeStart,
                  endTime: sleepTimeEnd,
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),

        // bottomNavigationBar: NavBar(),
      ),
    );
  }

  Widget _viewAll(BuildContext context) {
    return Container(
      height: 40,
      width: double.maxFinite,
      decoration: const BoxDecoration(
        color: AppColors.inactiveCalendar,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
      ),
      padding: const EdgeInsets.only(top: 5),
      child: Text(
        "View all",
        style: TextStyles.medium_18,
        textAlign: TextAlign.center,
      ),
    );
  }
}

class RecentActivities extends StatefulWidget {
  final String image;
  final String username;
  final String activities;
  final String hours;

  const RecentActivities(
      {Key? key,
      required this.image,
      required this.username,
      required this.activities,
      required this.hours});

  @override
  State<RecentActivities> createState() => _RecentActivitiesState();
}

class _RecentActivitiesState extends State<RecentActivities> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      // color: Colors.amber,
      child: Row(
        children: [
          SizedBox(
            // color: Colors.blue,
            height: 50,
            width: 315,
            child: Row(
              children: [
                const Padding(padding: EdgeInsets.all(8)),
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage(widget.image), fit: BoxFit.cover),
                  ),
                ),
                const Padding(padding: EdgeInsets.all(5)),
                Text(
                  widget.username,
                  style: TextStyles.bold_18,
                ),
                const Padding(padding: EdgeInsets.all(2)),
                Expanded(
                  child: Text(
                    widget.activities,
                    // _truncateDescription(widget.activities, 12),
                    style: TextStyles.light_18,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    maxLines: 1,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                ),
              ],
            ),
          ),
          Text(
            widget.hours,
            style: TextStyles.light_14,
          )
        ],
      ),
    );
  }
}

class ScheduleBox extends StatefulWidget {
  final IconData icon;
  final String activity;
  final String time;
  final bool status;

  const ScheduleBox(
      {super.key,
      required this.icon,
      required this.activity,
      required this.status,
      required this.time});

  @override
  State<ScheduleBox> createState() => _ScheduleBoxState();
}

class _ScheduleBoxState extends State<ScheduleBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: AppColors.darkModeCard,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const Padding(padding: EdgeInsets.all(10)),
          FaIcon(
            widget.icon,
            size: 30,
            color: AppColors.baseColor,
          ),
          const SizedBox(
            width: 20,
          ),
          SizedBox(
            width: 160,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.activity,
                  style: TextStyles.bold_18,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  widget.time,
                  style: TextStyles.light_14,
                )
              ],
            ),
          ),
          CustomElevatedButton(
            height: 30,
            width: 100,
            text: "Start",
            buttonTextStyle: TextStyles.bold_14,
            buttonStyle: widget.status
                ? CustomButtonStyles.buttonBlue
                : CustomButtonStyles.buttonNotSure,
          )
        ],
      ),
    );
  }
}
