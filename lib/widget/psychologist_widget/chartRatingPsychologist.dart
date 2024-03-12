import 'package:flutter/material.dart';
import 'package:selamat_application/styles/styles.dart';

class ChartRatingPsychologist extends StatefulWidget {
  const ChartRatingPsychologist({super.key});

  @override
  State<ChartRatingPsychologist> createState() =>
      _ChartRatingPsychologistState();
}

class _ChartRatingPsychologistState extends State<ChartRatingPsychologist> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      child: Column(
        children: [
          _chartRow(context, 0, 1),
          _chartRow(context, 5, 2),
          _chartRow(context, 5, 3),
          _chartRow(context, 10, 4),
          _chartRow(context, 80, 5),
        ],
      ),
    );
  }

  Widget _chartRow(BuildContext context, int pct, int star) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            width: 80,
            child: LinearProgressIndicator(
              value: pct / 100,
              minHeight: 11,
              backgroundColor: AppColors.activeCalendar,
              color: AppColors.baseColor,
              borderRadius: BorderRadiusDirectional.circular(20),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          "${star}",
          style: TextStyles.GR_16_bold,
        )
      ],
    );
  }
}
