import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:selamat_application/styles/styles.dart';
import 'package:selamat_application/widget/customElevatedButton.dart';

import 'package:selamat_application/widget/customBoxTarget.dart';

class TargetQuestionPage extends StatefulWidget {
  const TargetQuestionPage({super.key});

  @override
  State<TargetQuestionPage> createState() => _TargetQuestionPageState();
}

class _TargetQuestionPageState extends State<TargetQuestionPage> {
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
                  height: 385,
                  child: SingleChildScrollView(
                    child: _yourTarget(context),
                  )),

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
