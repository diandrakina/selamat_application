import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:selamat_application/styles/styles.dart';

class TimingHomePage extends StatefulWidget {
  final IconData icon;
  final String text1;
  final String text2;
  final Color colorIcon;
  final double sizeIcon;

  const TimingHomePage(
      {Key? key,
      required this.icon,
      required this.text1,
      required this.text2,
      required this.colorIcon,
      required this.sizeIcon})
      : super(key: key);

  @override
  _TimingHomePageState createState() => _TimingHomePageState();
}

class _TimingHomePageState extends State<TimingHomePage> {
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.all(8),
        ),
        FaIcon(
          widget.icon,
          size: widget.sizeIcon,
          color: widget.colorIcon,
        ),
        Padding(padding: EdgeInsets.all(5)),
        Text(
          widget.text1,
          style: TextStyles.bold_30,
        ),
        Padding(padding: EdgeInsets.all(2)),
        Text(
          widget.text2,
          style: TextStyles.light_18,
        )

        // Container(
        //   width: 150,
        //   height: 150,
        //   decoration: BoxDecoration(
        //       color: isClicked ? AppColors.deadBlue : AppColors.floatingGrey,
        //       borderRadius: BorderRadius.circular(16)),
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     crossAxisAlignment: CrossAxisAlignment.center,
        //     children: [
        //       // Icon(
        //       //   widget.icon as IconData?,
        //       //   size: 35,
        //       //   color: isClicked ? Colors.white : widget.colorIcon,
        //       // ),
        //       FaIcon(
        //         widget.icon,
        //         size: 35,
        //         color: isClicked ? Colors.white : widget.colorIcon,
        //       ),
        //       SizedBox(height: 5),
        //       Text(
        //         widget.text,
        //         style: TextStyles.bold_18,
        //         maxLines: 2,
        //         textAlign: TextAlign.center,
        //       ),
        //     ],
        //   ),
        // ),
      ],
    );
  }
}
