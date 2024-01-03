import 'package:flutter/material.dart';
import 'package:selamat_application/styles/styles.dart';
import 'package:selamat_application/widget/customTextFormField.dart';

class loginPage extends StatelessWidget {
  loginPage({super.key});

  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
          child: Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(vertical: 33),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Spacer(),
            Text(
              'Selamat',
              style: TextStyles.GR_40_title_regular,
            ),
            Text(
              'Sehat Selalu Mentalku',
              style: TextStyles.GR_24_title_light,
            ),
            Text('halo rici babi setan ajg tai asu'),
            SizedBox(
              height: 38,
            ),
            _buildUserName(context),
            SizedBox(
              height: 26,
            ),
            _buildPassword(context),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      )),
    ));
  }

  Widget _buildUserName(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 50),
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
}
