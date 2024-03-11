import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:selamat_application/pages/home_page/homePage.dart';
import 'package:selamat_application/pages/welcome_page/welcomePage.dart';
import 'package:selamat_application/resources/auth_methods.dart';
import 'package:selamat_application/styles/styles.dart';
import 'package:selamat_application/utils/richie_utils.dart';
import 'package:selamat_application/widget/widget_login_register/customElevatedButton.dart';

import 'package:selamat_application/widget/widget_question_page/customBoxTarget.dart';

class TargetQuestionPage extends StatefulWidget {
  const TargetQuestionPage({
    super.key,
    required this.email,
    required this.password,
    required this.phoneNum,
    required this.fullName,
    required this.dateOfBirth,
    required this.startHour,
    required this.startMinute,
    required this.endHour,
    required this.endMinute,
  });

  final String email;
  final String password;
  final String phoneNum;
  final String fullName;
  final DateTime dateOfBirth;
  final int startHour;
  final int startMinute;
  final int endHour;
  final int endMinute;

  @override
  State<TargetQuestionPage> createState() => _TargetQuestionPageState();
}

class _TargetQuestionPageState extends State<TargetQuestionPage> {
  bool _isLoading = false;

  void signUpUser() async {
    String _email = widget.email;
    String _password = widget.password;
    String _phoneNum = widget.phoneNum;
    String _fullName = widget.fullName;
    DateTime _dateOfBirth = widget.dateOfBirth;
    int _startHour = widget.startHour;
    int _startMinute = widget.startMinute;
    int _endHour = widget.endHour;
    int _endMinute = widget.endMinute;

    setState(() {
      _isLoading = true;
    });

    String res = await AuthMethods().signUpUser(
      email: _email,
      password: _password,
      phoneNum: _phoneNum,
      fullName: _fullName,
      dateOfBirth: Timestamp.fromDate(_dateOfBirth),
      startHour: _startHour,
      startMinute: _startMinute,
      endHour: _endHour,
      endMinute: _endMinute,
    );

    setState(() {
      _isLoading = false;
    });

    if (res != 'Success!') {
      showSnackBar(res, context);
    } else {
      // showSnackBar(res, context);
      navigateToWelcomePage();
    }
  }

  void navigateToWelcomePage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => WelcomePage(
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: AppColors.white,
            onPressed: () async {
              Navigator.of(context).pop();
            },
          ),
          backgroundColor: AppColors.bgDarkMode,
        ),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 10,
                    width: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.0),
                        color: AppColors.inactive),
                  ),
                  Container(
                    height: 10,
                    width: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.0),
                        color: AppColors.inactive),
                  ),
                  Container(
                    height: 10,
                    width: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.0),
                        color: AppColors.inactive),
                  ),
                  Container(
                    height: 10,
                    width: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.0),
                        color: AppColors.baseColor),
                  ),
                ],
              ),
              SizedBox(
                height: 34,
              ),
              Text(
                "Create your target",
                maxLines: 1,
                // overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: TextStyles.GR_38_bold,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "you can select more than one.",
                maxLines: 2,
                textAlign: TextAlign.center,
                style: TextStyles.GR_24_light,
              ),
              SizedBox(
                height: 25,
              ),
              // _yourTarget(context),
              Container(
                  height: 375,
                  child: SingleChildScrollView(
                    child: _yourTarget(context),
                  )),

              SizedBox(
                height: 20,
              ),
              // _buttonNext(context),
              InkWell(
                onTap: signUpUser,
                // onTap: () {},
                child: Container(
                  margin:EdgeInsets.symmetric(horizontal: 10),
                  child: _isLoading
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: AppColors.white,
                          ),
                        )
                      : Text(
                          "Sign Up",
                          style: TextStyles.medium_24,
                        ),
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(7),
                      ),
                    ),
                    color: AppColors.bluePowderDarker,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              _buttonSkip(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget _yourTarget(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomBoxTarget(
              icon: FontAwesomeIcons.building, text: "Reduce Overtime"),
          SizedBox(
            height: 10,
          ),
          CustomBoxTarget(
              icon: FontAwesomeIcons.heartbeat, text: "Sugar Intake"),
          SizedBox(
            height: 10,
          ),
          CustomBoxTarget(icon: FontAwesomeIcons.bed, text: "8 hours of sleep"),
          SizedBox(
            height: 10,
          ),
          CustomBoxTarget(
              icon: FontAwesomeIcons.home, text: "Increase quality time"),
          SizedBox(
            height: 10,
          ),
          CustomBoxTarget(
              icon: FontAwesomeIcons.glassWhiskey,
              text: "8 cups of water per day"),
          SizedBox(
            height: 10,
          ),
          CustomBoxTarget(icon: FontAwesomeIcons.wind, text: "No more anxiety"),
          SizedBox(
            height: 10,
          ),
          CustomBoxTarget(
              icon: FontAwesomeIcons.solidSmileBeam,
              text: "Create free time space"),
          SizedBox(
            height: 10,
          ),
          CustomBoxTarget(
              icon: FontAwesomeIcons.dumbbell, text: "Exercise more"),
        ],
      ),
    );
  }

  // Widget _buttonNext(BuildContext context) {
    // return CustomElevatedButton(
  //     text: 'Next',
  //     buttonTextStyle: TextStyles.medium_24,
  //     height: 60,
  //     margin: EdgeInsets.symmetric(horizontal: 10),
  //     buttonStyle: CustomButtonStyles.buttonBlue,
  //     onPressed: () {
  //       navigateToWelcomePage();
  //     },
  //   );
  // }

  Widget _buttonSkip(BuildContext context) {
    return CustomElevatedButton(
      text: 'SKIP',
      buttonTextStyle: TextStyles.medium_24,
      height: 60,
      margin: EdgeInsets.symmetric(horizontal: 10),
      buttonStyle: CustomButtonStyles.buttonNotSure,
    );
  }
}
