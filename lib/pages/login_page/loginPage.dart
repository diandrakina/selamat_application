import 'package:flutter/material.dart';
import 'package:selamat_application/styles/styles.dart';
import 'package:selamat_application/utils/imagesConstant.dart';
import 'package:selamat_application/widget/widget_login_register/customTextFormField.dart';
import 'package:selamat_application/widget/widget_login_register/customElevatedButton.dart';
import 'package:selamat_application/widget/widget_login_register/customButton.dart';
import 'package:selamat_application/widget/widget_login_register/customImage.dart';

class loginPage extends StatelessWidget {
  // loginPage({super.key});
  loginPage({Key? key}) : super(key: key);

  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Flexible(
                  child: Container(),
                  flex: 2,
                ),
                // Spacer(),
                Text(
                  'Selamat',
                  style: TextStyles.GR_40_title_regular,
                ),
                Text(
                  'Sehat Selalu Mentalku',
                  style: TextStyles.GR_24_title_light,
                ),
                SizedBox(
                  height: 38,
                ),
                _buildUserName(context),
                SizedBox(
                  height: 25,
                ),
                _buildPassword(context),
                SizedBox(
                  height: 15,
                ),
                _buildLoginButton(context),
                SizedBox(
                  height: 15,
                ),
                RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: 'forgotten your details?',
                        style: TextStyles.medium_14),
                    TextSpan(text: " "),
                    TextSpan(
                        text: 'Get help with logging in.',
                        style: TextStyles.bold_14)
                  ]),
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                  height: 50,
                ),
                Center(
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          color: AppColors.inactive,
                          height: 1,
                          child: Divider(
                            indent: 100,
                          ),
                        ),
                        Text(
                          'OR',
                          style: TextStyles.light_14,
                        ),
                        Container(
                          height: 1,
                          color: AppColors.inactive,
                          child: Divider(
                            indent: 100,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                _buildGoogle(context),
                SizedBox(
                  height: 13,
                ),
                _buildFacebook(context),
                SizedBox(
                  height: 60,
                ),
                Divider(
                  color: AppColors.inactive,
                  // indent: 30,
                ),
              ],
            ),
            // color: const Color.fromARGB(255, 173, 203, 255),
          ),
        ),
        bottomNavigationBar: _signInStack(context),
      ),
    );
  }

  Widget _buildUserName(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 50,
      ),
      child: CustomTextFormField(
        controller: userNameController,
        hintText: 'username',
      ),
    );
  }

  Widget _buildPassword(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 50),
        child: CustomTextFormField(
          controller: passwordController,
          hintText: 'password',
          textInputAction: TextInputAction.done,
          textInputType: TextInputType.visiblePassword,
          obscureText: true,
        ));
  }

  Widget _buildLoginButton(BuildContext context) {
    return CustomElevatedButton(
      text: 'Login',
      color: Colors.black,
      margin: EdgeInsets.symmetric(horizontal: 50),
      height: 50.0,
      buttonTextStyle: TextStyles.bold_24,
    );
  }

  Widget _buildGoogle(BuildContext context) {
    return CustomElevatedButton(
      text: 'Continue with Google',
      height: 50.0,
      margin: EdgeInsets.symmetric(horizontal: 50),
      leftIcon: Container(
        height: 35,
        width: 35,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/login_page/google_logo.png"),
                fit: BoxFit.cover)),
        margin: EdgeInsets.only(right: 20),
      ),
      buttonStyle: CustomButtonStyles.buttonGray,
      textStyle: TextStyles.bold_18,
    );
  }

  Widget _buildFacebook(BuildContext context) {
    return CustomElevatedButton(
      text: 'Continue with Facebook',
      height: 50.0,
      margin: EdgeInsets.symmetric(horizontal: 50),
      leftIcon: Container(
        height: 35,
        width: 35,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/login_page/facebook_logo.png"),
              fit: BoxFit.cover),
        ),
        margin: EdgeInsets.only(right: 15),
      ),
      buttonStyle: CustomButtonStyles.buttonGray,
      buttonTextStyle: TextStyles.regular_18,
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
              // color: Colors.blue,
              child: Text(
                "Sign in.",
                style: TextStyles.bold_15_blue,
              ),
              padding: EdgeInsets.symmetric(vertical: 0),
            ),
          )
          // RichText(
          //   text: TextSpan(
          //     children: [
          //       TextSpan(
          //           text: 'don\'t have an account?',
          //           style: TextStyles.GR_15_light),
          //       TextSpan(text: " "),
          //       TextSpan(text: 'Sign In', style: TextStyles.bold_15_blue)
          //     ],
          //   ),
          //   textAlign: TextAlign.left,
          // ),
        ],
      ),
    );
  }

  //Buat tempat logic Sign In
  onTapSignIn(BuildContext context) {
    // Navigator.pushNamed(context, routeName);
  }
}
