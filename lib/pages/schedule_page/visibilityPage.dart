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
              toolbarHeight: 80,
              leading: Icon(
                Icons.arrow_back,
                color: AppColors.white,
              ),
              title: Text(
                'Visibility',
                style: TextStyles.GR_24_title_regular,
              ),
            ),
            body: SingleChildScrollView(
              child: Container(
                child: Column(children: [
                  ListTile(
                    title: Row(
                      children: [
                        Icon(Icons.public, color: AppColors.white),
                        SizedBox(width: 10),
                        Text('Public', style: TextStyles.GR_16_light),
                      ],
                    ),
                  ),
                  Divider(),
                  ListTile(
                    title: Row(
                      children: [
                        Icon(Icons.lock, color: AppColors.white),
                        SizedBox(width: 10),
                        Text('Private', style: TextStyles.GR_16_light),
                      ],
                    ),
                  ),
                  Divider(),
                  ListTile(
                    title: Row(
                      children: [
                        Icon(Icons.list_alt, color: AppColors.white),
                        SizedBox(width: 10),
                        Text('Show category only',
                            style: TextStyles.GR_16_light),
                      ],
                    ),
                  ),
                  Divider(),
                  ListTile(
                    title: Row(
                      children: [
                        Icon(Icons.group, color: AppColors.white),
                        SizedBox(width: 10),
                        Text('Mutuals only', style: TextStyles.GR_16_light),
                      ],
                    ),
                  ),
                  Divider(),
                  ListTile(
                    title: Row(
                      children: [
                        Icon(Icons.group_add, color: AppColors.white),
                        SizedBox(width: 10),
                        Text('Mutuals only + category only',
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
                          "When your tasks are public, your tasks can be seen by your anyone, even if they don’t add you as a mutual.",
                          style: TextStyles.GR_12_light,
                          // ini textnya
                        ),
                        SizedBox(height: 10),
                        Text(
                          "When your tasks are private, only you can see your tasks, public or mutuals can not see what your task is.",
                          style: TextStyles.GR_12_light,
                        ),
                        SizedBox(height: 10),
                        Text(
                          "When your tasks are categories only, public can see your tasks, but only its category, so don’t worry your detail will get expose.",
                          style: TextStyles.GR_12_light,
                        ),
                        SizedBox(height: 10),
                        Text(
                          "When your tasks are mutuals only, only your mutuals see your tasks, public can not see what your task is.",
                          style: TextStyles.GR_12_light,
                        ),
                        SizedBox(height: 10),
                        Text(
                          "When your tasks are mutuals + category only, only your mutuals see your tasks and only see what the categories (not even a task name, just category), and public can not see your task is.",
                          style: TextStyles.GR_12_light,
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
            )));
  }
}
