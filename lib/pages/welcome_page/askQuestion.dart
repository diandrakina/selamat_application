import 'package:flutter/material.dart';
import 'package:selamat_application/styles/styles.dart';

class AskQuestion extends StatelessWidget {
  const AskQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Before we start\nLet me ask you some questions',
          style: TextStyles.GR_42_bold,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
