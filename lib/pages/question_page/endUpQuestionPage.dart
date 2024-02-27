import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:selamat_application/pages/question_page/targetQuestionPage.dart';
import 'package:selamat_application/styles/styles.dart';
import 'package:selamat_application/widget/widget_login_register/customElevatedButton.dart';

class EndUpQuestionPage extends StatefulWidget {
  EndUpQuestionPage({
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
  State<EndUpQuestionPage> createState() => _EndUpQuestionPageState();
}

class _EndUpQuestionPageState extends State<EndUpQuestionPage> {
  int _endHour = 0;
  int _endMinute = 0;

  void navigateToTargetQuestionPage() {
    String _email = widget.email;
    String _password = widget.password;
    String _phoneNum = widget.phoneNum;
    String _fullName = widget.fullName;
    DateTime _dateOfBirth = widget.dateOfBirth;
    int _startHour = widget.startHour;
    int _startMinute = widget.startMinute;
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => TargetQuestionPage(
          email: _email,
          password: _password,
          phoneNum: _phoneNum,
          fullName: _fullName,
          dateOfBirth: _dateOfBirth,
          startHour: _startHour,
          startMinute: _startMinute,
          endHour: _endHour,
          endMinute: _endMinute,
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
          // padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
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
                        color: AppColors.baseColor),
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
                "What about your end work time?",
                maxLines: 2,
                textAlign: TextAlign.center,
                style: TextStyles.GR_38_bold,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "choose time below",
                style: TextStyles.GR_24_light,
              ),
              SizedBox(
                height: 50,
              ),
              //COBA WIDGET
              timePicker(context),
              SizedBox(
                height: 100,
              ),
              _buttonNext(context),
              SizedBox(
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
                  value: _endHour,
                  zeroPad: true,
                  // infiniteLoop: true,
                  itemHeight: 72,
                  itemWidth: 69,
                  onChanged: (value) {
                    setState(() {
                      _endHour = value;
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
                  value: _endMinute,
                  zeroPad: true,
                  // infiniteLoop: true,
                  itemHeight: 72,
                  itemWidth: 69,
                  onChanged: (value) {
                    setState(() {
                      _endMinute = value;
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

  Widget _buttonNext(BuildContext context) {
    return CustomElevatedButton(
      text: 'NEXT',
      buttonTextStyle: TextStyles.medium_24,
      height: 60,
      margin: EdgeInsets.symmetric(horizontal: 10),
      buttonStyle: CustomButtonStyles.buttonBlue,
      onPressed: () {
        navigateToTargetQuestionPage();
      },
    );
  }

  Widget _buttonNotSure(BuildContext context) {
    return CustomElevatedButton(
      text: 'IM NOT SURE',
      buttonTextStyle: TextStyles.medium_24,
      height: 60,
      margin: EdgeInsets.symmetric(horizontal: 10),
      buttonStyle: CustomButtonStyles.buttonNotSure,
    );
  }
}
