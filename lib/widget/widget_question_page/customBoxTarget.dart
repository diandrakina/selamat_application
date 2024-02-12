import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:selamat_application/styles/styles.dart';

class CustomBoxTarget extends StatefulWidget {
  final IconData icon;
  final String text;

  const CustomBoxTarget({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  _CustomBoxTargetState createState() => _CustomBoxTargetState();
}

class _CustomBoxTargetState extends State<CustomBoxTarget> {
  bool _isClicked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isClicked = !_isClicked;
        });
      },
      child: Container(
        width: 370,
        height: 45,
        decoration: BoxDecoration(
            color: _isClicked ? AppColors.baseColor : AppColors.darkModeCard,
            borderRadius: BorderRadius.circular(8)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 30),
            FaIcon(
              widget.icon,
              size: 24,
              color: _isClicked ? Colors.white : Colors.white,
            ),
            SizedBox(width: 30),
            Text(
              widget.text,
              style: TextStyles.regular_18,
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
    );
  }
}
