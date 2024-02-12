import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:selamat_application/styles/styles.dart';
import 'package:selamat_application/widget/navbar.dart';
import 'package:selamat_application/widget/searchBar.dart';
import 'package:selamat_application/widget/widget_login_register/customElevatedButton.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HabitPage extends StatefulWidget {
  const HabitPage({super.key});

  @override
  State<HabitPage> createState() => _HabitPageState();
}

class _HabitPageState extends State<HabitPage> {
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
                Text(
                  "Habits",
                  style: TextStyles.bold_30,
                ),
              ],
            ),
          ),
        ),
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),

                //BOX SEARCH
                CustomSearchBar(),
                SizedBox(
                  height: 16,
                ),

                //MOST POPULAR HABIT
                Text(
                  "Most Popular",
                  style: TextStyles.medium_18,
                ),
                SizedBox(
                  height: 8,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    child: Row(
                      children: [
                        ContainerHabits(
                            iconHabit: FontAwesomeIcons.solidBuilding,
                            nameHabit: 'Work Life Balance'),
                        SizedBox(
                          width: 8,
                        ),
                        ContainerHabits(
                            iconHabit: FontAwesomeIcons.home,
                            nameHabit: 'Quality Time'),
                        SizedBox(
                          width: 8,
                        ),
                        ContainerHabits(
                            iconHabit: FontAwesomeIcons.dumbbell,
                            nameHabit: 'Exercise'),
                        SizedBox(
                          width: 8,
                        ),
                        ContainerHabits(
                            iconHabit: FontAwesomeIcons.solidSmile,
                            nameHabit: 'Daily Routine'),
                        SizedBox(
                          width: 8,
                        ),
                        ContainerHabits(
                            iconHabit: FontAwesomeIcons.solidMoon,
                            nameHabit: 'Work Life Balance'),
                        SizedBox(
                          width: 8,
                        ),
                        ContainerHabits(
                            iconHabit: FontAwesomeIcons.golfBall,
                            nameHabit: 'Playing Golf'),
                        SizedBox(
                          width: 8,
                        ),
                      ],
                    ),
                  ),
                ),

                //FEATURED HABITS
                Padding(padding: EdgeInsets.all(10)),
                Text(
                  "Featured habits",
                  style: TextStyles.bold_30,
                ),
                Padding(padding: EdgeInsets.all(8)),
                CarouselSlider(
                  items: [
                    FeaturedHabits(
                        nameHabits: "Running",
                        descHabits:
                            "Running is a method of terrestrial locomotion by which humans and other animals move rapidly on foot. Running is a gait with an aerial phase in which all feet are above the ground (though there are exceptions). This is in contrast to walking, where one foot is always in contact with the ground, the legs are kept mostly straight, and the center of gravity vaults over the stance leg or legs in an inverted pendulum fashion.",
                        bgFeaturedHabits:
                            'assets/images/discovery_page/running.png',
                        month: 3,
                        person: 127,
                        rating: 4.8,
                        share: 823),
                    FeaturedHabits(
                        nameHabits: "Gym",
                        descHabits:
                            "A gym, short for gymnasium (pl.: gymnasiums or gymnasia), is an indoor venue for exercise and sports. The word is derived from the ancient Greek term gymnasion. They are commonly found in athletic and fitness centres, and as activity and learning spaces in educational institutions.",
                        bgFeaturedHabits:
                            'assets/images/discovery_page/gym.png',
                        month: 12,
                        person: 200,
                        rating: 4.5,
                        share: 82),
                    FeaturedHabits(
                        nameHabits: "Studying Compilation Techniques",
                        descHabits:
                            "Compilation technique is a technique that translates the source program into a final program for a particular computer language.",
                        bgFeaturedHabits:
                            'assets/images/discovery_page/study.png',
                        month: 4,
                        person: 35,
                        rating: 5.0,
                        share: 10),
                  ],
                  options: CarouselOptions(
                      height: 300,
                      enlargeCenterPage: true,
                      aspectRatio: 1 / 1,
                      enableInfiniteScroll: true,
                      viewportFraction: 1),
                ),

                //YOUR RECENT HABITS
                Padding(padding: EdgeInsets.all(10)),
                Text(
                  "Your recent habits",
                  style: TextStyles.bold_30,
                ),
                Padding(padding: EdgeInsets.all(8)),
                Row(
                  children: [
                    RecentHabits(
                        nameHabit: "Gym at AEON",
                        bgHabits: "assets/images/discovery_page/gym.png"),
                    SizedBox(
                      width: 20,
                    ),
                    RecentHabits(
                      nameHabit: "Study Laravel",
                      bgHabits: 'assets/images/discovery_page/study.png',
                    ),
                  ],
                ),

                //EXERCISE
                Padding(padding: EdgeInsets.all(10)),
                Text(
                  "Exercise",
                  style: TextStyles.bold_30,
                ),
                Padding(padding: EdgeInsets.all(8)),
                Row(
                  children: [
                    RecentHabits(
                        nameHabit: "Running with Frody",
                        bgHabits: "assets/images/discovery_page/running.png"),
                    SizedBox(
                      width: 20,
                    ),
                    RecentHabits(
                      nameHabit: "Playing Chess",
                      bgHabits: 'assets/images/discovery_page/catur.png',
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
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

class ContainerHabits extends StatefulWidget {
  final IconData iconHabit;
  final String nameHabit;
  const ContainerHabits(
      {Key? key, required this.iconHabit, required this.nameHabit});

  @override
  State<ContainerHabits> createState() => _ContainerHabitsState();
}

class _ContainerHabitsState extends State<ContainerHabits> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 70,
      child: Column(children: [
        Container(
          height: 60,
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: AppColors.activeCalendar),
          child: Center(
            child: FaIcon(
              widget.iconHabit,
              size: 30,
              color: AppColors.white,
            ),
          ),
        ),
        Padding(padding: EdgeInsets.all(2)),
        Text(
          widget.nameHabit,
          style: TextStyles.light_14,
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        )
      ]),
    );
  }
}

