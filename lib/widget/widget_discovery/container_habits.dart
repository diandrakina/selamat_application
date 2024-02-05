import 'package:flutter/material.dart';
import 'package:selamat_application/styles/styles.dart';

class ContainerHabits extends StatefulWidget {
  final String titleHabits;
  final String descHabits;
  final String imageHabits;
  const ContainerHabits(
      {Key? key,
      required this.titleHabits,
      required this.descHabits,
      required this.imageHabits});

  @override
  State<ContainerHabits> createState() => _ContainerHabitsState();
}

class _ContainerHabitsState extends State<ContainerHabits> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      height: 200,
      width: 350,
      decoration: BoxDecoration(
        color: AppColors.activeCalendar,
        image: DecorationImage(
            image: AssetImage(widget.imageHabits), fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Padding(padding: EdgeInsets.all(20)),
          Text(
            widget.titleHabits,
            style: TextStyles.bold_24,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            height: 80,
            width: 200,
            child: Expanded(
              child: Text(
                widget.descHabits,
                style: TextStyles.GR_14_light,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            height: 30,
            decoration: BoxDecoration(
                color: AppColors.activeCalendar,
                borderRadius: BorderRadius.circular(8)),
            child: TextButton(
                onPressed: () {},
                child: Text(
                  "See Details",
                  style: TextStyles.GR_15_bold,
                )),
          )
        ],
      ),
    );
  }
}
