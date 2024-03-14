import 'dart:async';

import 'package:flutter/material.dart';

class BottomSheetTimer extends StatefulWidget {
  @override
  _BottomSheetTimerState createState() => _BottomSheetTimerState();
}

class _BottomSheetTimerState extends State<BottomSheetTimer> {
  late Timer _timer;
  int _secondsElapsed = 0;
  bool _countingDown = true;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    // Cancel the timer when the widget is disposed
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (timer) {
      if (_countingDown) {
        if (_secondsElapsed > 0) {
          setState(() {
            _secondsElapsed--;
          });
        } else {
          // Time is up, reset timer to count up
          _countingDown = false;
        }
      } else {
        setState(() {
          _secondsElapsed++;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Timer Bottom Sheet',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              _countingDown
                  ? 'Countdown: $_secondsElapsed'
                  : 'Countup: $_secondsElapsed',
              style: TextStyle(fontSize: 18),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Close the bottom sheet when the button is pressed
              Navigator.pop(context);
            },
            child: Text('Close'),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              // Stop the timer when the button is pressed
              _timer.cancel();
            },
            child: Text('Stop Timer'),
          ),
        ],
      ),
    );
  }
}
