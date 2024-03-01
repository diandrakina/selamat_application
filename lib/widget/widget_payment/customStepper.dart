import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:selamat_application/styles/styles.dart';

class StepperComponent extends StatefulWidget {
  final bool status1;
  final bool status2;
  final bool status3;

  const StepperComponent(
      {super.key,
      required this.status1,
      required this.status2,
      required this.status3});

  @override
  State<StepperComponent> createState() => _StepperComponentState();
}

class _StepperComponentState extends State<StepperComponent> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(padding: EdgeInsets.only(left: 50)),
        //1
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: widget.status1
                        ? AppColors.pastelGreenHealth
                        : AppColors.white,
                    border: Border.all(
                      color: widget.status1
                          ? AppColors.pastelGreenHealth
                          : AppColors.white,
                    ),
                  ),
                ),
                Container(
                  height: 2,
                  width: 100,
                  color: widget.status2
                      ? AppColors.pastelGreenHealth
                      : AppColors.white,
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              transform: Matrix4.translationValues(-13.0, 0.0, 0.0),
              child: Text(
                "Isi detail",
                style: TextStyles.light_14,
              ),
            ),
          ],
        ),

        //2
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: widget.status2
                        ? AppColors.pastelGreenHealth
                        : AppColors.white,
                    border: Border.all(
                      color: widget.status2
                          ? AppColors.pastelGreenHealth
                          : AppColors.white,
                    ),
                  ),
                ),
                Container(
                  height: 2,
                  width: 100,
                  color: widget.status3
                      ? AppColors.pastelGreenHealth
                      : AppColors.white,
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              transform: Matrix4.translationValues(-10.0, 0.0, 0.0),
              child: Text(
                "Metode",
                style: TextStyles.light_14,
              ),
            ),
          ],
        ),

        //3
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: widget.status3
                        ? AppColors.pastelGreenHealth
                        : AppColors.white,
                    border: Border.all(
                      color: widget.status3
                          ? AppColors.pastelGreenHealth
                          : AppColors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              transform: Matrix4.translationValues(-20.0, 0.0, 0.0),
              child: Text(
                "Konfirmasi",
                style: TextStyles.light_14,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
