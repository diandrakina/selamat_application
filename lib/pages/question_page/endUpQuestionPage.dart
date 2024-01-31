import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:selamat_application/styles/styles.dart';
import 'package:selamat_application/widget/customElevatedButton.dart';

class EndUpQuestionPage extends StatefulWidget {
  EndUpQuestionPage({super.key});

  @override
  State<EndUpQuestionPage> createState() => _EndUpQuestionPageState();
}

class _EndUpQuestionPageState extends State<EndUpQuestionPage> {
  var hour = 0;
  var minute = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          child: Column(
            children: [
              SizedBox(
                height: 38,
              ),
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
                "What about you end work time?",
                maxLines: 2,
                // overflow: TextOverflow.ellipsis,
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
                height: 120,
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
                  value: hour,
                  zeroPad: true,
                  // infiniteLoop: true,
                  itemHeight: 72,
                  itemWidth: 69,
                  onChanged: (value) {
                    setState(() {
                      hour = value;
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
                  value: minute,
                  zeroPad: true,
                  // infiniteLoop: true,
                  itemHeight: 72,
                  itemWidth: 69,
                  onChanged: (value) {
                    setState(() {
                      minute = value;
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
