import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:selamat_application/pages/drawer/modesPage.dart';
import 'package:selamat_application/pages/drawer/notificationPage.dart';
import 'package:selamat_application/pages/profile_page/profileSharedSchedule.dart';
import 'package:selamat_application/pages/settings_page/settingsPage.dart';
import 'package:selamat_application/styles/styles.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: AppColors.bgDarkMode,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(
                "Richie Hartono",
                style: TextStyles.bold_18,
              ),
              accountEmail: Text(
                "452 mutuals",
                style: TextStyles.GR_14_light,
              ),
              currentAccountPicture: CircleAvatar(
                child: ClipOval(
                  child: Image.asset(
                      "assets/images/discovery_page/psikolog/ChenZheyuan.jpg"),
                ),
              ),
              decoration: const BoxDecoration(
                  color: AppColors.bgDarkMode,
                  image: DecorationImage(
                      image: AssetImage(
                          "assets/images/discovery_page/running.png"),
                      fit: BoxFit.cover)),
            ),
            ListTile(
              leading: const FaIcon(
                Icons.person_rounded,
                size: 20,
                color: Colors.white,
              ),
              title: Text(
                "View Profile",
                style: TextStyles.bold_18,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NewProfilePage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const FaIcon(
                FontAwesomeIcons.bell,
                size: 20,
                color: Colors.white,
              ),
              title: Text(
                "Notifications",
                style: TextStyles.bold_18,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NotificationPage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const FaIcon(
                Icons.mode,
                size: 20,
                color: Colors.white,
              ),
              title: Text(
                "Modes",
                style: TextStyles.bold_18,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ModesPage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const FaIcon(
                Icons.settings,
                size: 20,
                color: Colors.white,
              ),
              title: Text(
                "Settings",
                style: TextStyles.bold_18,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SettingsPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
