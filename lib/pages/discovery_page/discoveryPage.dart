import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:selamat_application/pages/discovery_page/discoverPsychologist.dart';
import 'package:selamat_application/pages/discovery_page/habitPage.dart';
import 'package:selamat_application/styles/styles.dart';
import 'package:selamat_application/widget/drawerWidget.dart';
import 'package:selamat_application/widget/navbar.dart';
import 'package:selamat_application/widget/searchBar.dart';
import 'package:selamat_application/widget/widget_discovery/containerPsikolog.dart';
import 'package:selamat_application/widget/widget_discovery/container_habits.dart';
import 'package:selamat_application/widget/widget_discovery/container_profile_psikolog.dart';
import 'package:selamat_application/widget/widget_login_register/customElevatedButton.dart';

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

        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //FEATURED DOCTOR
                Row(
                  children: [
                    SizedBox(
                      width: 260,
                      child: Text(
                        "Featured Psychologist",
                        style: TextStyles.bold_24,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) =>
                                const DiscoverPsychologist()),
                          ),
                        );
                      },
                      child: Text(
                        "View More >",
                        style: TextStyles.regular_14,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),

                const ContainerPsikolog(
                  image:
                      "assets/images/discovery_page/psikolog/ChenZheyuan.jpg",
                  name: "Chen Zheyuan",
                  price: "500.000",
                  rating: 5.0,
                  speciality: "Psikolog Klinis",
                  years: 23,
                  kiriAtas: 12,
                  kananAtas: 12,
                  kiriBawah: 0,
                  kananBawah: 0,
                ),
                const Divider(
                  color: AppColors.activeCalendar,
                  height: 0,
                  thickness: 2,
                ),
                const ContainerPsikolog(
                  image:
                      "assets/images/discovery_page/psikolog/ChenZheyuan.jpg",
                  name: "Chen Zheyuan",
                  price: "500.000",
                  rating: 5.0,
                  speciality: "Psikolog Klinis",
                  years: 23,
                  kiriAtas: 0,
                  kananAtas: 0,
                  kiriBawah: 12,
                  kananBawah: 12,
                ),
                const SizedBox(
                  height: 20,
                ),

                //HABITS
                Row(
                  children: [
                    SizedBox(
                      width: 260,
                      child: Text(
                        "Habits",
                        style: TextStyles.bold_24,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => const HabitPage()),
                          ),
                        );
                      },
                      child: Text(
                        "View More >",
                        style: TextStyles.regular_14,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                CarouselSlider(
                  items: const [
                    SizedBox(
                      width: 350,
                      child: ContainerHabits(
                          titleHabits: "Gym",
                          descHabits:
                              "Gym is the best idea for you who want to build a healthy life. You can go to the gym center or do in your bedroom.",
                          imageHabits: 'assets/images/discovery_page/gym.png'),
                    ),
                    SizedBox(
                      width: 350,
                      child: ContainerHabits(
                          titleHabits: "Running",
                          descHabits:
                              "Let's run! Running is one of many cardios exercise. Run can improve your agility.",
                          imageHabits:
                              'assets/images/discovery_page/running.png'),
                    ),
                    SizedBox(
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
                      height: 270,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      aspectRatio: 1 / 1,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 2000),
                      viewportFraction: 0.8),
                ),
                const SizedBox(
                  height: 30,
                ),

                //JOURNEY
                Text(
                  "Journeys",
                  style: TextStyles.bold_24,
                ),
                Text(
                  "Pilih journey yang sesuai dengan keseharianmu",
                  style: TextStyles.light_14,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ContainerHabitsRound(
                        iconHabit: FontAwesomeIcons.dumbbell,
                        nameHabit: "Exercise"),
                    ContainerHabitsRound(
                        iconHabit: Icons.monitor_heart, nameHabit: "Cardio"),
                    ContainerHabitsRound(
                        iconHabit: FontAwesomeIcons.glassWater,
                        nameHabit: "Drink Water"),
                    ContainerHabitsRound(
                        iconHabit: FontAwesomeIcons.solidFaceSmile,
                        nameHabit: "Happy"),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
        // bottomNavigationBar: const NavBar(),
      ),
    );
  }
}

class _circularContainer extends StatelessWidget {
  final double? height;
  final double? width;
  final double radius;
  final double padding;
  final EdgeInsets? margin;
  final Color bgColor;
  final Widget? child;
  const _circularContainer({
    super.key,
    this.height = 10,
    this.width = 40,
    this.radius = 24,
    this.padding = 0,
    this.margin,
    this.bgColor = AppColors.white,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      width: 40,
      margin: margin,
      decoration: BoxDecoration(
          color: AppColors.activeCalendar,
          borderRadius: BorderRadius.circular(24)),
    );
  }
}
