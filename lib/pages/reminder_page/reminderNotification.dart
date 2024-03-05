import 'package:flutter/material.dart';
import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:flutter/material.dart';
import 'package:selamat_application/styles/styles.dart';
import 'package:selamat_application/widget/navbar.dart';
import 'package:selamat_application/widget/searchBar.dart';
import 'package:selamat_application/widget/widget_discovery/container_habits.dart';
import 'package:selamat_application/widget/widget_discovery/container_profile_psikolog.dart';
import 'package:selamat_application/widget/widget_login_register/customElevatedButton.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(ReminderNotification());
}

class ReminderNotification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reminder Notification',
      home: ReminderNotif(),
    );
  }
}

class ReminderNotif extends StatefulWidget {
  @override
  _ReminderNotifState createState() => _ReminderNotifState();
}

class _ReminderNotifState extends State<ReminderNotif> {
  bool _isAlarmActive = true;
  // late AudioCache audioPlayer;
  final audio2 = AudioPlayer();

  @override
  void initState() {
    super.initState();
    // audioPlayer = AudioCache(prefix: 'assets/audio/');
    _playAudio();
  }

  Future<void> _playAudio() async {
    await audio2.play(AssetSource("audio/ringtone.mp3"));
    // audio2.play('assets/audio/ringtone.mp3');
  }

  Future<void> _stopAudio() async {
    await audio2.stop();
  }

  void _checkAlarm() {
    _stopAudio();
    _playAudio();
    setState(() {
      _isAlarmActive = false;
    });
  }

  void _dismissAlarm() {
    _stopAudio();
    _playAudio();
    setState(() {
      _isAlarmActive = false;
    });
  }

  void _snoozeAlarm() {
    _stopAudio();
    setState(() {
      _isAlarmActive = false;
    });

    // Snooze the alarm for 5 minutes
    Timer(Duration(minutes: 5), () {
      setState(() {
        _isAlarmActive = true;
        _playAudio();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.bgDarkMode, // Background color set to red
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (_isAlarmActive)
              Expanded(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 150),
                        child: Column(
                          children: [
                            Text(
                              'Work',
                              style: TextStyles.GR_42_bold,
                            ),
                            Text('ayo kerja yang bener',
                                style: TextStyles.GR_24_title_regular),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 100),
                        child: TextButton(
                          onPressed: _snoozeAlarm,
                          child: Text('Snooze',
                              style: TextStyles.GR_24_title_light),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 50.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            OutlinedButton(
                              onPressed: _dismissAlarm,
                              style: OutlinedButton.styleFrom(
                                shape: CircleBorder(),
                                side: BorderSide(color: Colors.white),
                                fixedSize: Size(120, 120),
                              ),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Icon(
                                    Icons.close,
                                    color: Colors.white,
                                    size: 70,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            //
                            ElevatedButton(
                              onPressed: _checkAlarm,
                              style: ElevatedButton.styleFrom(
                                shape: CircleBorder(),
                                padding: EdgeInsets.all(24),
                                backgroundColor: AppColors.pastelGreenHealth,
                              ),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Icon(
                                    Icons.check,
                                    color: AppColors.white,
                                    size: 70,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}