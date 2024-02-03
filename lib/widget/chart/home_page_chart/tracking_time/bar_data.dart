import 'package:selamat_application/widget/chart/home_page_chart/tracking_time/individual_bar.dart';

class BarData {
  final double exerciseTime;
  final double workTime;
  final double leisureTime;

  BarData(
      {required this.exerciseTime,
      required this.workTime,
      required this.leisureTime});

  List<IndividualBar> barData = [];
  //Initializez Bar Data
  void initializeBarData() {
    barData = [
      //exercise
      IndividualBar(x: 0, y: exerciseTime),
      //work
      IndividualBar(x: 1, y: workTime),
      //leisure
      IndividualBar(x: 2, y: leisureTime)
    ];
  }
}
