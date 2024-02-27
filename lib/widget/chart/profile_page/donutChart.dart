import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:selamat_application/styles/styles.dart';

class DonutChart extends StatefulWidget {
  final double value;
  final Color color;
  const DonutChart({Key? key, required this.value, required this.color});

  @override
  State<DonutChart> createState() => _DonutChartState();
}

class _DonutChartState extends State<DonutChart> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          child: Stack(
            children: [
              Container(
                // color: Colors.amber,
                height: 50,
                width: 50,
                child: PieChart(
                  PieChartData(
                    startDegreeOffset: 270,
                    sectionsSpace: 0,
                    centerSpaceRadius: 25,
                    sections: [
                      PieChartSectionData(
                          //set values
                          value: widget.value,
                          color: widget.color,
                          radius: 8,
                          showTitle: false),
                      PieChartSectionData(
                          //set values
                          value: (100 - widget.value),
                          color: AppColors.activeCalendar,
                          radius: 8,
                          showTitle: false),
                    ],
                  ),
                ),
              ),
              //TITLE DI TENGAHNYA
              Positioned.fill(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(shape: BoxShape.circle),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${widget.value.toInt()}%",
                            style: TextStyles.bold_14,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
