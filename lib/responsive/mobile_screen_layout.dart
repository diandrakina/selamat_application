import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:selamat_application/models/user.dart';
import 'package:selamat_application/providers/timer_provider.dart';
import 'package:selamat_application/providers/user_provider.dart';
import 'package:selamat_application/resources/firestore_methods.dart';
import 'package:selamat_application/styles/styles.dart';
import 'package:selamat_application/utils/global_variable.dart';
// import 'package:instagram_clone/providers/user_provider.dart';
// import 'package:provider/provider.dart';
// import 'package:instagram_clone/models/user.dart' as model;

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({super.key});

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
  int timerValue = 0;
  late Timer _timer;

  int _page = 0;
  late PageController pageController;
  bool _isTimerActive = false;

  DateTime _startTime = DateTime.now();
  DateTime _endTime = DateTime.now();
  int _totalTime = 0;

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();

    pageController.dispose();
  }

  void startTimer() {
    Provider.of<TimerProvider>(context, listen: false).startTimer();
    setState(() {
      _isTimerActive = true;
      _startTime = DateTime.now();
    });
    // print('AAAAAAAAAAAAAAAAAAA ${_startTime}');
  }

  void endTimer(String uid) {
    Provider.of<TimerProvider>(context, listen: false).stopTimer();
    setState(() {
      _isTimerActive = false;
      _endTime = DateTime.now();
      _totalTime = _endTime.difference(_startTime).inSeconds;
      global_todaysWorkTime = _totalTime;
    });
    FirestoreMethods().updateHour(uid, _totalTime);
    // print(_totalTime);
    // print('AAAAAAAAAAAAAAAAAAA ${_endTime}');
    // print('AAAAAAAAAAAAAAAAAAA ${_endTime.difference(_startTime)}');
  }

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  void navigationTapped(int page) {
    pageController.jumpToPage(page);
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<UserProvider>(context).getUser;
    bool timerVisible = Provider.of<TimerProvider>(context).timerVisible;
    Color primaryColor = AppColors.white;
    Color secondaryColor = Colors.white54;

    return Scaffold(
      body: PageView(
        children: homeScreenItems,
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: onPageChanged,
      ),
      bottomNavigationBar: SizedBox(
        height: 70,
        child: ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12), topRight: Radius.circular(12)),
          child: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            backgroundColor: AppColors.darkModeCard,
            onTap: navigationTapped,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    size: 32,
                    color: _page == 0 ? primaryColor : secondaryColor,
                  ),
                  label: '',
                  backgroundColor: primaryColor),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.search,
                    size: 32,
                    color: _page == 1 ? primaryColor : secondaryColor,
                  ),
                  label: '',
                  backgroundColor: primaryColor),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.calendar_month,
                    size: 32,
                    color: _page == 2 ? primaryColor : secondaryColor,
                  ),
                  label: '',
                  backgroundColor: primaryColor),
              BottomNavigationBarItem(
                  icon: Icon(
                    FontAwesomeIcons.running,
                    size: 32,
                    color: _page == 3 ? primaryColor : secondaryColor,
                  ),
                  label: '',
                  backgroundColor: primaryColor),
              BottomNavigationBarItem(
                  icon: Icon(
                    FontAwesomeIcons.chartSimple,
                    size: 32,
                    color: _page == 4 ? primaryColor : secondaryColor,
                  ),
                  label: '',
                  backgroundColor: primaryColor),
            ],
          ),
        ),
      ),
      persistentFooterButtons: timerVisible
          ? [
              Container(
                height: 50,
                padding: EdgeInsets.symmetric(horizontal: 20),
                color: Colors.blue,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Work", style: TextStyles.GR_16_bold
                        // TextStyle(
                        //   color: Colors.white,

                        // ),
                        ),
                    Row(
                      children: [
                        Consumer<TimerProvider>(
                          builder: (context, timerProvider, _) {
                            return Text(
                                "${Provider.of<TimerProvider>(context).formattedTimerValue} ",
                                // '${timerProvider.timerValue}',
                                style: TextStyles.GR_16_bold);
                          },
                        ),
                        _isTimerActive == false
                            ? ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(Colors
                                          .grey), // Change to your desired color
                                ),
                                onPressed: startTimer,
                                child:
                                    Text('Start', style: TextStyles.GR_16_bold),
                              )
                            : ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(Colors
                                          .grey), // Change to your desired color
                                ),
                                onPressed:() => endTimer(user.uid),
                                child:
                                    Text('End', style: TextStyles.GR_16_bold),
                              ),
                      ],
                    )
                  ],
                ),
              ),
            ]
          : null,
    );
  }
}
