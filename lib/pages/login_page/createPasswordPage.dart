import 'package:flutter/material.dart';
import 'package:selamat_application/styles/styles.dart';
import 'package:selamat_application/widget/customElevatedButton.dart';
import 'package:selamat_application/widget/customTextFormField.dart';
import 'package:selamat_application/widget/customCheckboxButton.dart';

class createPasswordPage extends StatelessWidget {
  createPasswordPage({super.key});

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool rememberMeCheckBox = false;

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
                    margin: EdgeInsets.symmetric(horizontal: 50),
                    onPressed: () {},
                  ),
                  SizedBox(
                    height: 200,
                  ),
                  Divider(
                    color: AppColors.inactive,
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  _logInStack(context)
                ],
              ),
            ))
          ],
        ),
      )),
    ));
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
      width: 203,
      margin: EdgeInsets.only(left: 70, right: 70, bottom: 29),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () {
                onTapLogIn(context);
              },
              child: Text(
                'Login',
                style: TextStyles.GR_15_light,
              ),
            ),
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                    text: 'already have an account?',
                    style: TextStyles.GR_15_light),
                TextSpan(text: " "),
                TextSpan(text: 'Login', style: TextStyles.GR_15_bold)
              ],
            ),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }

  onTapLogIn(BuildContext context) {}
}
