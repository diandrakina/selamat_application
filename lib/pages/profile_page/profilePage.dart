import 'package:flutter/material.dart';
import 'package:selamat_application/styles/styles.dart';

import 'package:selamat_application/widget/customTextFormField.dart';
import 'package:selamat_application/widget/customCheckboxButton.dart';
import 'package:selamat_application/widget/customElevatedButton.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bgDarkMode,
        title: Text(
          'Profile',
          style: TextStyles.GR_24_bold,
        ),
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    color: AppColors.baseColorCard, shape: BoxShape.circle),
              ),
            ),
            height: 584,
            width: 380,
            decoration: BoxDecoration(
                color: AppColors.darkModeCard,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12))),
          ),
          Container(
            alignment: Alignment.topRight,
          )
        ],
      ),
    );
  }
}
