import 'dart:async';

import 'package:flutter/material.dart';
import 'package:selamat_application/pages/home_page/homePage.dart';
import 'package:selamat_application/styles/styles.dart';
import 'package:selamat_application/widget/widget_login_register/customTextFormField.dart';
import 'package:selamat_application/widget/widget_login_register/customCheckboxButton.dart';
import 'package:selamat_application/widget/widget_login_register/customElevatedButton.dart';

class AlmostThere extends StatefulWidget {
  const AlmostThere({
    super.key,
    // required this.email,
    // required this.password,
    // required this.phoneNum,
    // required this.fullName,
    // required this.dateOfBirth,
    // required this.startHour,
    // required this.startMinute,
    // required this.endHour,
    // required this.endMinute,
  });

  // final String email;
  // final String password;
  // final String phoneNum;
  // final String fullName;
  // final DateTime dateOfBirth;
  // final int startHour;
  // final int startMinute;
  // final int endHour;
  // final int endMinute;

  @override
  State<AlmostThere> createState() => _AlmostThereState();
}

class _AlmostThereState extends State<AlmostThere> {
  @override
  void initState() {
    // String _email = widget.email;
    // String _password = widget.password;
    // String _phoneNum = widget.phoneNum;
    // String _fullName = widget.fullName;
    // DateTime _dateOfBirth = widget.dateOfBirth;
    // int _startHour = widget.startHour;
    // int _startMinute = widget.startMinute;
    // int _endHour = widget.endHour;
    // int _endMinute = widget.endMinute;
    super.initState();

    Timer(
      Duration(seconds: 3),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => HomePage(
            // email: _email,
            // password: _password,
            // phoneNum: _phoneNum,
            // fullName: _fullName,
            // dateOfBirth: _dateOfBirth,
            // startHour: _startHour,
            // startMinute: _startMinute,
            // endHour: _endHour,
            // endMinute: _endMinute,
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
