import 'package:flutter/foundation.dart';

class ThemeBloc extends ChangeNotifier {
  bool isDarkMode = false;

  void onThemeUpdated(bool isDark) {
    isDarkMode = isDark;
    notifyListeners();
  }
}
