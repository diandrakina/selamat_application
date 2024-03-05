import 'package:flutter/material.dart';
import 'package:selamat_application/widget/widget_schedule/scheduleAction.dart';

class AllSchedule extends StatefulWidget {
  const AllSchedule({super.key});

  @override
  State<AllSchedule> createState() => _AllScheduleState();
}

class _AllScheduleState extends State<AllSchedule> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 60),
              child: const Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  ScheduleAction(
                    icon: Icons.sunny,
                    activity: "Wake Up",
                    time: "06.00",
                    repeat: true,
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  //work
                  ScheduleAction(
                    icon: Icons.work,
                    activity: "Work",
                    time: "09.00",
                    repeat: true,
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  //lunch
                  ScheduleAction(
                    icon: Icons.sunny,
                    activity: "Lunch",
                    time: "12.00",
                    repeat: true,
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  //Exercise
                  ScheduleAction(
                    icon: Icons.sunny,
                    activity: "Wake Up",
                    time: "06.00",
                    repeat: true,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
