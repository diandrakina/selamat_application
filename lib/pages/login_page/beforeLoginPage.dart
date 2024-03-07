import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:selamat_application/pages/login_page/create_email_page.dart';
import 'package:selamat_application/pages/login_page/loginPage.dart';
import 'package:selamat_application/styles/styles.dart';
import 'package:selamat_application/widget/widget_login_register/customElevatedButton.dart';

class BeforeLoginPage extends StatefulWidget {
  const BeforeLoginPage({super.key});

  @override
  State<BeforeLoginPage> createState() => _BeforeLoginPageState();
}

class _BeforeLoginPageState extends State<BeforeLoginPage> {
  void navigateToSignUp() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => LoginPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(padding: EdgeInsets.all(5)),
                  Container(
                    height: 80,
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "Ready",
                      style: TextStyles.bold_70_black,
                    ),
                  ),
                  Container(
                    height: 90,
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "to",
                      style: TextStyles.bold_70_black,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 10),
                    width: double.maxFinite,
                    height: 100,
                    decoration: BoxDecoration(
                        color: AppColors.baseColor,
                        borderRadius: BorderRadius.circular(8)),
                    child: TypewriterTextAnimation(),
                  ),
                  Container(
                    height: 90,
                    width: 200,
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "your",
                      style: TextStyles.bold_70_black,
                      // textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    height: 90,
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "life?",
                      style: TextStyles.bold_70_black,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              color: AppColors.floatingGrey,
              thickness: 1,
            ),
            Container(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  CustomElevatedButton(
                    height: 50,
                    text: 'Continue with Apple',
                    buttonTextStyle: TextStyles.regular_18,
                    leftIcon: const FaIcon(
                      Icons.apple,
                      size: 30,
                      color: Colors.white,
                    ),
                    buttonStyle: CustomButtonStyles.buttonNotSure,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomElevatedButton(
                    height: 50,
                    text: 'Continue with Google',
                    buttonTextStyle: TextStyles.regular_18,
                    leftIcon: const FaIcon(
                      FontAwesomeIcons.google,
                      size: 30,
                      color: Colors.white,
                    ),
                    buttonStyle: CustomButtonStyles.buttonNotSure,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomElevatedButton(
                    height: 50,
                    text: 'Continue with Username',
                    buttonTextStyle: TextStyles.regular_18,
                    leftIcon: const FaIcon(
                      Icons.person,
                      size: 30,
                      color: Colors.white,
                    ),
                    buttonStyle: CustomButtonStyles.buttonNotSure,
                  ),
                ],
              ),
            ),
            const Padding(padding: EdgeInsets.all(10)),
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
      margin: const EdgeInsets.only(left: 70, right: 70, bottom: 30),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'don\'t have an account?',
              style: TextStyles.GR_15_light,
            ),
          ),
          GestureDetector(
            onTap: navigateToSignUp,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 0),
              child: Text(
                "Sign in.",
                style: TextStyles.bold_15_blue,
              ),
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
    return Text(
      _strings[currentIndex].substring(0, currentCharIndex),
      style: TextStyles.bold_70_white,
    );
  }
}
