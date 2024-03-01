import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:selamat_application/styles/styles.dart';
import 'package:selamat_application/widget/drawerWidget.dart';
import 'package:selamat_application/widget/navbar.dart';
import 'package:selamat_application/widget/searchBar.dart';
import 'package:selamat_application/widget/widget_schedule/notesBox.dart';
import 'package:selamat_application/widget/widget_schedule/scheduleBox.dart';

class ActivityPage extends StatefulWidget {
  const ActivityPage({super.key});

  @override
  State<ActivityPage> createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                  const FaIcon(
                    FontAwesomeIcons.solidCommentDots,
                    size: 25,
                    color: AppColors.white,
                  ),
                ],
              ),
            );
          }),
        ),

        //DRAWER
        drawer: const DrawerWidget(),

        //BODY
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: const Column(
              children: [
                SizedBox(
                  height: 16,
                ),
                ScheduleBox(
                  profilePict:
                      "assets/images/discovery_page/psikolog/Joel.jpeg",
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
                NotesBox(
                  profilePict:
                      "assets/images/discovery_page/psikolog/Joel.jpeg",
                  username: "lookaforwin",
                  desc:
                      "YAA BOYY I JUST TRAIN SO HARD, I CAN GET THAT 81+ POINTS ASAP BROOO. SEE U NEXT WEEK!",
                  comment: 34.1,
                  hours: 3,
                  likes: 76.1,
                  status: true,
                ),
              ],
            ),
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
        bottomNavigationBar: NavBar(),
      ),
    );
  }
}
