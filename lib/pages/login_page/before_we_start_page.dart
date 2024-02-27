import 'dart:async';

import 'package:flutter/material.dart';
import 'package:selamat_application/pages/question_page/startUpQuestionPage.dart';
import 'package:selamat_application/styles/styles.dart';

class BeforeWeStartPage extends StatefulWidget {
  const BeforeWeStartPage({
    super.key,
    required this.email,
    required this.password,
    required this.phoneNum,
    required this.fullName,
    required this.dateOfBirth,
  });

  final String email;
  final String password;
  final String phoneNum;
  final String fullName;
  final DateTime dateOfBirth;
  @override
  State<BeforeWeStartPage> createState() => _BeforeWeStartPageState();
}

class _BeforeWeStartPageState extends State<BeforeWeStartPage> {
  @override
  void initState() {
    String _email = widget.email;
    String _password = widget.password;
    String _phoneNum = widget.phoneNum;
    String _fullName = widget.fullName;
    DateTime _dateOfBirth = widget.dateOfBirth;
    super.initState();
    Timer(
      Duration(seconds: 3),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => StartUpQuestionPage(
              email: _email,
              password: _password,
              phoneNum: _phoneNum,
              fullName: _fullName,
              dateOfBirth: _dateOfBirth),
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
              "Before we start Let me ask you some questions",
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
