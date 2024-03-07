import 'package:flutter/material.dart';
import 'dart:async';
import 'package:selamat_application/styles/styles.dart';
import 'package:audioplayers/audioplayers.dart';

class ReminderNotif extends StatefulWidget {
  const ReminderNotif({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ReminderNotifState createState() => _ReminderNotifState();
}

class _ReminderNotifState extends State<ReminderNotif> {
  bool _isAlarmActive = true;
  final audio2 = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _playAudio();
  }

  Future<void> _playAudio() async {
    await audio2.play(AssetSource("audio/ringtone.mp3"));
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
    Timer(const Duration(minutes: 5), () {
      setState(() {
        _isAlarmActive = true;
        _playAudio();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //BODY
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          if (_isAlarmActive)
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 150),
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
                    padding: const EdgeInsets.only(top: 100),
                    child: TextButton(
                      onPressed: _snoozeAlarm,
                      child:
                          Text('Snooze', style: TextStyles.GR_24_title_light),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 50.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        OutlinedButton(
                          onPressed: _dismissAlarm,
                          style: OutlinedButton.styleFrom(
                            shape: const CircleBorder(),
                            side: const BorderSide(color: Colors.white),
                            fixedSize: const Size(120, 120),
                          ),
                          child: const Stack(
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
                        const SizedBox(
                          width: 30,
                        ),
                        ElevatedButton(
                          onPressed: _checkAlarm,
                          style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            padding: const EdgeInsets.all(24),
                            backgroundColor: AppColors.pastelGreenHealth,
                          ),
                          child: const Stack(
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
        ],
      ),
    );
  }
}
