import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:selamat_application/styles/styles.dart';

class TimeIndividualBar {
  final int x;
  final double y;

  TimeIndividualBar({required this.x, required this.y});
}

class BarData {
  final double senin;
  final double selasa;
  final double rabu;
  final double kamis;
  final double jumat;
  final double sabtu;
  final double minggu;

  BarData(
      {required this.senin,
      required this.selasa,
      required this.rabu,
      required this.kamis,
      required this.jumat,
      required this.sabtu,
      required this.minggu});

  List<TimeIndividualBar> barData = [];
  //Initializez Bar Data
  void initializeBarData() {
    barData = [
      //Senin
      TimeIndividualBar(x: 0, y: senin),
      //Selasa
      TimeIndividualBar(x: 1, y: selasa),
      //Rabu
      TimeIndividualBar(x: 2, y: rabu),
      //Kamis
      TimeIndividualBar(x: 3, y: kamis),
      //Jumat
      TimeIndividualBar(x: 4, y: jumat),
      //Sabtu
      TimeIndividualBar(x: 5, y: sabtu),
      //Minggu
      TimeIndividualBar(x: 6, y: minggu)
    ];
  }
}

class TimeBarData {
  final double timeStart;
  final double timeEnd;

  TimeBarData({required this.timeStart, required this.timeEnd});

  List<TimeIndividualBar> barData = [];

  //initialize Bar Data
  void initializeBarData() {
    barData = [TimeIndividualBar(x: 0, y: 1)];
  }
}

class TimeChart extends StatelessWidget {
  final List dailyTime;
  final Color color;
  final Duration animDuration = const Duration(milliseconds: 200);

  const TimeChart({Key? key, required this.dailyTime, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isPlaying = true;
    BarData timeChart = BarData(
      senin: dailyTime[0],
      selasa: dailyTime[1],
      rabu: dailyTime[2],
      kamis: dailyTime[3],
      jumat: dailyTime[4],
      sabtu: dailyTime[5],
      minggu: dailyTime[6],
    );

    timeChart.initializeBarData();
    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.spaceAround,
        maxY: 3,
        minY: 0,
        gridData: FlGridData(
            show: true,
            drawVerticalLine: false,
            getDrawingHorizontalLine: (value) =>
                FlLine(color: AppColors.floatingGrey, strokeWidth: 1)),
        borderData: FlBorderData(show: false),
        titlesData: FlTitlesData(
          show: true,
          topTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          leftTitles: AxisTitles(
            drawBelowEverything: true,
            sideTitles: SideTitles(
                interval: 1,
                showTitles: true,
                getTitlesWidget: getLeftTitles,
                reservedSize: 30),
          ),
          rightTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                  showTitles: true, getTitlesWidget: getBottomTitles)),
        ),
        barGroups: timeChart.barData
            .map(
              (data) => BarChartGroupData(
                x: data.x,
                barRods: [
                  BarChartRodData(
                      toY: dailyTime[data.x],
                      color: color,
                      width: 30,
                      borderRadius: BorderRadius.circular(0))
                ],
              ),
            )
            .toList(),
      ),
    );
  }

  Widget getLeftTitles(double value, TitleMeta meta) {
    if (value == meta.max + 1) {
      return Container();
    }
    return SideTitleWidget(
        child: Text(
          meta.formattedValue,
          style: TextStyles.GR_14_light,
        ),
        axisSide: meta.axisSide);
  }

  Widget getBottomTitles(double value, TitleMeta meta) {
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = Text(
          'Mon',
          style: TextStyles.GR_12_light,
        );
        break;
      case 1:
        text = Text(
          'Tue',
          style: TextStyles.GR_12_light,
        );
        break;
      case 2:
        text = Text(
          'Wed',
          style: TextStyles.GR_12_light,
        );
        break;
      case 3:
        text = Text(
          'Thu',
          style: TextStyles.GR_12_light,
        );
        break;
      case 4:
        text = Text(
          'Fri',
          style: TextStyles.GR_12_light,
        );
        break;
      case 5:
        text = Text(
          'Sat',
          style: TextStyles.GR_12_light,
        );
        break;
      case 6:
        text = Text(
          'Sun',
          style: TextStyles.GR_12_light,
        );
        break;
      default:
        text = Text(
          "",
          style: TextStyles.GR_12_light,
        );
        break;
    }
    return SideTitleWidget(child: text, axisSide: meta.axisSide);
  }
}
