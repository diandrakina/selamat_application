import 'package:flutter/material.dart';
import 'package:selamat_application/styles/styles.dart';
import 'package:selamat_application/widget/widget_login_register/customElevatedButton.dart';
import 'package:selamat_application/widget/widget_login_register/customTextFormField.dart';
import 'package:selamat_application/widget/widget_login_register/customCheckboxButton.dart';

class CreatePasswordPage extends StatelessWidget {
  CreatePasswordPage({super.key});

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool rememberMeCheckBox = false;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          child: SizedBox(
            width: double.maxFinite,
            child: Column(
              children: [
                SizedBox(
                  height: 162,
                ),
                Expanded(
                    child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        'Create password',
                        style: TextStyles.GR_24_title_regular,
                      ),
                      SizedBox(
                        height: 1,
                      ),
                      Text(
                        'for security, create a strong password',
                        style: TextStyles.GR_15_title_light,
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      _buildPassword(context),
                      SizedBox(
                        height: 21,
                      ),
                      _buildConfirmPassword(context),
                      SizedBox(
                        height: 15,
                      ),
                      _buildRememberMeCheckBox(context),
                      SizedBox(
                        height: 15,
                      ),
                      CustomElevatedButton(
                        text: 'Next',
                        height: 50,
                        buttonTextStyle: TextStyles.bold_24,
                        buttonStyle: CustomButtonStyles.buttonBlue,
                        margin: EdgeInsets.symmetric(horizontal: 50),
                        onPressed: () {},
                      ),
                      SizedBox(
                        height: 180,
                      ),
                      Divider(
                        color: AppColors.inactive,
                      ),
                      SizedBox(
                        height: 32,
                      ),
                    ],
                  ),
                ))
              ],
            ),
          ),
        ),
        bottomNavigationBar: _logInStack(context),
      ),
    );
  }

  Widget _buildPassword(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 50,
      ),
      child: CustomTextFormField(
        controller: passwordController,
        hintText: 'password',
        textInputType: TextInputType.visiblePassword,
        obscureText: true,
      ),
    );
  }

  Widget _buildConfirmPassword(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: CustomTextFormField(
        controller: confirmPasswordController,
        hintText: 'confirm password',
        textInputAction: TextInputAction.done,
        textInputType: TextInputType.visiblePassword,
        obscureText: true,
      ),
    );
  }

  Widget _buildRememberMeCheckBox(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(left: 50),
        child: CustomCheckboxButton(
          alignment: Alignment.centerLeft,
          text: 'Remember me',
          textStyle: TextStyles.GR_15_title_light,
          value: rememberMeCheckBox,
          padding: EdgeInsets.symmetric(vertical: 1),
          onChange: (value) {
            rememberMeCheckBox = value;
          },
        ),
      ),
    );
  }

  Widget _logInStack(BuildContext context) {
    return Container(
      height: 20,
      width: 250,
      margin: EdgeInsets.only(left: 70, right: 70, bottom: 30),
      child: Row(
        children: [
          Container(
            child: Text(
              'already have an account? ',
              style: TextStyles.GR_15_light,
            ),
          ),
          GestureDetector(
            child: Container(
              // color: Colors.blue,
              child: Text(
                "Login",
                style: TextStyles.bold_15_blue,
              ),
              padding: EdgeInsets.symmetric(vertical: 0),
            ),
          )
        ],
      ),
    );
  }

  onTapLogIn(BuildContext context) {}
}
