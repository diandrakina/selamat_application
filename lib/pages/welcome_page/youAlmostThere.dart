import 'package:flutter/material.dart';
import 'package:selamat_application/styles/styles.dart';
import 'package:selamat_application/widget/widget_login_register/customTextFormField.dart';
import 'package:selamat_application/widget/widget_login_register/customCheckboxButton.dart';
import 'package:selamat_application/widget/widget_login_register/customElevatedButton.dart';

class AlmostThere extends StatelessWidget {
  const AlmostThere({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'You Almost\nthere!',
          style: TextStyles.GR_42_bold,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
