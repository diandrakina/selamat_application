import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:selamat_application/styles/styles.dart';

class CustomBoxGoals extends StatefulWidget {
  final IconData icon;
  final String text;
  final Color colorIcon;

  const CustomBoxGoals(
      {Key? key,
      required this.icon,
      required this.text,
      required this.colorIcon})
      : super(key: key);

  @override
  _CustomBoxGoalsState createState() => _CustomBoxGoalsState();
}

class _CustomBoxGoalsState extends State<CustomBoxGoals> {
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isClicked = !isClicked;
        });
      },
      child: Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
            color: isClicked ? AppColors.deadBlue : AppColors.floatingGrey,
            borderRadius: BorderRadius.circular(16)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Icon(
            //   widget.icon as IconData?,
            //   size: 35,
            //   color: isClicked ? Colors.white : widget.colorIcon,
            // ),
            FaIcon(
              widget.icon,
              size: 35,
              color: isClicked ? Colors.white : widget.colorIcon,
            ),
            SizedBox(height: 5),
            Text(
              widget.text,
              style: TextStyles.bold_18,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
