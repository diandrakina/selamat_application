import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:selamat_application/styles/styles.dart';
import 'package:audioplayers/audioplayers.dart';
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
      title: 'Modes Page',
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
  // late AudioPlayer _audioPlayer;
  final audio2 = AudioPlayer();

  void initState() {
    super.initState();
    // _audioPlayer = AudioPlayer();
    // _playAudio();
  }

  Future<void> _playAudio() async {
    await audio2.play(AssetSource("audio/ringtone.mp3"));
    // audio2.play('assets/audio/ringtone.mp3');
  }

  Future<void> _stopAudio() async {
    await audio2.stop();
  }

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
              _playAudio();
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

  // void _playRingtone() {
  //   _audioCache.play('ringtones.mp3');
  // }

  // Future<void> playSound() async {
  //   String audioPath = "assets/audio/ringtone.mp3";
  //   await player.play(AssetSource(audioPath));
  // }

  // Future<void> _playRingtone() async {
  //   await _audioPlayer.play(AssetSource('audio/ringtone.mp3'));
  // }

  @override
  void dispose() {
    _timer.cancel();
    // _playAudio.dispose();
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
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child:
                      Text('Pomodoro', style: TextStyles.GR_24_title_regular),
                ),
              ),
              SizedBox(height: 10.0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors
                        .darkModeCard, // Change the background color to grey
                    borderRadius: BorderRadius.circular(
                        12), // Change the border radius to 20
                  ),
                  child: ListTile(
                    title: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors
                                .baseColor, // Change the background color to grey
                            borderRadius: BorderRadius.circular(
                                100), // Change the border radius to 20
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Icon(
                              Icons.work,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Work',
                          style: TextStyles.GR_16_regular,
                        ),
                      ],
                    ),
                    trailing: Text(
                      '09.00',
                      style: TextStyles.GR_16_regular,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 40),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 300.0,
                      height: 300.0,
                      child: CircularProgressIndicator(
                        value:
                            _totalSeconds / 1500, // 25 minutes = 1500 seconds
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
              ),
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
                        _stopAudio();
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
                    onPressed: () {
                      _resetTimer();
                      _stopAudio();
                    },
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
      ),
      // yang bagian bawah ini fungsinya buat ngetes audios
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     setState(() {
      //       _totalSeconds =
      //           5; // Set your desired initial timer value here (10 minutes)
      //     });
      //   },
      //   tooltip: 'Set Timer',
      //   child: Icon(Icons.timer),
      // ),
    );
  }
}
