import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:selamat_application/styles/styles.dart';
import 'package:selamat_application/widget/navbar.dart';
import 'package:selamat_application/widget/searchBar.dart';
import 'package:selamat_application/widget/widget_discovery/container_habits.dart';
import 'package:selamat_application/widget/widget_discovery/container_profile_psikolog.dart';
import 'package:selamat_application/widget/widget_login_register/customElevatedButton.dart';

class ToDoList extends StatefulWidget {
  ToDoList({super.key});

  @override
  _ToDoListState createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  bool _darkMode = false;
  bool _notification = false;
  bool _reminder = false;
  bool _location = false;

  TextEditingController _textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bgDarkMode,
        leading: Icon(
          Icons.arrow_back,
          color: AppColors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/login_page/facebook_logo.png', // Adjust the path to your logo
                    width: 100,
                    height: 100,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Add Title',
                      style: TextStyles.bold_30,
                    ),
                  )
                ],
              ),
            ),
            Text(
              'Date and Times',
              style: TextStyles.GR_24_title_regular,
            ),
            SizedBox(height: 10),
            ListTile(
              title: Row(
                children: [
                  Icon(
                    Icons.calendar_month,
                    color: AppColors.white,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Start Date',
                    style: TextStyles.GR_16_light,
                  ),
                ],
              ),
              trailing: Text(
                'Wed, 22 Nov 2023',
                style: TextStyles.GR_16_light,
              ), // Add your logic for language selection here
              onTap: () {
                // Add logic for language selection here
              },
            ),
            Divider(),
            ListTile(
              title: Row(
                children: [
                  Icon(
                    Icons.alarm,
                    color: AppColors.white,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Time',
                    style: TextStyles.GR_16_light,
                  ),
                ],
              ),
              trailing: Text('19:00',
                  style: TextStyles
                      .GR_16_light), // Add your logic for language selection here
              onTap: () {
                // Add logic for language selection here
              },
            ),
            Divider(),
            SwitchListTile(
              activeColor: Colors.blue,
              title: Row(
                children: [
                  Icon(Icons.repeat, color: AppColors.white),
                  SizedBox(width: 10),
                  Text('Repeat', style: TextStyles.GR_16_light),
                ],
              ),
              value: _notification,
              onChanged: (bool value) {
                setState(() {
                  _notification = value;
                });
              },
            ),
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
            Divider(),
            ListTile(
              leading: Icon(Icons.description, color: AppColors.white),
              title: Text('Description', style: TextStyles.GR_16_light),
              subtitle: TextField(
                controller: _textFieldController,
                decoration: InputDecoration(
                  hintText: "Add some description",
                ),
                onChanged: (text) {
                  // Handle changes to the text field
                },
              ),
            ),
            Text(
              'Reminders',
              style: TextStyles.GR_24_title_regular,
            ),
            SizedBox(height: 10),
            SwitchListTile(
              activeColor: Colors.blue,
              title: Row(
                children: [
                  Icon(
                    Icons.notifications_on,
                    color: AppColors.white,
                  ),
                  SizedBox(width: 10),
                  Text('Reminder', style: TextStyles.GR_16_light),
                ],
              ),
              value: _reminder,
              onChanged: (bool value) {
                setState(() {
                  _reminder = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
