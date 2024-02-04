import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:selamat_application/styles/styles.dart';
import 'package:selamat_application/widget/navbar.dart';
import 'package:selamat_application/widget/widget_home_page.dart/button_home_page.dart';
import 'package:selamat_application/widget/widget_home_page.dart/container_work_sleep_time.dart';
import 'package:selamat_application/widget/widget_home_page.dart/timing_home_page.dart';

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
          toolbarHeight: 100,
          leadingWidth: double.maxFinite,
          leading: Container(
            color: AppColors.bgDarkMode,
            padding: EdgeInsets.only(left: 20, right: 15),
            child: Row(
              children: [
                Text(
                  "Welcome, Richie!",
                  style: TextStyles.bold_30,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(width: 40),
                FaIcon(
                  FontAwesomeIcons.solidBell,
                  size: 28,
                  color: AppColors.white,
                ),
                SizedBox(
                  width: 20,
                ),
                FaIcon(
                  FontAwesomeIcons.solidCommentDots,
                  size: 28,
                  color: AppColors.white,
                ),
              ],
            ),
          ),
        ),
        body: Container(
          padding: EdgeInsets.only(left: 20, right: 20),
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 5,
                ),

                //CONTAINER PERTAMA
                Container(
                  height: 165,
                  decoration: BoxDecoration(
                    color: AppColors.darkModeCard,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            FaIcon(
                              FontAwesomeIcons.solidBuilding,
                              color: AppColors.baseColor,
                              size: 35,
                            ),
                            Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8)),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                    padding: EdgeInsets.symmetric(vertical: 8)),
                                Text(
                                  "Work",
                                  style: TextStyles.bold_30,
                                ),
                                Text(
                                  '09.00 - 17.00',
                                  style: TextStyles.regular_18,
                                )
                              ],
                            ),
                            Padding(padding: EdgeInsets.all(16)),
                            ButtonHomePage(
                                buttonText: 'Finish Early', onPressed: () {}),
                          ],
                        ),
                        Padding(padding: EdgeInsets.all(5)),
                        Text(
                          'Next schedule (9/32 tasks)',
                          style: TextStyles.regular_18,
                        ),
                        Padding(padding: EdgeInsets.all(5)),
                        Row(
                          children: [
                            Row(
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.sun,
                                  color: AppColors.white,
                                  size: 20,
                                ),
                                Padding(padding: EdgeInsets.all(5)),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Lunch',
                                      style: TextStyles.GR_14_light,
                                    ),
                                    Text(
                                      'From 12.00 -12.30',
                                      style: TextStyles.GR_14_light,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Padding(padding: EdgeInsets.all(8)),
                            Row(
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.dumbbell,
                                  color: AppColors.white,
                                  size: 18,
                                ),
                                Padding(padding: EdgeInsets.all(5)),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Exercise',
                                      style: TextStyles.GR_14_light,
                                    ),
                                    Text(
                                      'From 17.00 -18.00',
                                      style: TextStyles.GR_14_light,
                                    )
                                  ],
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                _viewAll(context),
                SizedBox(
                  height: 15,
                ),

                //CONTAINER KEDUA
                Container(
                  width: double.maxFinite,
                  height: 215,
                  decoration: BoxDecoration(
                      color: AppColors.darkModeCard,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 15),
                      Text(
                        "01 Nov 2023 - 30 Nov 2023",
                        style: TextStyles.regular_18,
                      ),
                      Padding(padding: EdgeInsets.all(10)),
                      Row(
                        children: [
                          Column(
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
                          Padding(padding: EdgeInsets.all(8)),
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
                SizedBox(
                  height: 20,
                ),

                //CONTAINER KETIGA
                Text(
                  "Work Time",
                  style: TextStyles.bold_30,
                ),
                SizedBox(
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
                SizedBox(
                  height: 20,
                ),

                //CONTAINER KEEMPAT
                Text(
                  "Sleep Time",
                  style: TextStyles.bold_30,
                ),
                SizedBox(
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
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Recent activities",
                  style: TextStyles.bold_30,
                ),
                SizedBox(
                  height: 15,
                ),

                //CONTAINER KELIMA
                Container(
                  height: 215,
                  decoration: BoxDecoration(
                    color: AppColors.darkModeCard,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                  ),
                  child: Column(
                    children: [
                      RecentActivities(
                          image: 'assets/images/home_page/jamonrantgunners.png',
                          username: "@jamonrantgunners",
                          activities: "just add you",
                          hours: '2h'),
                      Divider(
                        color: AppColors.activeCalendar,
                        height: 3,
                      ),
                      RecentActivities(
                          image: 'assets/images/home_page/gojosatoru.png',
                          username: "@gojosatoru",
                          activities: "just share a schedule with you",
                          hours: '3h'),
                      Divider(
                        color: AppColors.activeCalendar,
                        height: 3,
                      ),
                      RecentActivities(
                          image: 'assets/images/home_page/fushigurorahmat.png',
                          username: "@fushigurorahmat",
                          activities: "just share a schedule with you",
                          hours: '15h'),
                      Divider(
                        color: AppColors.activeCalendar,
                        height: 3,
                      ),
                      RecentActivities(
                          image: 'assets/images/home_page/donaldtrump.png',
                          username: "@donaldtrump",
                          activities: "just share a schedule with you",
                          hours: '23h'),
                    ],
                  ),
                ),
                _viewAll(context),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),

        bottomNavigationBar: NavBar(),
      ),
    );
  }

  Widget _viewAll(BuildContext context) {
    return Container(
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
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.bgDarkMode,
      toolbarHeight: 80,
      title: Row(
        children: [
          Text(
            "Welcome, Luka!",
            style: TextStyles.bold_30,
          ),
          SizedBox(width: 60),
          FaIcon(
            FontAwesomeIcons.solidBell,
            size: 28,
            color: AppColors.white,
          ),
          SizedBox(
            width: 20,
          ),
          FaIcon(
            FontAwesomeIcons.solidCommentDots,
            size: 28,
            color: AppColors.white,
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
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
                Padding(padding: EdgeInsets.all(8)),
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage(widget.image), fit: BoxFit.cover),
                  ),
                ),
                Padding(padding: EdgeInsets.all(5)),
                Text(
                  widget.username,
                  style: TextStyles.bold_18,
                ),
                Padding(padding: EdgeInsets.all(2)),
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
                Padding(
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

  //Function untuk membatasi panjang deskripsi
  String _truncateDescription(String text, int length) {
    if (text.length <= length) {
      return text;
    } else {
      return text.substring(0, length) + '...';
    }
  }
}
