import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:selamat_application/styles/styles.dart';
import 'package:selamat_application/widget/navbar.dart';
import 'package:selamat_application/widget/searchBar.dart';
import 'package:selamat_application/widget/widget_discovery/container_habits.dart';
import 'package:selamat_application/widget/widget_discovery/container_profile_psikolog.dart';
import 'package:selamat_application/widget/widget_login_register/customElevatedButton.dart';
import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(TimerApp());
}

class TimerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Timer App',
      theme: new ThemeData(scaffoldBackgroundColor: AppColors.bgDarkMode),
      home: TimerHomePage(),
    );
  }
}

class TimerHomePage extends StatefulWidget {
  @override
  _TimerHomePageState createState() => _TimerHomePageState();
}

class _TimerHomePageState extends State<TimerHomePage> {
  int _totalSeconds = 0;
  bool _isActive = false;
  late Timer _timer;

  void _toggleTimer() {
    setState(() {
      if (_isActive) {
        _isActive = false;
        _timer.cancel();
      } else {
        _isActive = true;
        _timer = Timer.periodic(Duration(seconds: 1), (timer) {
          setState(() {
            if (_totalSeconds > 0) {
              _totalSeconds--;
            } else {
              _isActive = false;
              _timer.cancel();
            }
          });
        });
      }
    });
  }

  void _resetTimer() {
    setState(() {
      _isActive = false;
      _totalSeconds = 0;
      _timer.cancel();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    String minuteString = minutes.toString().padLeft(2, '0');
    String secondString = remainingSeconds.toString().padLeft(2, '0');
    return '$minuteString:$secondString';
  }

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
            "Modes",
            style: TextStyles.GR_24_title_regular,
          )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 300.0,
                  height: 300.0,
                  child: CircularProgressIndicator(
                    value: _totalSeconds / 1500, // 10 minutes = 600 seconds
                    strokeWidth: 25.0,
                    backgroundColor: Colors.grey,
                    valueColor:
                        AlwaysStoppedAnimation<Color>(AppColors.baseColor),
                  ),
                ),
                Text(
                  _formatTime(_totalSeconds),
                  style: TextStyles.bold_70_white,
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: EdgeInsets.only(top: 100),
              child: SizedBox(
                width: 320,
                height: 50,
                child: ElevatedButton(
                    onPressed: () {
                      if (_totalSeconds == 0) {
                        setState(() {
                          _totalSeconds =
                              1500; // Set your desired initial timer value here (10 minutes)
                        });
                      }
                      _toggleTimer();
                    },
                    child: Text(
                      _isActive ? 'Stop Session' : 'Start Session',
                      style: TextStyles.GR_24_bold,
                    ),
                    style: _isActive
                        ? ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            backgroundColor: AppColors.pastelRed)
                        : ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            backgroundColor: AppColors.baseColor)),
              ),
            ),
            SizedBox(height: 20.0),
            SizedBox(
              width: 320,
              height: 50,
              child: ElevatedButton(
                  onPressed: _resetTimer,
                  child: Text(
                    'Reset',
                    style: TextStyles.GR_24_bold,
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    backgroundColor: AppColors.floatingGrey,
                  )),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _totalSeconds =
                1500; // Set your desired initial timer value here (10 minutes)
          });
        },
        tooltip: 'Set Timer',
        child: Icon(Icons.timer),
      ),
    );
  }
}
