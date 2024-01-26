import 'package:flutter/material.dart';
import 'package:selamat_application/styles/styles.dart';

class StartUpQuestionPage extends StatelessWidget {
  const StartUpQuestionPage({super.key});

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
              height: 34,
            ),
            Text(
              "What time do you\nusually go to work?",
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
              style: TextStyles.GR_16_light,
            ),
            SizedBox(
              height: 80,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 70),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        "05",
                        style: TextStyles.intro_39_bold,
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      Container(
                        height: 1,
                        width: 70,
                        decoration: BoxDecoration(color: AppColors.deadBlue),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "06",
                        style: TextStyles.intro_39_bold,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 1,
                        width: 70,
                        decoration: BoxDecoration(color: AppColors.deadBlue),
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      Text(
                        "07",
                        style: TextStyles.intro_39_bold,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: 1,
                        width: 70,
                        decoration: BoxDecoration(color: AppColors.deadBlue),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "00",
                        style: TextStyles.intro_39_bold,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 1,
                        width: 70,
                        decoration: BoxDecoration(color: AppColors.deadBlue),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
