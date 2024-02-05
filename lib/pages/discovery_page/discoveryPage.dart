import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:selamat_application/styles/styles.dart';
import 'package:selamat_application/widget/navbar.dart';
import 'package:selamat_application/widget/widget_discovery/container_habits.dart';
import 'package:selamat_application/widget/widget_discovery/container_profile_psikolog.dart';

class DiscoveryPage extends StatefulWidget {
  const DiscoveryPage({super.key});

  @override
  State<DiscoveryPage> createState() => _DiscoveryPageState();
}

class _DiscoveryPageState extends State<DiscoveryPage> {
  PageController _carouselController = PageController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          toolbarHeight: 60,
          leadingWidth: double.maxFinite,
          leading: Container(
            padding: EdgeInsets.only(left: 20, right: 15),
            color: AppColors.bgDarkMode,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Discovery',
                  style: TextStyles.bold_24,
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 30,
                  width: 350,
                  decoration: BoxDecoration(
                    color: AppColors.activeCalendar,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 13,
                      ),
                      FaIcon(
                        FontAwesomeIcons.search,
                        size: 18,
                        color: AppColors.white,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Search",
                        style: TextStyles.regular_14,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Featured Today",
                  style: TextStyles.bold_30,
                ),
                SizedBox(
                  height: 20,
                ),

                //KONTEN YG DISCROLL KE SAMPING
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                    color: AppColors.activeCalendar,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Text(
                      "Phsychologist",
                      style: TextStyles.bold_30,
                    ),
                    Padding(padding: EdgeInsets.all(25)),
                    Text(
                      "View More >",
                      style: TextStyles.regular_18,
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),

                //PSIKOLOG
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  height: 100,
                  // color: Colors.amber,
                  width: double.maxFinite,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Container(
                          child: ProfilePsikolog(
                              imagePsikolog:
                                  'assets/images/discovery_page/psikolog/ChenZheyuan.jpg',
                              namePsikolog: 'Chen Zheyuan'),
                        ),
                        Padding(padding: EdgeInsets.all(8)),
                        Container(
                          child: ProfilePsikolog(
                              imagePsikolog:
                                  'assets/images/discovery_page/psikolog/MarkLee.jpg',
                              namePsikolog: 'Mark Lee'),
                        ),
                        Padding(padding: EdgeInsets.all(8)),
                        Container(
                          child: ProfilePsikolog(
                              imagePsikolog:
                                  'assets/images/discovery_page/psikolog/ZhouYiran.jpg',
                              namePsikolog: 'Zhou Yiran'),
                        ),
                        Padding(padding: EdgeInsets.all(8)),
                        Container(
                          child: ProfilePsikolog(
                              imagePsikolog:
                                  'assets/images/discovery_page/psikolog/SongEunseok.jpg',
                              namePsikolog: 'Song Eunseok'),
                        ),
                        Padding(padding: EdgeInsets.all(8)),
                        Container(
                          child: ProfilePsikolog(
                              imagePsikolog:
                                  'assets/images/discovery_page/psikolog/Joel.jpeg',
                              namePsikolog: 'Joeliardo Leviothniel'),
                        ),
                        Padding(padding: EdgeInsets.all(8)),
                        Container(
                          child: ProfilePsikolog(
                              imagePsikolog:
                                  'assets/images/discovery_page/psikolog/ChenZheyuan.jpg',
                              namePsikolog: 'Chen Zheyuan'),
                        ),
                        Padding(padding: EdgeInsets.all(8)),
                        Container(
                          child: ProfilePsikolog(
                              imagePsikolog:
                                  'assets/images/discovery_page/psikolog/MarkLee.jpg',
                              namePsikolog: 'Mark Lee'),
                        ),
                        Padding(padding: EdgeInsets.all(8)),
                        Container(
                          child: ProfilePsikolog(
                              imagePsikolog:
                                  'assets/images/discovery_page/psikolog/ZhouYiran.jpg',
                              namePsikolog: 'Zhou Yiran'),
                        ),
                        Padding(padding: EdgeInsets.all(8)),
                        Container(
                          child: ProfilePsikolog(
                              imagePsikolog:
                                  'assets/images/discovery_page/psikolog/SongEunseok.jpg',
                              namePsikolog: 'Song Eunseok'),
                        ),
                        Padding(padding: EdgeInsets.all(8)),
                        Container(
                          child: ProfilePsikolog(
                              imagePsikolog:
                                  'assets/images/discovery_page/psikolog/Joel.jpeg',
                              namePsikolog: 'Joeliardo Leviothniel'),
                        ),
                        Padding(padding: EdgeInsets.all(8)),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Text(
                      "Habits",
                      style: TextStyles.bold_30,
                    ),
                    SizedBox(
                      width: 150,
                    ),
                    Text(
                      "View More >",
                      style: TextStyles.regular_18,
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),

                //BUAT HABITS
                CarouselSlider(
                  items: [
                    Container(
                      width: 350,
                      child: ContainerHabits(
                          titleHabits: "Gym",
                          descHabits:
                              "Gym is the best idea for you who want to build a healthy life. You can go to the gym center or do in your bedroom.",
                          imageHabits: 'assets/images/discovery_page/gym.png'),
                    ),
                    Container(
                      width: 350,
                      child: ContainerHabits(
                          titleHabits: "Running",
                          descHabits:
                              "Let's run! Running is one of many cardios exercise. Run can improve your agility.",
                          imageHabits:
                              'assets/images/discovery_page/running.png'),
                    ),
                    Container(
                      width: 350,
                      child: ContainerHabits(
                          titleHabits: "Study Flutter",
                          descHabits:
                              "Study Flutter everyday can make us get the best mark in Software Engineering class. We can do it by watching youtube videos",
                          imageHabits:
                              'assets/images/discovery_page/study.png'),
                    ),
                  ],
                  options: CarouselOptions(
                      height: 250,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      aspectRatio: 1 / 1,
                      // enableInfiniteScroll: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration: Duration(milliseconds: 2000),
                      viewportFraction: 0.8),
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: NavBar(),
      ),
    );
  }

  // Widget _buildPsikologProfile(psikologData psikolog) {
  //   return Container(
  //     height: 300,
  //     decoration: BoxDecoration(
  //       color: AppColors.activeCalendar,
  //       borderRadius: BorderRadius.circular(12),
  //     ),
  //     child: Column(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: [
  //         CircleAvatar(
  //           radius: 50,
  //           backgroundImage: NetworkImage(psikolog.imagePsikolog),
  //         ),
  //         SizedBox(
  //           height: 10,
  //         ),
  //         Text(
  //           psikolog.namePsikolog,
  //           style: TextStyles.GR_15_bold,
  //         ),
  //         SizedBox(
  //           height: 10,
  //         ),
  //         Text(
  //           psikolog.descPsikolog,
  //           style: TextStyles.GR_14_light,
  //         ),
  //         SizedBox(
  //           height: 20,
  //         ),
  //         ElevatedButton(
  //           onPressed: () {},
  //           child: Text('haha'),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
