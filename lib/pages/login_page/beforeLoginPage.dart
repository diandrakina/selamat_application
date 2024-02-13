import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:selamat_application/styles/styles.dart';
import 'package:selamat_application/widget/widget_login_register/customElevatedButton.dart';

class BeforeLoginPage extends StatefulWidget {
  const BeforeLoginPage({super.key});

  @override
  State<BeforeLoginPage> createState() => _BeforeLoginPageState();
}

class _BeforeLoginPageState extends State<BeforeLoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(padding: EdgeInsets.all(10)),
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "Ready",
                      style: TextStyles.bold_76_black,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "to",
                      style: TextStyles.bold_76_black,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    width: double.maxFinite,
                    height: 90,
                    decoration: BoxDecoration(
                        color: AppColors.baseColor,
                        borderRadius: BorderRadius.circular(8)),
                    child: TypewriterTextAnimation(),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "your",
                      style: TextStyles.bold_76_black,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "life?",
                      style: TextStyles.bold_76_black,
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: AppColors.floatingGrey,
              thickness: 1,
            ),
            Container(
              padding: EdgeInsets.only(left: 30, right: 30),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  CustomElevatedButton(
                    height: 50,
                    text: 'Continue with Apple',
                    buttonTextStyle: TextStyles.regular_18,
                    leftIcon: FaIcon(
                      Icons.apple,
                      size: 30,
                    ),
                    buttonStyle: CustomButtonStyles.buttonNotSure,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomElevatedButton(
                    height: 50,
                    text: 'Continue with Google',
                    buttonTextStyle: TextStyles.regular_18,
                    leftIcon: FaIcon(
                      FontAwesomeIcons.google,
                      size: 30,
                    ),
                    buttonStyle: CustomButtonStyles.buttonNotSure,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomElevatedButton(
                    height: 50,
                    text: 'Continue with Username',
                    buttonTextStyle: TextStyles.regular_18,
                    leftIcon: FaIcon(
                      Icons.person,
                      size: 30,
                    ),
                    buttonStyle: CustomButtonStyles.buttonNotSure,
                  ),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.all(10)),
          ],
        ),
        bottomNavigationBar: _signInStack(context),
      ),
    );
  }

  Widget _signInStack(BuildContext context) {
    return Container(
      // color: Colors.amber,
      height: 20,
      width: 203,
      margin: EdgeInsets.only(left: 70, right: 70, bottom: 30),
      child: Row(
        children: [
          Container(
            child: Text(
              'don\'t have an account?',
              style: TextStyles.GR_15_light,
            ),
            margin: EdgeInsets.symmetric(horizontal: 10),
          ),
          GestureDetector(
            child: Container(
              child: Text(
                "Sign in.",
                style: TextStyles.bold_15_blue,
              ),
              padding: EdgeInsets.symmetric(vertical: 0),
            ),
          )
        ],
      ),
    );
  }
}

class TypewriterTextAnimation extends StatefulWidget {
  @override
  _TypewriterTextAnimationState createState() =>
      _TypewriterTextAnimationState();
}

class _TypewriterTextAnimationState extends State<TypewriterTextAnimation> {
  int currentIndex = 0;
  int currentCharIndex = 0;
  final List<String> _strings = ['Change', 'Build', 'Make'];

  @override
  void initState() {
    super.initState();
    TypeWritingAnimation();
  }

  void TypeWritingAnimation() {
    if (currentCharIndex < _strings[currentIndex].length) {
      currentCharIndex++;
    } else {
      currentIndex = (currentIndex + 1) % _strings.length;
      currentCharIndex = 0;
    }
    setState(() {});

    Future.delayed(Duration(milliseconds: 500), () {
      TypeWritingAnimation();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        _strings[currentIndex].substring(0, currentCharIndex),
        style: TextStyles.bold_76_white,
      ),
    );
  }
}
