import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:selamat_application/styles/styles.dart';
import 'package:selamat_application/widget/chart/profile_page/donutChart.dart';
import 'package:selamat_application/widget/chart/profile_page/timeChart.dart';
import 'package:selamat_application/widget/navbar.dart';
import 'package:selamat_application/widget/widget_login_register/customElevatedButton.dart';
import 'package:selamat_application/widget/widget_schedule/notesBox.dart';
import 'package:selamat_application/widget/widget_schedule/scheduleBox.dart';

class ProfileSharedSchedule extends StatefulWidget {
  const ProfileSharedSchedule({super.key});

  @override
  State<ProfileSharedSchedule> createState() => _ProfileSharedScheduleState();
}

class _ProfileSharedScheduleState extends State<ProfileSharedSchedule> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          toolbarHeight: 80,
          leadingWidth: double.maxFinite,
          backgroundColor: AppColors.bgDarkMode,
          leading: Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Row(
              children: [
                Text(
                  "lookaforwin",
                  style: TextStyles.bold_24,
                ),
                Padding(padding: EdgeInsets.symmetric(horizontal: 90)),
                FaIcon(
                  Icons.settings,
                  color: AppColors.white,
                  size: 30,
                )
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //FOTO PROFILE DAN KETERANGAN
                Row(
                  children: [
                    //FOTO PROFILE
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage(
                                "assets/images/discovery_page/psikolog/Joel.jpeg"),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(20)),

                    //KETERANGAN
                    Container(
                      width: 220,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ContainerAssets(
                            num: 4,
                            info: 'Posts',
                          ),
                          ContainerAssets(num: 782, info: 'mutuals'),
                          ContainerAssets(num: 42, info: 'habits'),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.all(8)),

                //DESCRIPTION
                Text(
                  'Luka Doncic',
                  style: TextStyles.bold_18,
                ),
                Text(
                  'life is useless without you',
                  style: TextStyles.light_18,
                ),
                Padding(padding: EdgeInsets.all(8)),

                //BUTTON EDIT PROFILE
                CustomElevatedButton(
                  text: 'Edit Profile',
                  buttonStyle: CustomButtonStyles.buttonGray,
                  buttonTextStyle: TextStyles.medium_18,
                  height: 35,
                  width: double.maxFinite,
                ),
                Padding(padding: EdgeInsets.all(8)),

                //PAGE VIEW
                Container(
                  height: 1500,
                  child: Page_View(),
                ),
                // Page_View(),
              ],
            ),
          ),
        ),
        bottomNavigationBar: NavBar(),
      ),
    );
  }
}

// BUAT CONTAINER
class ContainerAssets extends StatefulWidget {
  final int num;
  final String info;
  const ContainerAssets({Key? key, required this.num, required this.info});

  @override
  State<ContainerAssets> createState() => _ContainerAssetsState();
}

class _ContainerAssetsState extends State<ContainerAssets> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.amber,
      height: 80,
      width: 60,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${widget.num}',
            style: TextStyles.bold_18,
          ),
          Text(
            widget.info,
            style: TextStyles.light_14,
          )
        ],
      ),
    );
  }
}

//PAGE VIEW
class Page_View extends StatefulWidget {
  const Page_View({super.key});

  @override
  State<Page_View> createState() => _Page_ViewState();
}

class _Page_ViewState extends State<Page_View> {
  PageController _pageController = PageController(initialPage: 0);
  int _currentPageIndex = 0;

  final List<Widget> _pages = [
    const ScheduleView(),
    const NotesView(),
    const StatisticView()
  ];

