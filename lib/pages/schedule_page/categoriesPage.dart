import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:selamat_application/styles/styles.dart';
import 'package:selamat_application/widget/navbar.dart';
import 'package:selamat_application/widget/searchBar.dart';
import 'package:selamat_application/widget/widget_discovery/container_habits.dart';
import 'package:selamat_application/widget/widget_discovery/container_profile_psikolog.dart';
import 'package:selamat_application/widget/widget_login_register/customElevatedButton.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.bgDarkMode,
              toolbarHeight: 80,
              leading: Icon(
                Icons.arrow_back,
                color: AppColors.white,
              ),
              title: Text(
                'Categories',
                style: TextStyles.GR_24_title_regular,
              ),
            ),
            body: SingleChildScrollView(
              child: Container(
                child: Column(children: [
                  ListTile(
                    title: Row(
                      children: [
                        Icon(Icons.work, color: AppColors.white),
                        SizedBox(width: 10),
                        Text('Work', style: TextStyles.GR_16_light),
                      ],
                    ),
                  ),
                  Divider(),
                  ListTile(
                    title: Row(
                      children: [
                        Icon(Icons.sports_gymnastics, color: AppColors.white),
                        SizedBox(width: 10),
                        Text('Exercise', style: TextStyles.GR_16_light),
                      ],
                    ),
                  ),
                  Divider(),
                  ListTile(
                    title: Row(
                      children: [
                        Icon(Icons.house, color: AppColors.white),
                        SizedBox(width: 10),
                        Text('Family', style: TextStyles.GR_16_light),
                      ],
                    ),
                  ),
                  Divider(),
                  ListTile(
                    title: Row(
                      children: [
                        Icon(Icons.emoji_emotions, color: AppColors.white),
                        SizedBox(width: 10),
                        Text('Daily', style: TextStyles.GR_16_light),
                      ],
                    ),
                  ),
                  Divider(),
                  ListTile(
                    title: Row(
                      children: [
                        Icon(Icons.gamepad, color: AppColors.white),
                        SizedBox(width: 10),
                        Text('Leisure', style: TextStyles.GR_16_light),
                      ],
                    ),
                  ),
                  Divider(),
                  ListTile(
                    title: Row(
                      children: [
                        Icon(Icons.add, color: AppColors.white),
                        SizedBox(width: 10),
                        Text('Add more categories...',
                            style: TextStyles.GR_16_light),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        Text(
                          "if you add more categories, we won’t track your activity that related to custom category, we only track main categories, since they are your main activities that you need in your life.",
                          style: TextStyles.GR_12_light,
                          // ini textnya
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
            )));
  }
}
