import 'package:flutter/material.dart';
import 'package:selamat_application/styles/styles.dart';
import 'package:selamat_application/widget/chart/home_page_chart/tracking_duration/duration_bar_graph.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  List<double> timeStart = [519.0];

  List<double> timeEnd = [939.0];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SizedBox(
          height: 20,
          width: 115,
          child: DurationBarGraph(
              timeStart: timeStart,
              timeEnd: timeEnd,
              barColor: AppColors.bluePowder),
        ),
      ),
    );
  }
}
