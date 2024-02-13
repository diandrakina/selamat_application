import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:selamat_application/styles/styles.dart';
import 'package:selamat_application/widget/navbar.dart';
import 'package:selamat_application/widget/widget_login_register/customElevatedButton.dart';

import '../../widget/widget_discovery/container_profile_psikolog.dart';

class DiscoverPsychologist extends StatefulWidget {
  const DiscoverPsychologist({super.key});

  @override
  State<DiscoverPsychologist> createState() => _DiscoverPsychologistState();
}

class _DiscoverPsychologistState extends State<DiscoverPsychologist> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          leadingWidth: double.maxFinite,
          leading: Container(
            color: AppColors.bgDarkMode,
            child: Row(
              children: [
                Padding(padding: EdgeInsets.all(5)),
                FaIcon(
                  Icons.arrow_back,
                  color: AppColors.white,
                  size: 25,
                ),
                Padding(padding: EdgeInsets.all(5)),
                SizedBox(
                  width: 300,
                  child: Text(
                    "Psychologist",
                    style: TextStyles.bold_30,
                  ),
                ),
                FaIcon(
                  Icons.history,
                  color: AppColors.white,
                  size: 30,
                )
              ],
            ),
          ),
        ),

        //BODY
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Featured Psychologist",
                  style: TextStyles.bold_30,
                ),
                Padding(padding: EdgeInsets.all(8)),
                Container(
                  height: 180,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      color: AppColors.darkModeCard,
                      borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        height: 140,
                        width: 120,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/discovery_page/psikolog/ZhouYiran.jpg'),
                              fit: BoxFit.cover),
                        ),
                      ),
                      Padding(padding: EdgeInsets.all(10)),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Zhou Yiran",
                              style: TextStyles.bold_30,
                            ),
                            Text(
                              'psychologist',
                              style: TextStyles.regular_14,
                            ),
                            Padding(padding: EdgeInsets.all(2)),
                            Row(
                              children: [
                                Container(
                                  height: 25,
                                  width: 85,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      color: AppColors.activeCalendar),
                                  child: Row(
                                    children: [
                                      Padding(padding: EdgeInsets.all(2)),
                                      FaIcon(
                                        Icons.work,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                      Padding(padding: EdgeInsets.all(2)),
                                      Text(
                                        "23 years",
                                        style: TextStyles.bold_14,
                                      )
                                    ],
                                  ),
                                ),
                                Padding(padding: EdgeInsets.all(5)),
                                Container(
                                  height: 25,
                                  width: 56,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      color: AppColors.successStreak),
                                  child: Row(
                                    children: [
                                      Padding(padding: EdgeInsets.all(3)),
                                      Text(
                                        "4.9",
                                        style: TextStyles.bold_14,
                                      ),
                                      Padding(padding: EdgeInsets.all(2)),
                                      FaIcon(
                                        Icons.star,
                                        color: Colors.yellow,
                                        size: 20,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Padding(padding: EdgeInsets.all(2)),
                            Text(
                              'Rp 500.000',
                              style: TextStyles.bold_18,
                            ),
                            Padding(padding: EdgeInsets.all(2)),
                            CustomElevatedButton(
                              text: "Chat",
                              width: 150,
                              height: 30,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),

                //MOST POPULAR
                Row(
                  children: [
                    SizedBox(
                      width: 260,
                      child: Text(
                        "Most Popular",
                        style: TextStyles.bold_18,
                      ),
                    ),
                    Text(
                      "View More >",
                      style: TextStyles.regular_14,
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
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

                //BEST RATING
                Padding(padding: EdgeInsets.all(10)),
                Row(
                  children: [
                    SizedBox(
                      width: 260,
                      child: Text(
                        "Best Rating",
                        style: TextStyles.bold_18,
                      ),
                    ),
                    Text(
                      "View More >",
                      style: TextStyles.regular_14,
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
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

                //MOST EXPERIENCE
                Padding(padding: EdgeInsets.all(10)),
                Row(
                  children: [
                    SizedBox(
                      width: 260,
                      child: Text(
                        "Most Experience",
                        style: TextStyles.bold_18,
                      ),
                    ),
                    Text(
                      "View More >",
                      style: TextStyles.regular_14,
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
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
              ],
            ),
          ),
        ),
        bottomNavigationBar: NavBar(),
      ),
    );
  }
}
