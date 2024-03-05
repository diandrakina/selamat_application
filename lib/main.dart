// import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:selamat_application/pages/activity_page/activityPage.dart';
import 'package:selamat_application/pages/add_schedule_notes/addShareNotes.dart';
import 'package:selamat_application/pages/add_schedule_notes/addShareSchedule.dart';
import 'package:selamat_application/pages/chat_page/ChatPage.dart';
import 'package:selamat_application/pages/chat_page/ContactPage.dart';
import 'package:selamat_application/pages/drawer/notificationPage.dart';

// LOGIN
import 'package:selamat_application/pages/login_page/loginPage.dart';
import 'package:selamat_application/pages/login_page/beforeLoginPage.dart';
import 'package:selamat_application/pages/login_page/enterPIN.dart';
import 'package:selamat_application/pages/login_page/createPasswordPage.dart';
import 'package:selamat_application/pages/other_profile/otherProfilePage.dart';
import 'package:selamat_application/pages/payment_page/payment1.dart';
import 'package:selamat_application/pages/payment_page/payment2.dart';
import 'package:selamat_application/pages/payment_page/payment3.dart';
import 'package:selamat_application/pages/payment_page/payment4.dart';
import 'package:selamat_application/pages/payment_page/transactionHistory.dart';
import 'package:selamat_application/pages/profile_page/editProfile.dart';
import 'package:selamat_application/pages/profile_page/profileSharedSchedule.dart';

import 'package:selamat_application/pages/rule_page/privacyPolicy.dart';
import 'package:selamat_application/pages/schedule_page/categoriesPage.dart';
import 'package:selamat_application/pages/schedule_page/allSchedule.dart';
import 'package:selamat_application/pages/schedule_page/toDoList.dart';
import 'package:selamat_application/pages/schedule_page/visibilityPage.dart';
import 'package:selamat_application/pages/settings_page/reminderSettings.dart';
import 'package:selamat_application/pages/settings_page/settingsPage.dart';
import 'package:selamat_application/pages/statistic_page/StatisticPage.dart';

// WELCOME PAGE
import 'package:selamat_application/pages/welcome_page/welcomePage.dart';
import 'package:selamat_application/pages/welcome_page/askQuestion.dart';

//QUESTION
import 'package:selamat_application/pages/question_page/startUpQuestionPage.dart';
import 'package:selamat_application/pages/question_page/endUpQuestionPage.dart';
import 'package:selamat_application/pages/question_page/targetQuestionPage.dart';
import 'package:selamat_application/pages/question_page/goalsQuestionPage.dart';
import 'package:selamat_application/pages/welcome_page/youAlmostThere.dart';

//HOME PAGE
import 'package:selamat_application/pages/home_page/homePage.dart';

//DISCOVERY PAGE
import 'package:selamat_application/pages/discovery_page/discoveryPage.dart';
import 'package:selamat_application/pages/discovery_page/discoverPsychologist.dart';
import 'package:selamat_application/pages/discovery_page/featuredHabitsPage.dart';
import 'package:selamat_application/pages/discovery_page/habitPage.dart';
import 'package:selamat_application/pages/discovery_page/psychologistDetailPage.dart';
import 'package:selamat_application/pages/discovery_page/searchDiscoverPage.dart';
import 'package:selamat_application/pages_psychologist/home_psychologist/homePagePsychologist.dart';
import 'package:selamat_application/pages_psychologist/profile_psychologist_page/profilePsychologistPage.dart';
import 'package:selamat_application/providers/user_provider.dart';
import 'package:selamat_application/responsive/mobile_screen_layout.dart';

//STYLES
import 'package:selamat_application/styles/styles.dart';
import 'package:selamat_application/try.dart';
import 'package:selamat_application/widget/chart/profile_page/donutChart.dart';
import 'package:selamat_application/widget/widget_payment/customStepper.dart';
import 'package:selamat_application/pages/schedule_page/schedulePage.dart';
import 'package:selamat_application/widget/widget_schedule/scheduleAction.dart';

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
          title: 'Joeliardo Test Commit',
          theme: new ThemeData(scaffoldBackgroundColor: AppColors.bgDarkMode),
          debugShowCheckedModeBanner: false,
          //   home: StreamBuilder(
          //     stream: FirebaseAuth.instance.authStateChanges(),
          //     builder: (context, snapshot) {
          //       if (snapshot.connectionState == ConnectionState.active) {
          //         if (snapshot.hasData) {
          //           // UserProvider _userProvider = Provider.of(context, listen: false);
          //           // await _userProvider.refreshUser();
          //         } else if (snapshot.hasError) {
          //           return Center(
          //             child: Text(
          //               '${snapshot.error}',
          //             ),
          //           );
          //         }
          //       }
          //       if (snapshot.connectionState == ConnectionState.waiting) {
          //         return Center(
          //           child: const CircularProgressIndicator(
          //             color: Colors.white,
          //           ),
          //         );
          //       }
          //       return MobileScreenLayout();
          //     },
          //   ),
          // ));
          home: ProfilePsychologistPage()),
    );
    // home: StreamBuilder(
    //   stream: FirebaseAuth.instance.authStateChanges(),
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.active) {
    //       if (snapshot.hasData) {
    //         // UserProvider _userProvider = Provider.of(context, listen: false);
    //         // await _userProvider.refreshUser();
    //       } else if (snapshot.hasError) {
    //         return Center(
    //           child: Text(
    //             '${snapshot.error}',
    //           ),
    //         );
    //       }
    //     }
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return Center(
    //         child: const CircularProgressIndicator(
    //           color: Colors.white,
    //         ),
    //       );
    //     }
    //     return LoginPage();
    //   },
    // ),
  }
}
