import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:selamat_application/styles/styles.dart';
import 'package:selamat_application/widget/chart/home_page_chart/tracking_time/bar_data.dart';

class BarGraph_Time extends StatelessWidget {
  final List activityTime; // [exerciseTime, workTime, leisureTime]
  final Duration animDuration = const Duration(milliseconds: 200);

  const BarGraph_Time({Key? key, required this.activityTime}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isPlaying = false;
    //initialize bar data
    BarData barGraph_Time = BarData(
        exerciseTime: activityTime[0],
        workTime: activityTime[1],
        leisureTime: activityTime[2]);

    List<Color> barColors = [
      AppColors.pastelRed,
      AppColors.baseColor,
      AppColors.pastelGreenHealth
    ];

    barGraph_Time.initializeBarData();
    return BarChart(
      BarChartData(
        maxY: 50,
        minY: 0,
        gridData: FlGridData(show: false),
        borderData: FlBorderData(show: false),
        titlesData: FlTitlesData(
          show: true,
          topTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          rightTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
        ),
        barGroups: barGraph_Time.barData
            .map(
              (data) => BarChartGroupData(
                x: data.x,
                barRods: [
                  BarChartRodData(
                      toY: activityTime[data.x],
                      color: barColors[data.x],
                      width: 30,
                      borderRadius: BorderRadius.circular(12))
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}