  void _onTap(int pageIndex) {
    _pageController.animateToPage(
      pageIndex,
      duration: Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(children: [
        PageView.builder(
          controller: _pageController,
          onPageChanged: (int page) {
            setState(() {
              _currentPageIndex = page;
            });
          },
          itemCount: _pages.length,
          itemBuilder: (BuildContext context, int index) {
            return _pages[index % _pages.length];
          },
        ),
        Container(
          padding: EdgeInsets.only(top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  _onTap(0);
                },
                child: Text(
                  "Schedule",
                  style: TextStyle(
                      fontFamily: 'Samsung Sans',
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: _currentPageIndex == 0
                          ? Colors.white
                          : Colors.white54),
                ),
              ),
              GestureDetector(
                onTap: () {
                  _onTap(1);
                },
                child: Text(
                  "Notes",
                  style: TextStyle(
                      fontFamily: 'Samsung Sans',
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: _currentPageIndex == 1
                          ? Colors.white
                          : Colors.white54),
                ),
              ),
              GestureDetector(
                onTap: () {
                  _onTap(2);
                },
                child: Text(
                  "Statistic",
                  style: TextStyle(
                      fontFamily: 'Samsung Sans',
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: _currentPageIndex == 2
                          ? Colors.white
                          : Colors.white54),
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}

//HALAMAN 1
class ScheduleView extends StatelessWidget {
  const ScheduleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(padding: EdgeInsets.all(30)),
          ScheduleBox(
            profilePict: "assets/images/discovery_page/psikolog/Joel.jpeg",
            username: "lookaforwin",
            desc:
                "i wanna score 80+ like Kobe Bryant, do you guys have any advice on my routine?",
            date: "December 13 - December 24",
            comment: 34.1,
            hours: 3,
            likes: 76.1,
            status: true,
          ),
          SizedBox(
            height: 16,
          ),
          ScheduleBox(
            profilePict: "assets/images/discovery_page/psikolog/Joel.jpeg",
            username: "lookaforwin",
            desc:
                "i wanna score 80+ like Kobe Bryant, do you guys have any advice on my routine?",
            date: "December 13 - December 24",
            comment: 34.1,
            hours: 3,
            likes: 76.1,
            status: true,
          )
        ],
      ),
    );
  }
}

//PAGE 2
class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(padding: EdgeInsets.all(30)),
          NotesBox(
            profilePict: "assets/images/discovery_page/psikolog/Joel.jpeg",
            username: "lookaforwin",
            desc:
                "YAA BOYY I JUST TRAIN SO HARD, I CAN GET THAT 81+ POINTS ASAP BROOO. SEE U NEXT WEEK!",
            comment: 34.1,
            hours: 3,
            likes: 76.1,
            status: true,
          ),
          SizedBox(
            height: 16,
          ),
          NotesBox(
            profilePict: "assets/images/discovery_page/psikolog/Joel.jpeg",
            username: "lookaforwin",
            desc:
                "YAA BOYY I JUST TRAIN SO HARD, I CAN GET THAT 81+ POINTS ASAP BROOO. SEE U NEXT WEEK!",
            comment: 34.1,
            hours: 3,
            likes: 76.1,
            status: true,
          )
        ],
      ),
    );
  }
}

//PAGE 3
class StatisticView extends StatelessWidget {
  const StatisticView({super.key});

