import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:selamat_application/pages/schedule_page/toDoList.dart';
import 'package:selamat_application/styles/styles.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //APPBAR
        appBar: AppBar(
          toolbarHeight: 80,
          leadingWidth: double.maxFinite,
          elevation: 0.0,
          backgroundColor: AppColors.bgDarkMode,
          leading: Row(
            children: [
              const Padding(padding: EdgeInsets.all(5)),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ToDoList(),
                    ),
                  );
                },
                child: const FaIcon(
                  Icons.arrow_back,
                  color: AppColors.white,
                  size: 25,
                ),
              ),
              const Padding(padding: EdgeInsets.all(5)),
              Text(
                "Categories",
                style: TextStyles.bold_30,
              ),
            ],
          ),
        ),

        //BODY
        body: SingleChildScrollView(
          child: Column(children: [
            ListTile(
              title: Row(
                children: [
                  const FaIcon(Icons.work, color: AppColors.white),
                  const SizedBox(width: 10),
                  Text('Work', style: TextStyles.regular_18),
                ],
              ),
            ),
            const Divider(
              height: 10,
              color: AppColors.activeCalendar,
            ),
            ListTile(
              title: Row(
                children: [
                  const FaIcon(Icons.sports_gymnastics, color: AppColors.white),
                  const SizedBox(width: 10),
                  Text('Exercise', style: TextStyles.regular_18),
                ],
              ),
            ),
            const Divider(
              height: 10,
              color: AppColors.activeCalendar,
            ),
            ListTile(
              title: Row(
                children: [
                  const FaIcon(Icons.house, color: AppColors.white),
                  const SizedBox(width: 10),
                  Text('Family', style: TextStyles.regular_18),
                ],
              ),
            ),
            const Divider(
              height: 10,
              color: AppColors.activeCalendar,
            ),
            ListTile(
              title: Row(
                children: [
                  const FaIcon(Icons.emoji_emotions, color: AppColors.white),
                  const SizedBox(width: 10),
                  Text('Daily', style: TextStyles.regular_18),
                ],
              ),
            ),
            const Divider(
              height: 10,
              color: AppColors.activeCalendar,
            ),
            ListTile(
              title: Row(
                children: [
                  const FaIcon(Icons.gamepad, color: AppColors.white),
                  const SizedBox(width: 10),
                  Text('Leisure', style: TextStyles.regular_18),
                ],
              ),
            ),
            const Divider(
              height: 10,
              color: AppColors.activeCalendar,
            ),
            ListTile(
              title: Row(
                children: [
                  const FaIcon(Icons.add, color: AppColors.white),
                  const SizedBox(width: 10),
                  Text('Add more categories...', style: TextStyles.regular_18),
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
                    "if you add more categories, we won’t track your activity that related to custom category, we only track main categories, since they are your main activities that you need in your life.",
                    style: TextStyles.GR_12_light,
                    // ini textnya
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
