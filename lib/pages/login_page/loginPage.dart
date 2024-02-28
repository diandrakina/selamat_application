import 'package:flutter/material.dart';
import 'package:selamat_application/pages/home_page/homePage.dart';
import 'package:selamat_application/pages/login_page/create_email_page.dart';
import 'package:selamat_application/resources/auth_methods.dart';
import 'package:selamat_application/styles/styles.dart';
import 'package:selamat_application/utils/imagesConstant.dart';
import 'package:selamat_application/utils/richie_utils.dart';
import 'package:selamat_application/widget/widget_login_register/customTextFormField.dart';
import 'package:selamat_application/widget/widget_login_register/customElevatedButton.dart';
import 'package:selamat_application/widget/widget_login_register/customButton.dart';
import 'package:selamat_application/widget/widget_login_register/customImage.dart';

class LoginPage extends StatefulWidget {
  // LoginPage({super.key});
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();

  TextEditingController _passwordController = TextEditingController();

  bool _isLoading = false;

  void loginUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().loginUser(
      email: _emailController.text,
      password: _passwordController.text,
    );

    if (res == "success") {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
    } else {
      showSnackBar(res, context);
    }
    setState(() {
      _isLoading = false;
    });
  }

  void navigateToSignUp() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CreateEmailPage(),
      ),
    );
  }

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
                _buildemail(context),
                SizedBox(
                  height: 25,
                ),
                _buildPassword(context),
                SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: loginUser,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 50),
                    child: _isLoading
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: AppColors.white,
                            ),
                          )
                        : Text(
                            "Sign Up",
                            style: TextStyles.medium_24,
                          ),
                    width: double.infinity,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: const ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(7),
                        ),
                      ),
                      color: AppColors.bluePowderDarker,
                    ),
                  ),
                ),
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
          ),
        ),
        bottomNavigationBar: _signInStack(context),
      ),
    );
  }

  Widget _buildemail(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 50,
      ),
      child: CustomTextFormField(
        controller: _emailController,
        hintText: 'email',
      ),
    );
  }

  Widget _buildPassword(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 50),
        child: CustomTextFormField(
          controller: _passwordController,
          hintText: 'password',
          textInputAction: TextInputAction.done,
          textInputType: TextInputType.visiblePassword,
          obscureText: true,
        ));
  }

  // Widget _buildLoginButton(BuildContext context) {
  //   return CustomElevatedButton(
  //     text: 'Login',
  //     color: Colors.black,
  //     margin: EdgeInsets.symmetric(horizontal: 50),
  //     height: 50.0,
  //     buttonTextStyle: TextStyles.bold_24,
  //     buttonStyle: CustomButtonStyles.buttonBlue,
  //   );
  // }

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
              fit: BoxFit.cover),
        ),
      ),
      buttonStyle: CustomButtonStyles.buttonGray,
      buttonTextStyle: TextStyles.regular_18,
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
        margin: EdgeInsets.only(right: 5),
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
            onTap: navigateToSignUp,
            child: Container(
              // color: Colors.blue,
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
