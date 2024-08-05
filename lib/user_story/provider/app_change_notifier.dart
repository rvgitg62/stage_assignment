import 'package:flutter/material.dart';

class AppChangeNotifier extends ChangeNotifier {
  bool _mounted = true;

  /// It is an error to call [notifyListeners] unless [mounted] is true.
  bool get mounted => _mounted;

  @override
  void notifyListeners() {
    if (_mounted) {
      super.notifyListeners();
    }
  }

  @override
  void dispose() {
    _mounted = false;
    super.dispose();
  }
}