class RecentHabits extends StatefulWidget {
  final String nameHabit;
  final String bgHabits;

  const RecentHabits(
      {Key? key, required this.nameHabit, required this.bgHabits});

  @override
  State<RecentHabits> createState() => _RecentHabitsState();
}

class _RecentHabitsState extends State<RecentHabits> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
            image: AssetImage(widget.bgHabits), fit: BoxFit.cover),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(padding: EdgeInsets.all(60)),
          Expanded(
            child: Text(
              widget.nameHabit,
              style: TextStyles.bold_30,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: CustomElevatedButton(
              text: "See Details",
              textStyle: TextStyles.bold_18,
              height: 35,
              width: 120,
            ),
          ),
        ],
      ),
    );
  }
}

class FeaturedHabits extends StatefulWidget {
  final String bgFeaturedHabits;
  final String nameHabits;
  final String descHabits;
  final double rating;
  final int share;
  final int month;
  final int person;
  const FeaturedHabits(
      {Key? key,
      required this.bgFeaturedHabits,
      required this.nameHabits,
      required this.descHabits,
      required this.rating,
      required this.share,
      required this.month,
      required this.person});

  @override
  State<FeaturedHabits> createState() => _FeaturedHabitsState();
}

class _FeaturedHabitsState extends State<FeaturedHabits> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: double.maxFinite,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(widget.bgFeaturedHabits), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(12)),
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            widget.nameHabits,
            style: TextStyles.bold_30,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
          Padding(padding: EdgeInsets.all(8)),
          Expanded(
            child: Text(
              widget.descHabits,
              style: TextStyles.light_18,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Row(
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        '${widget.rating.toString()}',
                        style: TextStyles.regular_18,
                      ),
                      Padding(padding: EdgeInsets.all(2)),
                      FaIcon(
                        Icons.star,
                        size: 25,
                        color: Colors.yellow,
                      )
                    ],
                  ),
                  Padding(padding: EdgeInsets.all(5)),
                  Row(
                    children: [
                      FaIcon(
                        Icons.share,
                        color: Colors.white,
                      ),
                      Padding(padding: EdgeInsets.all(2)),
                      Text(
                        '${widget.share.toString()}',
                        style: TextStyles.regular_18,
                      ),
                    ],
                  )
                ],
              ),
              Padding(padding: EdgeInsets.all(16)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 25,
                    width: 100,
                    decoration: BoxDecoration(
                        color: AppColors.pastelRed,
                        borderRadius: BorderRadius.circular(12)),
                    child: Text(
                      "${widget.month} month",
                      style: TextStyles.regular_18,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(5)),
                  Row(
                    children: [
                      FaIcon(
                        Icons.person,
                        color: Colors.white,
                      ),
                      Padding(padding: EdgeInsets.all(2)),
                      Text(
                        '${widget.person.toString()}',
                        style: TextStyles.regular_18,
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
          Padding(padding: EdgeInsets.all(8)),
          CustomElevatedButton(
            text: "Enroll",
            height: 30,
            width: 150,
          )
        ],
      ),
    );
  }
}
