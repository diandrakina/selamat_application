import 'package:flutter/material.dart';
import 'package:selamat_application/styles/styles.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Welcome!',
          style: TextStyles.GR_42_bold,
        ),
      ),
    );
  }
}
