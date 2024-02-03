import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:selamat_application/styles/styles.dart';
import 'package:selamat_application/widget/widget_login_register/customElevatedButton.dart';

import 'package:selamat_application/widget/widget_question_page/customBoxGoals.dart';

class GoalQuestionPage extends StatefulWidget {
  const GoalQuestionPage({super.key});

  @override
  State<GoalQuestionPage> createState() => _GoalQuestionPageState();
}

class _GoalQuestionPageState extends State<GoalQuestionPage> {
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
              // SizedBox(
              //   height: 38,
              // ),
              _buildAppBar(context),
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
                height: 340,
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

  Widget _buildAppBar(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(left: 5, bottom: 5),
      height: 38,
      // color: Colors.amber,
      child: IconButton(
        iconSize: 18,
        icon: Icon(
          FontAwesomeIcons.arrowLeft,
          color: AppColors.white,
        ),
        onPressed: () {},
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(left: 0),
      ),
    );
  }
}
