import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:selamat_application/pages/schedule_page/toDoList.dart';
import 'package:selamat_application/styles/styles.dart';

class VisibilityPage extends StatelessWidget {
  const VisibilityPage({super.key});

  @override
  Widget build(BuildContext context) {
    String visibility = "Public";
    return SafeArea(
      child: Scaffold(
        //APPBAR
        appBar: AppBar(
          toolbarHeight: 80,
          leadingWidth: double.maxFinite,
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          leading: Row(
            children: [
              const Padding(padding: EdgeInsets.all(5)),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop(visibility);
                },
                child: const FaIcon(
                  Icons.arrow_back,
                  color: AppColors.white,
                  size: 25,
                ),
              ),
              const Padding(padding: EdgeInsets.all(5)),
              Text(
                "Visibility",
                style: TextStyles.bold_30,
              ),
            ],
          ),
        ),

        //BODY
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                ListTile(
                  onTap: () {
                    visibility = "Public";
                    print(visibility);
                  },
                  title: Row(
                    children: [
                      Icon(Icons.public, color: AppColors.white),
                      SizedBox(width: 10),
                      Text('Public', style: TextStyles.regular_18),
                    ],
                  ),
                ),
                const Divider(
                  height: 10,
                  color: AppColors.activeCalendar,
                ),
                ListTile(
                  onTap: () {
                    visibility = "Private";
                    print(visibility);
                  },
                  title: Row(
                    children: [
                      Icon(Icons.lock, color: AppColors.white),
                      SizedBox(width: 10),
                      Text('Private', style: TextStyles.regular_18),
                    ],
                  ),
                ),
                const Divider(
                  height: 10,
                  color: AppColors.activeCalendar,
                ),
                ListTile(
                  onTap: () {
                    visibility = "Show category only";
                    print(visibility);
                  },
                  title: Row(
                    children: [
                      Icon(Icons.list_alt, color: AppColors.white),
                      SizedBox(width: 10),
                      Text('Show category only', style: TextStyles.regular_18),
                    ],
                  ),
                ),
                const Divider(
                  height: 10,
                  color: AppColors.activeCalendar,
                ),
                ListTile(
                  onTap: () {
                    visibility = 'Mutuals only';
                    print(visibility);
                  },
                  title: Row(
                    children: [
                      Icon(Icons.group, color: AppColors.white),
                      SizedBox(width: 10),
                      Text('Mutuals only', style: TextStyles.regular_18),
                    ],
                  ),
                ),
                const Divider(
                  height: 10,
                  color: AppColors.activeCalendar,
                ),
                ListTile(
                  onTap: () {
                    visibility = 'Mutuals only + category only';
                    print(visibility);
                  },
                  title: Row(
                    children: [
                      Icon(Icons.group_add, color: AppColors.white),
                      SizedBox(width: 10),
                      Text('Mutuals only + category only',
                          style: TextStyles.regular_18),
                    ],
                  ),
                ),

                      Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 10),
                                Text(
                                  "When your tasks are public, your tasks can be seen by your anyone, even if they don’t add you as a mutual.",
                                  style: TextStyles.GR_12_light,
                                  // ini textnya
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  "When your tasks are private, only you can see your tasks, public or mutuals can not see what your task is.",
                                  style: TextStyles.GR_12_light,
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  "When your tasks are categories only, public can see your tasks, but only its category, so don’t worry your detail will get expose.",
                                  style: TextStyles.GR_12_light,
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  "When your tasks are mutuals only, only your mutuals see your tasks, public can not see what your task is.",
                                  style: TextStyles.GR_12_light,
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  "When your tasks are mutuals + category only, only your mutuals see your tasks and only see what the categories (not even a task name, just category), and public can not see your task is.",
                                  style: TextStyles.GR_12_light,
                                ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
