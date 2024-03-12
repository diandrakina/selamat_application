import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:selamat_application/styles/styles.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:selamat_application/widget/navbar.dart';
import 'package:selamat_application/widget/searchBar.dart';
import 'package:selamat_application/widget/widget_discovery/container_habits.dart';
import 'package:selamat_application/widget/widget_discovery/container_profile_psikolog.dart';
import 'package:selamat_application/widget/widget_login_register/customElevatedButton.dart';
import 'dart:async';

import 'package:flutter/material.dart';

class ModesPage extends StatefulWidget {
  @override
  _ModesPageState createState() => _ModesPageState();
}

class _ModesPageState extends State<ModesPage> {
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
        toolbarHeight: 80,
        leadingWidth: double.maxFinite,
        elevation: 0.0,
        backgroundColor: AppColors.bgDarkMode,
        leading: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                children: [
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
                    "Modes",
                    style: TextStyles.bold_30,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),

      //BODY
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Text('Pomodoro', style: TextStyles.bold_24),
                  ),
                ),
                const SizedBox(height: 10.0),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.darkModeCard,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    title: Row(
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: const BoxDecoration(
                            color: AppColors.baseColor,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.work,
                            color: AppColors.white,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'Work',
                          style: TextStyles.medium_18,
                        ),
                      ],
                    ),
                    trailing: Text(
                      '09.00',
                      style: TextStyles.medium_18,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Stack(
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
                const SizedBox(
                  height: 80,
                ),
                CustomElevatedButton(
                  text: _isActive ? "Stop Session" : "Start Session",
                  height: 50,
                  buttonTextStyle: TextStyles.bold_24,
                  buttonStyle: _isActive
                      ? CustomButtonStyles.buttonRed
                      : CustomButtonStyles.buttonBlue,
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
                ),
                const SizedBox(height: 20.0),
                CustomElevatedButton(
                  text: "Reset",
                  buttonTextStyle: TextStyles.bold_24,
                  buttonStyle: CustomButtonStyles.buttonNotSure,
                  height: 50,
                  onPressed: () {
                    _resetTimer();
                    _stopAudio();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
