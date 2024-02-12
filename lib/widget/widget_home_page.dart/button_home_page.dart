import 'package:flutter/material.dart';
import 'package:selamat_application/styles/styles.dart';

class ButtonHomePage extends StatelessWidget {
  final String buttonText;
  final Function onPressed;

  ButtonHomePage({required this.buttonText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 130,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: AppColors.floatingGrey,
      ),
      child: TextButton(
        onPressed: () => onPressed(),
        child: Text(
          buttonText,
          style: TextStyles.regular_14,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
