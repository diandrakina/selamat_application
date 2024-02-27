import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:selamat_application/pages/question_page/endUpQuestionPage.dart';
import 'package:selamat_application/styles/styles.dart';
import 'package:selamat_application/widget/widget_login_register/customElevatedButton.dart';

import 'package:selamat_application/widget/widget_question_page/customBoxGoals.dart';

class GoalQuestionPage extends StatefulWidget {
  const GoalQuestionPage({
    super.key,
    required this.email,
    required this.password,
    required this.phoneNum,
    required this.fullName,
    required this.dateOfBirth,
    required this.startHour,
    required this.startMinute,
  });

  final String email;
  final String password;
  final String phoneNum;
  final String fullName;
  final DateTime dateOfBirth;
  final int startHour;
  final int startMinute;

  @override
  State<GoalQuestionPage> createState() => _GoalQuestionPageState();
}

class _GoalQuestionPageState extends State<GoalQuestionPage> {

void navigateToEndWorkPage() {
    String _email = widget.email;
    String _password = widget.password;
    String _phoneNum = widget.phoneNum;
    String _fullName = widget.fullName;
    DateTime _dateOfBirth = widget.dateOfBirth;
    int _startHour = widget.startHour;
    int _startMinute = widget.startMinute;
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => EndUpQuestionPage(
          email: _email,
          password: _password,
          phoneNum: _phoneNum,
          fullName: _fullName,
          dateOfBirth: _dateOfBirth,
          startHour: _startHour,
          startMinute: _startMinute,
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
                        color: AppColors.baseColor),
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
                ],
              ),
              SizedBox(
                height: 34,
              ),
              Text(
                "What's your goal?",
                maxLines: 1,
                // overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: TextStyles.GR_38_bold,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "if you want to be productive what is your goal?",
                maxLines: 2,
                textAlign: TextAlign.center,
                style: TextStyles.GR_24_light,
              ),
              SizedBox(
                height: 40,
              ),
              // _yourGoals(context),
              Container(
                height: 320,
                child: SingleChildScrollView(
                  child: _yourGoals(context),
                ),
              ),

              SizedBox(
                height: 20,
              ),
              _buttonNext(context),
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
  

  Widget _yourGoals(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomBoxGoals(
                  icon: Icons.work,
                  text: "Work Life   Balance",
                  colorIcon: AppColors.deadBlue),
              CustomBoxGoals(
                  icon: FontAwesomeIcons.crosshairs,
                  text: "Track My Habits",
                  colorIcon: AppColors.pastelGreenHealth),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomBoxGoals(
                  icon: FontAwesomeIcons.trophy,
                  text: "Challenge Myself",
                  colorIcon: AppColors.successStreak),
              CustomBoxGoals(
                  icon: FontAwesomeIcons.eye,
                  text: "Try to focus",
                  colorIcon: AppColors.pastelPurple),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomBoxGoals(
                  icon: FontAwesomeIcons.solidHeart,
                  text: "Healthier Life",
                  colorIcon: AppColors.pastelRed),
              CustomBoxGoals(
                  icon: FontAwesomeIcons.fire,
                  text: "Consistent Routine",
                  colorIcon: AppColors.starYellow),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buttonNext(BuildContext context) {
    return CustomElevatedButton(
      text: 'NEXT',
      buttonTextStyle: TextStyles.medium_24,
      height: 60,
      margin: EdgeInsets.symmetric(horizontal: 10),
      buttonStyle: CustomButtonStyles.buttonBlue,
      onPressed: () {
        navigateToEndWorkPage();
      },
    );
  }

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
