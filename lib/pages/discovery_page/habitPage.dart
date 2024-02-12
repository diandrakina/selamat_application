import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:selamat_application/styles/styles.dart';

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
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                      color: AppColors.activeCalendar,
                      borderRadius: BorderRadius.circular(12)),
                ),

                //YOUR RECENT HABITS
                Padding(padding: EdgeInsets.all(10)),
                Text(
                  "Featured habits",
                  style: TextStyles.bold_30,
                ),
                Padding(padding: EdgeInsets.all(8)),
                Row(
                  children: [
                    Container(
                      height: 250,
                      width: 160,
                      decoration: BoxDecoration(
                          color: AppColors.activeCalendar,
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      height: 250,
                      width: 160,
                      decoration: BoxDecoration(
                          color: AppColors.activeCalendar,
                          borderRadius: BorderRadius.circular(12)),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                )
              ],
            ),
          ),
        ),
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
