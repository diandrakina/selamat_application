import 'package:selamat_application/widget/chart/home_page_chart/tracking_duration/duration_individual_bar.dart';

class DurationBarData {
  final double timeStart;
  final double timeEnd;

  DurationBarData({required this.timeStart, required this.timeEnd});

  List<DurationIndividualBar> barData = [];

  //initialize Bar Data
  void initializeBarData() {
    barData = [DurationIndividualBar(x: 0, ystart: timeStart, yend: timeEnd)];
  }
  /*HITUNGAN
  JAM = 24
  MENIT = 60
  PANJANG BAR = 24*60 = 1440*/
}
