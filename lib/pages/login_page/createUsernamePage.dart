import 'package:flutter/material.dart';
import 'package:selamat_application/styles/styles.dart';
import 'package:selamat_application/widget/customElevatedButton.dart';
import 'package:selamat_application/widget/customTextFormField.dart';
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
                      _logInStack(context)
                    ],
                  ),
                ))
              ],
            ),
          ),
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