  @override
  Widget build(BuildContext context) {
    List<double> dailyTime = [1, 3, 0.5, 2, 1.5, 0, 0];
    return Container(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(40),
            ),
            Row(
              children: [
                Padding(padding: EdgeInsets.all(5)),
                DonutChart(
                  value: 100,
                  color: AppColors.pastelPurple,
                ),
                Padding(padding: EdgeInsets.all(8)),
                Container(
                  height: 50,
                  width: 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Sleep hrs",
                        style: TextStyles.bold_16,
                      ),
                      Text("51/49 hrs", style: TextStyles.light_16)
                    ],
                  ),
                ),
                DonutChart(
                  value: 88,
                  color: AppColors.baseColor,
                ),
                Padding(padding: EdgeInsets.all(8)),
                Container(
                  height: 50,
                  width: 120,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Overtime hrs",
                        style: TextStyles.bold_16,
                      ),
                      Text("7/8 hrs ", style: TextStyles.light_16)
                    ],
                  ),
                )
              ],
            ),
            Padding(padding: EdgeInsets.all(15)),
            Row(
              children: [
                Text(
                  'Overtime hours rate',
                  style: TextStyles.bold_16,
                ),
                SizedBox(
                  width: 120,
                ),
                Text(
                  "Week",
                  style: TextStyles.regular_14,
                ),
                SizedBox(
                  width: 20,
                ),
                //     DropdownButton<String>(
                // value: 'One',
                // onChanged: (String newValue) {
                //   print(newValue);
                // },
                // items: <String>['One', 'Two', 'Three', 'Four']
                //     .map<DropdownMenuItem<String>>((String value) {
                //   return DropdownMenuItem<String>(
                //     value: value,
                //     child: Text(value),
                //   );
                // }).toList(),
              ],
            ),
            //GRAFIK
            Padding(padding: EdgeInsets.all(16)),
            SizedBox(
              height: 200,
              child:
                  TimeChart(dailyTime: dailyTime, color: AppColors.baseColor),
            ),
            Padding(padding: EdgeInsets.all(16)),
            Text(
              '400 hours of overtime',
              style: TextStyles.regular_18,
            ),
            Divider(
              color: AppColors.floatingGrey,
              thickness: 1,
            ),
            Text(
              '800 hours of sleeping',
              style: TextStyles.regular_18,
            ),
            Divider(
              color: AppColors.floatingGrey,
              thickness: 1,
            ),
            Text(
              '60 hours of leisure time',
              style: TextStyles.regular_18,
            ),
            Divider(
              color: AppColors.floatingGrey,
              thickness: 1,
            ),
            Padding(padding: EdgeInsets.all(16)),

            //TASK COMPLETION & FOCUS TIME
            Row(
              children: [
                Padding(padding: EdgeInsets.all(5)),
                DonutChart(
                  value: 100,
                  color: AppColors.pastelGreenHealth,
                ),
                Padding(padding: EdgeInsets.all(8)),
                Container(
                  height: 50,
                  width: 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Task comp",
                        style: TextStyles.bold_16,
                      ),
                      Text("800/800", style: TextStyles.light_16)
                    ],
                  ),
                ),
                DonutChart(
                  value: 67,
                  color: AppColors.successStreak,
                ),
                Padding(padding: EdgeInsets.all(8)),
                Container(
                  height: 50,
                  width: 120,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Focus Time",
                        style: TextStyles.bold_16,
                      ),
                      Text("7/8 hrs ", style: TextStyles.light_16)
                    ],
                  ),
                ),
              ],
            ),
            Padding(padding: EdgeInsets.all(16)),

            //TASK COMPLETION
            Row(
              children: [
                Text(
                  'Task completion',
                  style: TextStyles.bold_16,
                ),
                SizedBox(
                  width: 120,
                ),
                Text(
                  "Week",
                  style: TextStyles.regular_14,
                ),
                SizedBox(
                  width: 20,
                ),
                //     DropdownButton<String>(
                // value: 'One',
                // onChanged: (String newValue) {
                //   print(newValue);
                // },
                // items: <String>['One', 'Two', 'Three', 'Four']
                //     .map<DropdownMenuItem<String>>((String value) {
                //   return DropdownMenuItem<String>(
                //     value: value,
                //     child: Text(value),
                //   );
                // }).toList(),
              ],
            ),
            Padding(padding: EdgeInsets.all(16)),

            //GRAFIK
            SizedBox(
              height: 200,
              child: TimeChart(
                  dailyTime: dailyTime, color: AppColors.pastelGreenHealth),
            ),
            Padding(padding: EdgeInsets.all(16)),
            Text(
              '548 tasks finished',
              style: TextStyles.regular_18,
            ),
            Divider(
              color: AppColors.floatingGrey,
              thickness: 1,
            ),
            Text(
              '548 tasks finished',
              style: TextStyles.regular_18,
            ),

            Padding(padding: EdgeInsets.all(16)),

            Container(
              height: 200,
              color: Colors.amber,
            )
          ],
        ),
      ),
    );
  }
}
