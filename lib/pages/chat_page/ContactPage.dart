import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:flutter/material.dart';
import 'package:selamat_application/styles/styles.dart';
import 'package:selamat_application/widget/navbar.dart';
import 'package:selamat_application/widget/searchBar.dart';
import 'package:selamat_application/widget/widget_discovery/container_habits.dart';
import 'package:selamat_application/widget/widget_discovery/container_profile_psikolog.dart';
import 'package:selamat_application/widget/widget_login_register/customElevatedButton.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contact Page',
      theme: new ThemeData(scaffoldBackgroundColor: AppColors.bgDarkMode),
      home: ContactPage(),
    );
  }
}

class ContactPage extends StatefulWidget {
  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bgDarkMode,
        leading: IconButton(
          iconSize: 18,
          icon: Icon(
            FontAwesomeIcons.arrowLeft,
            color: AppColors.white,
          ),
          onPressed: () {},
        ),
        title: Text(
          'Chats',
          style: TextStyles.GR_24_bold,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            color: AppColors.white,
            onPressed: () {
              // Implement search functionality
            },
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            color: AppColors.white,
            onPressed: () {
              // Implement more options
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 20, // Assuming there are 20 recent chats
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.grey,
              backgroundImage:
                  AssetImage('assets/images/login_page/facebook_logo.png'),
            ),
            title: Text(
              'Contact Name',
              style: TextStyles.GR_16_regular,
            ),
            subtitle: Text(
              'Last message from contact',
              style: TextStyle(color: Colors.white70),
            ),
            trailing: Text(
              '10:30 AM',
              style: TextStyle(color: Colors.white70),
            ), // Last message time
            onTap: () {
              // Open chat with this contact
            },
          );
        },
      ),
    );
  }
}
