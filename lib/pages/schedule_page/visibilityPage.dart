import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:selamat_application/styles/styles.dart';
import 'package:selamat_application/widget/navbar.dart';
import 'package:selamat_application/widget/searchBar.dart';
import 'package:selamat_application/widget/widget_discovery/container_habits.dart';
import 'package:selamat_application/widget/widget_discovery/container_profile_psikolog.dart';
import 'package:selamat_application/widget/widget_login_register/customElevatedButton.dart';

class VisibilityPage extends StatelessWidget {
  const VisibilityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.bgDarkMode,
              leading: Icon(
                Icons.arrow_back,
                color: AppColors.white,
              ),
            ),
            body: Column(children: [
              Text(
                'Task Details',
                style: TextStyles.GR_24_title_regular,
              ),
              SizedBox(height: 10),
              ListTile(
                title: Row(
                  children: [
                    Icon(Icons.visibility, color: AppColors.white),
                    SizedBox(width: 10),
                    Text('Visibility', style: TextStyles.GR_16_light),
                  ],
                ),
                trailing: Text('Public',
                    style: TextStyles
                        .GR_16_light), // Add your logic for language selection here
                onTap: () {
                  // Add logic for language selection here
                },
              ),
              Divider(),
              ListTile(
                title: Row(
                  children: [
                    Icon(Icons.category, color: AppColors.white),
                    SizedBox(width: 10),
                    Text('Category', style: TextStyles.GR_16_light),
                  ],
                ),
                trailing: Text('None',
                    style: TextStyles
                        .GR_16_light), // Add your logic for language selection here
                onTap: () {
                  // Add logic for language selection here
                },
              ),
            ])));
  }
}
