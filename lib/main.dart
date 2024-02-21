import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

import 'package:selamat_application/pages/login_page/beforeLoginPage.dart';
import 'package:selamat_application/pages/login_page/enterPIN.dart';
// LOGIN
import 'package:selamat_application/pages/login_page/loginPage.dart';
import 'package:selamat_application/pages/login_page/createUsernamePage.dart';
import 'package:selamat_application/pages/login_page/createPasswordPage.dart';
import 'package:selamat_application/pages/login_page/completeProfile.dart';
import 'package:selamat_application/pages/rule_page/privacyPolicy.dart';

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
import 'package:selamat_application/providers/user_provider.dart';

//STYLES
import 'package:selamat_application/styles/styles.dart';
import 'package:selamat_application/widget/chart/home_page_chart/tracking_duration/test_graph.dart';

//WIDGET
import 'package:selamat_application/widget/navbar.dart';
import 'package:selamat_application/widget/widget_home_page.dart/container_work_sleep_time.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        // home: loginPage(),
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasData) {
                // UserProvider _userProvider = Provider.of(context, listen: false);
                // await _userProvider.refreshUser();
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(
                    '${snapshot.error}',
                  ),
                );
              }
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: const CircularProgressIndicator(
                  color: Colors.white,
                ),
              );
            }
            return loginPage();
          },
        ),
      ),
    );
  }
}
