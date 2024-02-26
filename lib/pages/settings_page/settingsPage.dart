import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:selamat_application/styles/styles.dart';
import 'package:selamat_application/widget/navbar.dart';
import 'package:selamat_application/widget/searchBar.dart';
import 'package:selamat_application/widget/widget_discovery/container_habits.dart';
import 'package:selamat_application/widget/widget_discovery/container_profile_psikolog.dart';
import 'package:selamat_application/widget/widget_login_register/customElevatedButton.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _darkMode = false;
  bool _notification = false;
  bool _reminder = false;
  bool _location = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColors.bgDarkMode,
          leading: Icon(
            Icons.arrow_back,
            color: AppColors.white,
          ),
          title: Text(
            "Settings",
            style: TextStyles.GR_24_title_regular,
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 0),
                child: Text(
                  'Account Settings',
                  style: TextStyles.GR_24_title_regular,
                ),
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
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  'Task Details',
                  style: TextStyles.GR_24_title_regular,
                ),
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
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  'Reminders',
                  style: TextStyles.GR_24_title_regular,
                ),
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
      ),
    );
  }
}
