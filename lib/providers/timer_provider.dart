import 'dart:async';
import 'package:flutter/material.dart';

class TimerProvider with ChangeNotifier {
  bool _timerVisible = false;
  int _timerValue = 0;
  Timer? _timer; // Initialize as nullable

  bool get timerVisible => _timerVisible;
  int get timerValue => _timerValue;

  String get formattedTimerValue {
    int hours = _timerValue ~/ 3600;
    int minutes = (_timerValue ~/ 60) % 60;
    int seconds = _timerValue % 60;
    return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  void startTimer() {
    if (_timer == null || !_timer!.isActive) {
      _timerValue = 0;
      _timerVisible = true;
      notifyListeners();

      _timer = Timer.periodic(Duration(seconds: 1), (timer) {
        _timerValue++;
        notifyListeners();
      });
    }
  }

  void stopTimer() {
    _timer?.cancel();
    _timerValue = 0;
    notifyListeners();
  }

  void toggleTimerVisibility() {
    // if (_timerVisible) {
    //   stopTimer();
    // } else {
    //   startTimer();
    // }
    _timerVisible = !_timerVisible;
    notifyListeners();
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancel timer if it's not null
    super.dispose();
  }
}
