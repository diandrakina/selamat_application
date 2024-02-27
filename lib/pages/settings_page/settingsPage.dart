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
                      Icons.person,
                      color: AppColors.white,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Profile',
                      style: TextStyles.GR_16_light,
                    ),
                  ],
                ),
                trailing: Icon(
                  Icons.navigate_next,
                  color: AppColors.white,
                ),
              ),
              Divider(),
              ListTile(
                title: Row(
                  children: [
                    Icon(
                      Icons.shield_outlined,
                      color: AppColors.white,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Password and Security',
                      style: TextStyles.GR_16_light,
                    ),
                  ],
                ),
                trailing: Icon(
                  Icons.navigate_next,
                  color: AppColors.white,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  'Always on Screen',
                  style: TextStyles.GR_24_title_regular,
                ),
              ),
              SizedBox(height: 10),
              ListTile(
                title: Row(
                  children: [
                    Icon(Icons.notifications, color: AppColors.white),
                    SizedBox(width: 10),
                    Text('Notification', style: TextStyles.GR_16_light),
                  ],
                ),
                trailing: Icon(
                  Icons.navigate_next,
                  color: AppColors.white,
                ),
              ),
              Divider(),
              ListTile(
                title: Row(
                  children: [
                    Icon(Icons.notifications_active_outlined,
                        color: AppColors.white),
                    SizedBox(width: 10),
                    Text('Reminder', style: TextStyles.GR_16_light),
                  ],
                ),
                trailing: Icon(
                  Icons.navigate_next,
                  color: AppColors.white,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  'App Settings',
                  style: TextStyles.GR_24_title_regular,
                ),
              ),
              SizedBox(height: 10),
              ListTile(
                title: Row(
                  children: [
                    Icon(Icons.translate, color: AppColors.white),
                    SizedBox(width: 10),
                    Text('Language', style: TextStyles.GR_16_light),
                  ],
                ),
                trailing: Icon(
                  Icons.navigate_next,
                  color: AppColors.white,
                ),
              ),
              Divider(),
              ListTile(
                title: Row(
                  children: [
                    Icon(Icons.light_mode, color: AppColors.white),
                    SizedBox(width: 10),
                    Text('Theme', style: TextStyles.GR_16_light),
                  ],
                ),
                trailing: Icon(
                  Icons.navigate_next,
                  color: AppColors.white,
                ),
              ),
              Divider(),
              ListTile(
                title: Row(
                  children: [
                    Icon(Icons.help, color: AppColors.white),
                    SizedBox(width: 10),
                    Text('Help', style: TextStyles.GR_16_light),
                  ],
                ),
                trailing: Icon(
                  Icons.navigate_next,
                  color: AppColors.white,
                ),
              ),
              Divider(),
              ListTile(
                title: Row(
                  children: [
                    Icon(Icons.privacy_tip, color: AppColors.white),
                    SizedBox(width: 10),
                    Text('Privacy Policy', style: TextStyles.GR_16_light),
                  ],
                ),
                trailing: Icon(
                  Icons.navigate_next,
                  color: AppColors.white,
                ),
              ),
              Divider(),
              SwitchListTile(
                activeColor: Colors.blue,
                title: Row(
                  children: [
                    Icon(
                      Icons.pin,
                      color: AppColors.white,
                    ),
                    SizedBox(width: 10),
                    Text('PIN', style: TextStyles.GR_16_light),
                  ],
                ),
                value: _reminder,
                onChanged: (bool value) {
                  setState(() {
                    _reminder = value;
                  });
                },
              ),
              Divider(),
              ListTile(
                title: Row(
                  children: [
                    Icon(Icons.logout, color: AppColors.pastelRed),
                    SizedBox(width: 10),
                    Text('Log Out', style: TextStyles.GR_16_light),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
