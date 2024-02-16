import 'package:flutter/material.dart';
import 'package:selamat_application/styles/styles.dart';
import 'package:selamat_application/widget/widget_login_register/customTextFormField.dart';
import 'package:selamat_application/widget/widget_login_register/customCheckboxButton.dart';
import 'package:selamat_application/widget/widget_login_register/customElevatedButton.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        leadingWidth: double.maxFinite,
        backgroundColor: AppColors.bgDarkMode,
        // backgroundColor: Colors.amber,
        leading: Container(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Text(
            'Privacy and Policy',
            style: TextStyles.GR_42_bold,
            // buat semenetara pake 42 dulu, tunggu sampe dibuat yang 49
            // ini buat bikin judulnya
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Who we are?',
                style: TextStyles.GR_24_title_regular,
                // ini headernya
              ),
              SizedBox(height: 10),
              Text(
                "Lorem Ipsum is simply dummy text of the .\nLorem Ipsum has been the industry's standard\nwhen an unknown printer took a galley of type \nand scrambled it to make a type specimen \nbook. It has survived not only five centuries, ",
                style: TextStyles.GR_16_light,
                // ini textnya
              ),
              SizedBox(height: 30),
              Text(
                'Comments',
                style: TextStyles.GR_24_title_regular,
              ),
              SizedBox(height: 10),
              Text(
                "Lorem Ipsum is simply dummy text of the .\nLorem Ipsum has been the industry's standard\nwhen an unknown printer took a galley of type \nand scrambled it to make a type specimen \nbook. It has survived not only five centuries, ",
                style: TextStyles.GR_16_light,
              ),
              // Add more sections as needed

              // Example additional section:
              SizedBox(height: 30),
              Text(
                'Media',
                style: TextStyles.GR_24_title_regular,
              ),
              SizedBox(height: 10),
              Text(
                "Lorem Ipsum is simply dummy text of the .\nLorem Ipsum has been the industry's standard\nwhen an unknown printer took a galley of type \nand scrambled it to make a type specimen \nbook. It has survived not only five centuries, ",
                style: TextStyles.GR_16_light,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
