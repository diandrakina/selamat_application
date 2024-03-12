import 'dart:async';

import 'package:flutter/material.dart';
import 'package:selamat_application/pages/home_page/homePage.dart';
import 'package:selamat_application/responsive/mobile_screen_layout.dart';
import 'package:selamat_application/responsive/responsive_layout.dart';
import 'package:selamat_application/styles/styles.dart';
import 'package:selamat_application/widget/widget_login_register/customTextFormField.dart';
import 'package:selamat_application/widget/widget_login_register/customCheckboxButton.dart';
import 'package:selamat_application/widget/widget_login_register/customElevatedButton.dart';

class AlmostThere extends StatefulWidget {
  const AlmostThere({
    super.key,
  });


  @override
  State<AlmostThere> createState() => _AlmostThereState();
}

class _AlmostThereState extends State<AlmostThere> {
  @override
  void initState() {
    super.initState();

    Timer(
      Duration(seconds: 3),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => ResponsiveLayout( 
                  mobileScreenLayout: MobileScreenLayout(),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              'You Almost\nthere!',
              style: TextStyles.GR_42_bold,
              maxLines: 3,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
