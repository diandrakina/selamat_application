import 'package:flutter/material.dart';
import 'package:selamat_application/styles/styles.dart';
import 'package:selamat_application/widget/widget_login_register/customElevatedButton.dart';
import 'package:selamat_application/widget/widget_login_register/customTextFormField.dart';
// import 'package:selamat_application/widget/customElevatedButton.dart';

class createUsernamePage extends StatelessWidget {
  createUsernamePage({super.key});

  TextEditingController userNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          // key: _formKey,
          child: SizedBox(
            width: double.maxFinite,
            child: Column(
              children: [
                SizedBox(
                  height: 159,
                ),
                Expanded(
                    child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        'Choose username',
                        style: TextStyles.GR_24_title_regular,
                      ),
                      SizedBox(
                        height: 1,
                      ),
                      Text(
                        'choose your username wisely',
                        style: TextStyles.GR_15_title_light,
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        child: CustomTextFormField(
                          controller: userNameController,
                          hintText: 'username',
                          textInputAction: TextInputAction.done,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      CustomElevatedButton(
                        text: 'Next',
                        buttonStyle: CustomButtonStyles.buttonBlue,
                        buttonTextStyle: TextStyles.bold_24,
                        height: 50,
                        margin: EdgeInsets.symmetric(horizontal: 50),
                        onPressed: () {},
                      ),
                      SizedBox(
                        height: 300,
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
