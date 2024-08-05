import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app_change_notifier.dart';

class ReelTimeoutProvider extends AppChangeNotifier {
  Timer? timer;

  ReelTimeoutProvider(this.onTimeout) {
    startTimer();
  }

  static ReelTimeoutProvider of(BuildContext context, {bool listen = true}) {
    return Provider.of<ReelTimeoutProvider>(context, listen: listen);
  }

  static const int timeoutInMilliseconds = 5000;
  int completedTimes = 0;

  Function? onTimeout;

  // start timer that will update on each 16 millisecond for 5000 milliseconds (5 seconds)
  void startTimer() {
    completedTimes = 0;
    timer = Timer.periodic(Duration(milliseconds: 16), (timer) {
      if (!mounted) return;
      completedTimes += 16;
      if (completedTimes >= timeoutInMilliseconds) {
        cancelTimer();
        onTimeout?.call();
        startTimer();
      }
      notifyListeners();
    });
  }

  cancelTimer() {
    completedTimes = 0;
    timer?.cancel();
    notifyListeners();
  }

  restartTimer() {
    cancelTimer();
    startTimer();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}
