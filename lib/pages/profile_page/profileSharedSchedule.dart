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

class NewProfilePage extends StatefulWidget {
  const NewProfilePage({super.key});

  @override
  State<NewProfilePage> createState() => _NewProfilePageState();
}

class _NewProfilePageState extends State<NewProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //SAMPUL PROFILE
              Container(
                height: 150,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image:
                          AssetImage("assets/images/discovery_page/catur.png"),
                      fit: BoxFit.cover),
                ),
              ),

              //FOTO DAN EDIT PROFILE
              Container(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  children: [
                    Container(
                      transform: Matrix4.translationValues(0.0, -40.0, 0.0),
                      child: const CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage(
                            "assets/images/discovery_page/psikolog/ChenZheyuan.jpg"),
                      ),
                    ),
                    const SizedBox(
                      width: 110,
                    ),
                    Container(
                      transform: Matrix4.translationValues(0.0, -10.0, 0.0),
                      child: CustomElevatedButton(
                        text: "Edit Profile",
                        buttonStyle: CustomButtonStyles.buttonGray3,
                        buttonTextStyle: TextStyles.medium_18,
                        width: 140,
                        height: 35,
                      ),
                    )
                  ],
                ),
              ),

              //MULAI KONTEN
              Container(
                transform: Matrix4.translationValues(0.0, -20.0, 0.0),
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //NAMA USER
                    Text(
                      "Richie Hartono",
                      style: TextStyles.bold_24,
                    ),

                    //USERNAME
                    Text(
                      "@richie_hartono",
                      style: TextStyles.light_16,
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    //DESKRIPSI PROFILE
                    Text(
                      "bukan ambis, tetapi optimis. semoga bisa menjadi yang terbaik demi masa depan. Saya suka main game, tetapi tetap rajin dalam belajar.",
                      style: TextStyles.light_16,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    //DOB USER
                    Row(
                      children: [
                        const FaIcon(
                          FontAwesomeIcons.cakeCandles,
                          size: 20,
                          color: AppColors.inactiveText,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "22 Januari 2001",
                          style: TextStyles.profile_text,
                        )
                      ],
                    ),

                    //TANGGAL BERGABUNG
                    Row(
                      children: [
                        const FaIcon(
                          FontAwesomeIcons.calendarCheck,
                          size: 20,
                          color: AppColors.inactiveText,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Bergabung Juni 2019",
                          style: TextStyles.profile_text,
                        )
                      ],
                    ),

                    //KETERANGAN
                    const Center(
                      child: SizedBox(
                        width: 300,
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
                    ),

                    //TAMPUNG PAGE VIEW
                    const SizedBox(
                      height: 700,
                      child: Page_View(),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Column(
                  children: [
                    ListTile(
                      leading: const FaIcon(
                        Icons.calendar_month_outlined,
                        color: Colors.white,
                        size: 30,
                      ),
                      title: Text(
                        "Share Schedule",
                        style: TextStyles.medium_24,
                      ),
                    ),
                    const Divider(
                      color: AppColors.activeCalendar,
                      thickness: 1,
                    ),
                    ListTile(
                      leading: const FaIcon(
                        Icons.note_add,
                        color: Colors.white,
                        size: 30,
                      ),
                      title: Text(
                        "Create A Note",
                        style: TextStyles.medium_24,
                      ),
                    ),
                  ],
                ),
                behavior: SnackBarBehavior.fixed,
              ),
            );
          },
          shape: const CircleBorder(),
          backgroundColor: AppColors.baseColor,
          child: const FaIcon(
            FontAwesomeIcons.pencil,
            color: Colors.white,
          ),
        ),
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
    return SizedBox(
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
          padding: const EdgeInsets.only(top: 20),
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
                          ? AppColors.pastelGreenHealth
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
                          ? AppColors.pastelGreenHealth
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
    return const Column(
      children: [
        Padding(padding: EdgeInsets.all(30)),
        //BOX BUAT SHARE SCHEDULE
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
    );
  }
}

//PAGE 2
class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
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
    );
  }
}
