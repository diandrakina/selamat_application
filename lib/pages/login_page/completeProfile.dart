import 'package:flutter/material.dart';
import 'package:selamat_application/styles/styles.dart';

import 'package:selamat_application/widget/customTextFormField.dart';
import 'package:selamat_application/widget/customCheckboxButton.dart';
import 'package:selamat_application/widget/customElevatedButton.dart';

class CompleteProfile extends StatelessWidget {
  CompleteProfile({super.key});

  TextEditingController fullNameController = TextEditingController();
  bool read = false;

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
                        'Complete Your Profile',
                        style: TextStyles.GR_24_title_regular,
                      ),
                      SizedBox(
                        height: 1,
                      ),
                      Text(
                        'provide your details, thanks :)',
                        style: TextStyles.GR_15_title_light,
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      _buildFullName(context),
                      SizedBox(
                        height: 15,
                      ),
                      _buildDOB(context),
                      SizedBox(
                        height: 15,
                      ),
                      _buildHaveRead(context),
                      SizedBox(
                        height: 15,
                      ),
                      CustomElevatedButton(
                        text: 'Next',
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8)),
                        margin: EdgeInsets.symmetric(horizontal: 50),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }

  Widget _buildFullName(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 50,
      ),
      child: CustomTextFormField(
        controller: fullNameController,
        hintText: 'full name',
        textInputAction: TextInputAction.done,
      ),
    );
  }

  //INI KURANG BIKIN DATE PICKERNYA
  Widget _buildDOB(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 50,
      ),
      child: CustomTextFormField(
        controller: fullNameController,
        hintText: 'date of birth',
        textInputAction: TextInputAction.done,
      ),
    );
  }

  Widget _buildHaveRead(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(left: 40),
        child: CustomCheckboxButton(
          alignment: Alignment.center,
          text: 'i’ve read and accept the privacy and policy',
          textStyle: TextStyles.GR_14_light,
          value: read,
          padding: EdgeInsets.symmetric(vertical: 1),
          onChange: (value) {
            read = value;
          },
        ),
      ),
    );
  }
}
