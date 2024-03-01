import 'package:flutter/material.dart';
import 'package:selamat_application/widget/widget_schedule/scheduleAction.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: const Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                ScheduleAction(
                  icon: Icons.sunny,
                  activity: "Wake Up",
                  time: "06.00",
                ),
                SizedBox(
                  height: 20,
                ),

                //work
                ScheduleAction(
                  icon: Icons.work,
                  activity: "Work",
                  time: "09.00",
                ),
                SizedBox(
                  height: 20,
                ),

                //lunch
                ScheduleAction(
                  icon: Icons.sunny,
                  activity: "Lunch",
                  time: "12.00",
                ),
                SizedBox(
                  height: 20,
                ),

                //Exercise
                ScheduleAction(
                  icon: Icons.sunny,
                  activity: "Wake Up",
                  time: "06.00",
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
