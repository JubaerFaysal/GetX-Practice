import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/theme_controller.dart';

class ThemePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
      init: ThemeController(),
      builder: (controller) {
        return MaterialApp(
          theme: controller.currentTheme,
          home: Scaffold(
            appBar: AppBar(title: Text('Theme Switcher (GetBuilder)')),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    controller.isDark ? "Dark Mode" : "Light Mode",
                    style: TextStyle(fontSize: 24),
                  ),
                  SizedBox(height: 20),
                  Switch(
                    value: controller.isDark,
                    onChanged: (value) => controller.toggleTheme(),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
