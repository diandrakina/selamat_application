import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:selamat_application/pages/profile_page/editProfile.dart';
import 'package:selamat_application/pages/settings_page/reminderSettings.dart';
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
        toolbarHeight: 80,
        leadingWidth: double.maxFinite,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: Row(
          children: [
            const Padding(padding: EdgeInsets.all(5)),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const FaIcon(
                Icons.arrow_back,
                color: AppColors.white,
                size: 25,
              ),
            ),
            const Padding(padding: EdgeInsets.all(5)),
            Text(
              "Settings",
              style: TextStyles.bold_30,
            ),
          ],
        ),
      ),

      //BODY
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          width: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //ACOUNTS SETTINGS
              Text(
                'Account Settings',
                style: TextStyles.bold_24,
              ),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                    color: AppColors.inactiveTask,
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  children: [
                    ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const EditProfile(),
                          ),
                        );
                      },
                      title: Row(
                        children: [
                          const FaIcon(
                            Icons.person,
                            color: AppColors.white,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            'Profile',
                            style: TextStyles.light_18,
                          ),
                        ],
                      ),
                      trailing: const Icon(
                        Icons.navigate_next,
                        color: AppColors.white,
                      ),
                    ),
                    const Divider(
                      height: 2,
                    ),
                    ListTile(
                      title: Row(
                        children: [
                          const Icon(
                            Icons.shield_outlined,
                            color: AppColors.white,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            'Password and Security',
                            style: TextStyles.light_18,
                          ),
                        ],
                      ),
                      trailing: const Icon(
                        Icons.navigate_next,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              //ALWAYS ON SCREEN
              Text(
                'Always on Screen',
                style: TextStyles.bold_24,
              ),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                    color: AppColors.inactiveTask,
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  children: [
                    ListTile(
                      title: Row(
                        children: [
                          const Icon(Icons.notifications,
                              color: AppColors.white),
                          const SizedBox(width: 10),
                          Text('Notification', style: TextStyles.light_18),
                        ],
                      ),
                      trailing: const Icon(
                        Icons.navigate_next,
                        color: AppColors.white,
                      ),
                    ),
                    const Divider(
                      height: 2,
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ReminderSettings(),
                          ),
                        );
                      },
                      title: Row(
                        children: [
                          const Icon(Icons.notifications_active,
                              color: AppColors.white),
                          const SizedBox(width: 10),
                          Text('Reminder', style: TextStyles.light_18),
                        ],
                      ),
                      trailing: const Icon(
                        Icons.navigate_next,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              //APP SETTINGS
              Text(
                'App Settings',
                style: TextStyles.bold_24,
              ),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                    color: AppColors.inactiveTask,
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  children: [
                    ListTile(
                      title: Row(
                        children: [
                          const Icon(Icons.translate, color: AppColors.white),
                          const SizedBox(width: 10),
                          Text('Language', style: TextStyles.light_18),
                        ],
                      ),
                      trailing: const Icon(
                        Icons.navigate_next,
                        color: AppColors.white,
                      ),
                    ),
                    const Divider(
                      height: 2,
                    ),
                    ListTile(
                      title: Row(
                        children: [
                          const Icon(Icons.light_mode, color: AppColors.white),
                          const SizedBox(width: 10),
                          Text('Theme', style: TextStyles.light_18),
                        ],
                      ),
                      trailing: const Icon(
                        Icons.navigate_next,
                        color: AppColors.white,
                      ),
                    ),
                    const Divider(
                      height: 2,
                    ),
                    ListTile(
                      title: Row(
                        children: [
                          const Icon(Icons.help, color: AppColors.white),
                          const SizedBox(width: 10),
                          Text('Help', style: TextStyles.light_18),
                        ],
                      ),
                      trailing: const Icon(
                        Icons.navigate_next,
                        color: AppColors.white,
                      ),
                    ),
                    const Divider(
                      height: 2,
                    ),
                    ListTile(
                      title: Row(
                        children: [
                          const Icon(Icons.privacy_tip, color: AppColors.white),
                          const SizedBox(width: 10),
                          Text('Privacy Policy', style: TextStyles.light_18),
                        ],
                      ),
                      trailing: const Icon(
                        Icons.navigate_next,
                        color: AppColors.white,
                      ),
                    ),
                    const Divider(
                      height: 2,
                    ),
                    SwitchListTile(
                      activeColor: AppColors.baseColor,
                      inactiveThumbColor: Colors.white,
                      inactiveTrackColor: AppColors.inactiveTask,
                      title: Row(
                        children: [
                          const Icon(
                            Icons.pin,
                            color: AppColors.white,
                          ),
                          const SizedBox(width: 10),
                          Text('PIN', style: TextStyles.light_18),
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
              const SizedBox(
                height: 15,
              ),
              //LOGOUT
              Container(
                decoration: BoxDecoration(
                    color: AppColors.inactiveTask,
                    borderRadius: BorderRadius.circular(8)),
                child: ListTile(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            backgroundColor: AppColors.darkModeCard,
                            content: Container(
                              padding: const EdgeInsets.all(5),
                              height: 180,
                              width: 380,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Log Out",
                                    style: TextStyles.bold_24,
                                  ),
                                  Text(
                                    "Are you sure  want to log out the account? the changes will saved into your account",
                                    style: TextStyles.light_18,
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  Row(
                                    children: [
                                      const SizedBox(
                                        width: 100,
                                      ),
                                      GestureDetector(
                                        child: Text(
                                          "No Thanks",
                                          style: TextStyles.alertGrey,
                                        ),
                                        onTap: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      GestureDetector(
                                        child: Text(
                                          "Log Out",
                                          style: TextStyles.alertRed,
                                        ),
                                        onTap: () {
                                          // Navigator.push(
                                          //   context,
                                          //   MaterialPageRoute(
                                          //     builder: (context) =>
                                          //         NewProfilePage(),
                                          //   ),
                                          // );
                                        },
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        });
                  },
                  title: Row(
                    children: [
                      const Icon(Icons.logout, color: AppColors.pastelRed),
                      const SizedBox(width: 10),
                      Text('Log Out', style: TextStyles.light_18),
                    ],
                  ),
                ),
              ),

              const SizedBox(
                height: 15,
              )
            ],
          ),
        ),
      ),
    );
  }
}
