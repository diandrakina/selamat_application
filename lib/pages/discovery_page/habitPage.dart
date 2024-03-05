import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:selamat_application/pages/discovery_page/featuredHabitsPage.dart';
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
                const Padding(padding: EdgeInsets.all(5)),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const FaIcon(
                    Icons.arrow_back,
                    color: AppColors.white,
                    size: 25,
                  ),
                ),
                const Padding(padding: EdgeInsets.all(5)),
                SizedBox(
                  width: 300,
                  child: Text(
                    "Habits",
                    style: TextStyles.bold_30,
                  ),
                ),
                const FaIcon(
                  Icons.history,
                  size: 30,
                  color: Colors.white,
                )
              ],
            ),
          ),
        ),
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),

                //BOX SEARCH
                const CustomSearchBar(),
                const SizedBox(
                  height: 16,
                ),

                //MOST POPULAR
                Text(
                  "Most Popular",
                  style: TextStyles.medium_18,
                ),
                const SizedBox(
                  height: 8,
                ),
                const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SizedBox(
                    child: Row(
                      children: [
                        ContainerHabitsRound(
                            iconHabit: FontAwesomeIcons.solidBuilding,
                            nameHabit: 'Work Life Balance'),
                        SizedBox(
                          width: 8,
                        ),
                        ContainerHabitsRound(
                            // ignore: deprecated_member_use
                            iconHabit: FontAwesomeIcons.home,
                            nameHabit: 'Quality Time'),
                        SizedBox(
                          width: 8,
                        ),
                        ContainerHabitsRound(
                            iconHabit: FontAwesomeIcons.dumbbell,
                            nameHabit: 'Exercise'),
                        SizedBox(
                          width: 8,
                        ),
                        ContainerHabitsRound(
                            // ignore: deprecated_member_use
                            iconHabit: FontAwesomeIcons.solidSmile,
                            nameHabit: 'Daily Routine'),
                        SizedBox(
                          width: 8,
                        ),
                        ContainerHabitsRound(
                            iconHabit: FontAwesomeIcons.solidMoon,
                            nameHabit: 'Work Life Balance'),
                        SizedBox(
                          width: 8,
                        ),
                        ContainerHabitsRound(
                            // ignore: deprecated_member_use
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
                const Padding(padding: EdgeInsets.all(10)),
                Text(
                  "Featured habits",
                  style: TextStyles.bold_30,
                ),
                const Padding(padding: EdgeInsets.all(8)),
                CarouselSlider(
                  items: const [
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
                      height: 320,
                      enlargeCenterPage: true,
                      aspectRatio: 1 / 1,
                      enableInfiniteScroll: true,
                      viewportFraction: 1),
                ),

                //YOUR RECENT HABITS
                const Padding(padding: EdgeInsets.all(10)),
                Text(
                  "Your recent habits",
                  style: TextStyles.bold_30,
                ),
                const Padding(padding: EdgeInsets.all(8)),
                const Row(
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
                const Padding(padding: EdgeInsets.all(10)),
                Text(
                  "Exercise",
                  style: TextStyles.bold_30,
                ),
                const Padding(padding: EdgeInsets.all(8)),
                const Row(
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
                const SizedBox(
                  height: 40,
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

class ContainerHabitsRound extends StatefulWidget {
  final IconData iconHabit;
  final String nameHabit;
  const ContainerHabitsRound(
      {Key? key, required this.iconHabit, required this.nameHabit});

  @override
  State<ContainerHabitsRound> createState() => _ContainerHabitsRoundState();
}

class _ContainerHabitsRoundState extends State<ContainerHabitsRound> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      width: 70,
      child: Column(children: [
        Container(
          height: 60,
          decoration: const BoxDecoration(
              shape: BoxShape.circle, color: AppColors.activeCalendar),
          child: Center(
            child: FaIcon(
              widget.iconHabit,
              size: 30,
              color: AppColors.white,
            ),
          ),
        ),
        const Padding(padding: EdgeInsets.all(2)),
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
          const Padding(padding: EdgeInsets.all(50)),
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
            padding: const EdgeInsets.all(10),
            child: CustomElevatedButton(
              text: "See Details",
              buttonTextStyle: TextStyles.bold_16,
              buttonStyle: CustomButtonStyles.buttonBlue,
              height: 35,
              width: 130,
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
      height: 320,
      width: double.maxFinite,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(widget.bgFeaturedHabits), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(12)),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            widget.nameHabits,
            style: TextStyles.bold_30,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
          const Padding(padding: EdgeInsets.all(8)),
          Expanded(
            child: Text(
              widget.descHabits,
              style: TextStyles.light_18,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const Padding(padding: EdgeInsets.all(8)),
          Row(
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        widget.rating.toString(),
                        style: TextStyles.regular_18,
                      ),
                      const Padding(padding: EdgeInsets.all(2)),
                      const FaIcon(
                        Icons.star,
                        size: 25,
                        color: Colors.yellow,
                      )
                    ],
                  ),
                  const Padding(padding: EdgeInsets.all(5)),
                  Row(
                    children: [
                      const FaIcon(
                        Icons.share,
                        color: Colors.white,
                      ),
                      const Padding(padding: EdgeInsets.all(2)),
                      Text(
                        widget.share.toString(),
                        style: TextStyles.regular_18,
                      ),
                    ],
                  )
                ],
              ),
              const Padding(padding: EdgeInsets.all(16)),
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
                  const Padding(padding: EdgeInsets.all(5)),
                  Row(
                    children: [
                      const FaIcon(
                        Icons.person,
                        color: Colors.white,
                      ),
                      const Padding(padding: EdgeInsets.all(2)),
                      Text(
                        widget.person.toString(),
                        style: TextStyles.regular_18,
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
          const Padding(padding: EdgeInsets.all(8)),
          CustomElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) => const FeaturedHabitsPage()),
                ),
              );
            },
            text: "Enroll",
            buttonTextStyle: TextStyles.bold_18,
            buttonStyle: CustomButtonStyles.buttonBlue2,
            height: 30,
            width: 150,
          )
        ],
      ),
    );
  }
}
