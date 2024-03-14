import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:provider/provider.dart';
import 'package:selamat_application/pages/login_page/beforeLoginPage.dart';

import 'package:selamat_application/providers/user_provider.dart';

import 'package:selamat_application/responsive/mobile_screen_layout.dart';
import 'package:selamat_application/responsive/responsive_layout.dart';

//STYLES
import 'package:selamat_application/styles/styles.dart';
import 'package:selamat_application/testing.dart';
import 'package:selamat_application/try.dart';
import 'package:selamat_application/widget/chart/profile_page/donutChart.dart';
import 'package:selamat_application/widget/widget_payment/customStepper.dart';
import 'package:selamat_application/pages/schedule_page/schedulePage.dart';
import 'package:selamat_application/widget/widget_schedule/scheduleAction.dart';
//STYLES
import 'package:selamat_application/styles/styles.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // await AwesomeNotifications().initialize(null, [
  //   NotificationChannel(
  //       channelGroupKey: "basic_channel_group",
  //       channelKey: "basic_channel",
  //       channelName: "Basic Notification",
  //       channelDescription: "Basic Notification Channel")
  // ], channelGroups: [
  //   NotificationChannelGroup(
  //       channelGroupKey: "basic_channel_group", channelGroupName: "Basic Group")
  // ]);
  // bool isAllowedToSendNotification =
  //     await AwesomeNotifications().isNotificationAllowed();
  // if (!isAllowedToSendNotification) {
  //   AwesomeNotifications().requestPermissionToSendNotifications();
  // }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Selamat App',
        theme: new ThemeData(scaffoldBackgroundColor: AppColors.bgDarkMode),
        debugShowCheckedModeBanner: false,
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              // Checking if the snapshot has any data or not
              if (snapshot.hasData) {
                print(snapshot.data);
                // if snapshot has data which means user is logged in then we check the width of screen and accordingly display the screen layout
                // return const ResponsiveLayout(
                //   mobileScreenLayout: MobileScreenLayout(),
                // );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('${snapshot.error}'),
                );
              }
            }

            // means connection to future hasnt been made yet
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return const BeforeLoginPage();
          },
        ),
      ),
    );
  }
}
