import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:selamat_application/pages/question_page/goalsQuestionPage.dart';
import 'package:selamat_application/styles/styles.dart';
import 'package:selamat_application/widget/widget_login_register/customElevatedButton.dart';

class StartUpQuestionPage extends StatefulWidget {
  StartUpQuestionPage({
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
  State<StartUpQuestionPage> createState() => _StartUpQuestionPageState();
}

class _StartUpQuestionPageState extends State<StartUpQuestionPage> {
  int _startHour = 0;
  int _startMinute = 0;
  DateTime _timeNow = DateTime.now();

  void navigateToGoalPage() {
    String _email = widget.email;
    String _password = widget.password;
    String _phoneNum = widget.phoneNum;
    String _fullName = widget.fullName;
    DateTime _dateOfBirth = widget.dateOfBirth;
    DateTime _startHourMinute = DateTime(
        _timeNow.year, _timeNow.month, _timeNow.day, _startHour, _startMinute);
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => GoalQuestionPage(
          email: _email,
          password: _password,
          phoneNum: _phoneNum,
          fullName: _fullName,
          dateOfBirth: _dateOfBirth,
          startHourMinute: _startHourMinute,
          // startHour: _startHour,
          // startMinute: _startMinute,
        ),
      ),
    );
  }

  Widget _buttonNext(BuildContext context) {
    return CustomElevatedButton(
      text: 'NEXT',
      buttonTextStyle: TextStyles.medium_24,
      height: 60,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      buttonStyle: CustomButtonStyles.buttonBlue,
      onPressed: () {
        navigateToGoalPage();
      },
    );
  }

  Widget _buttonNotSure(BuildContext context) {
    return CustomElevatedButton(
      text: 'IM NOT SURE',
      buttonTextStyle: TextStyles.medium_24,
      height: 60,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      buttonStyle: CustomButtonStyles.buttonNotSure,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: AppColors.bgDarkMode,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: AppColors.white,
            onPressed: () async {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Container(
          width: double.maxFinite,
          padding: const EdgeInsets.only(left: 20, right: 20),
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
                  Container(
                    height: 10,
                    width: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.0),
                        color: AppColors.inactive),
                  ),
                ],
              ),
              const SizedBox(
                height: 34,
              ),
              Text(
                "What time do you\nusually go to work?",
                maxLines: 2,
                // overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: TextStyles.GR_38_bold,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "choose time below",
                style: TextStyles.GR_24_light,
              ),
              const SizedBox(
                height: 50,
              ),
              //COBA WIDGET
              timePicker(context),
              const SizedBox(
                height: 100,
              ),
              _buttonNext(context),
              const SizedBox(
                height: 10,
              ),
              _buttonNotSure(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget timePicker(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            decoration: BoxDecoration(
              // color: Colors.amber,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                //HOUR
                NumberPicker(
                  minValue: 0,
                  maxValue: 23,
                  value: _startHour,
                  zeroPad: true,
                  // infiniteLoop: true,
                  itemHeight: 72,
                  itemWidth: 69,
                  onChanged: (value) {
                    setState(() {
                      _startHour = value;
                    });
                  },
                  textStyle: TextStyles.timeRoll,
                  selectedTextStyle: TextStyles.timeRollOke,
                  decoration: const BoxDecoration(
                    border: Border(
                        top: BorderSide(
                          width: 2,
                          color: AppColors.deadBlue,
                        ),
                        bottom:
                            BorderSide(width: 2, color: AppColors.deadBlue)),
                  ),
                ),
                //MINUTE
                NumberPicker(
                  minValue: 0,
                  maxValue: 59,
                  value: _startMinute,
                  zeroPad: true,
                  // infiniteLoop: true,
                  itemHeight: 72,
                  itemWidth: 69,
                  onChanged: (value) {
                    setState(() {
                      _startMinute = value;
                    });
                  },
                  textStyle: TextStyles.timeRoll,
                  selectedTextStyle: TextStyles.timeRollOke,
                  decoration: const BoxDecoration(
                    border: Border(
                        top: BorderSide(
                          width: 2,
                          color: AppColors.deadBlue,
                        ),
                        bottom:
                            BorderSide(width: 2, color: AppColors.deadBlue)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
