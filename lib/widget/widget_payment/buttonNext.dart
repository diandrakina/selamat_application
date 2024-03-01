import 'package:flutter/material.dart';
import 'package:selamat_application/styles/styles.dart';
import 'package:selamat_application/widget/widget_login_register/customElevatedButton.dart';

class ButtonNext extends StatefulWidget {
  final String title;
  const ButtonNext({Key? key, required this.title});

  @override
  State<ButtonNext> createState() => _ButtonNextState();
}

class _ButtonNextState extends State<ButtonNext> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: 100,
      child: CustomElevatedButton(
        height: 50,
        text: widget.title,
        buttonStyle: CustomButtonStyles.buttonBlue,
        buttonTextStyle: TextStyles.bold_18,
      ),
    );
  }
}
