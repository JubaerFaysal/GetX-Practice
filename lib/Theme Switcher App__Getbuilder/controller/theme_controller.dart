import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  bool isDark = false;

  ThemeData get currentTheme =>
      isDark ? ThemeData.dark() : ThemeData.light();

  void toggleTheme() {
    isDark = !isDark;
    update();
  }
}
