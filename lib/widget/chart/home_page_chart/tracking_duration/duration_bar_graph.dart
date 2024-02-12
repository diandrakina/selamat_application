import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:selamat_application/styles/styles.dart';
import 'package:selamat_application/widget/chart/home_page_chart/tracking_duration/duration_bar_data.dart';

class DurationBarGraph extends StatelessWidget {
  final List timeStart;
  final List timeEnd;
  final Color barColor;

  final BoxDecoration? decoration;
  const DurationBarGraph(
      {Key? key,
      required this.timeStart,
      required this.timeEnd,
      required this.barColor,
      this.decoration})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    DurationBarData barGraph_duration =
        DurationBarData(timeStart: timeStart[0], timeEnd: timeEnd[0]);
    barGraph_duration.initializeBarData();
    return RotatedBox(
      quarterTurns: -1,
      child: BarChart(
        BarChartData(
          maxY: 1440,
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
          barGroups: barGraph_duration.barData
              .map(
                (data) => BarChartGroupData(
                  x: data.x,
                  barRods: [
                    BarChartRodData(
                        fromY: timeStart[data.x],
                        toY: timeEnd[data.x],
                        width: 20,
                        color: barColor,
                        borderRadius: BorderRadius.circular(0),
                        backDrawRodData: BackgroundBarChartRodData(
                            show: true,
                            color: AppColors.activeCalendar,
                            toY: 1440)),
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
