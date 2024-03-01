import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:selamat_application/styles/styles.dart';

class ScheduleAction extends StatefulWidget {
  final String time;
  final IconData icon;
  final String activity;

  const ScheduleAction(
      {Key? key,
      required this.activity,
      required this.icon,
      required this.time});

  @override
  State<ScheduleAction> createState() => _ScheduleActionState();
}

class _ScheduleActionState extends State<ScheduleAction> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Slidable(
        //start
        startActionPane: ActionPane(
          extentRatio: 0.25,
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: ((context) {}),
              icon: FontAwesomeIcons.circleCheck,
              backgroundColor: AppColors.pastelGreenHealth,
              foregroundColor: AppColors.white,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12)),
            )
          ],
        ),

        //end
        endActionPane: ActionPane(
          extentRatio: 0.5,
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: ((context) {}),
              icon: FontAwesomeIcons.penToSquare,
              foregroundColor: AppColors.white,
              backgroundColor: AppColors.successStreak,
            ),
            SlidableAction(
              onPressed: ((context) {}),
              icon: FontAwesomeIcons.trashCan,
              foregroundColor: AppColors.white,
              backgroundColor: AppColors.pastelRed,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            )
          ],
        ),
        child: Container(
          height: 50,
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: AppColors.darkModeCard,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              Text(
                widget.time,
                style: TextStyles.regular_18,
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                height: 30,
                width: 30,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.black),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FaIcon(
                      widget.icon,
                      size: 20,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                width: 200,
                child: Text(
                  widget.activity,
                  style: TextStyles.regular_18,
                ),
              ),
              Container(
                height: 30,
                width: 30,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.black),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FaIcon(
                      Icons.alarm,
                      size: 20,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
