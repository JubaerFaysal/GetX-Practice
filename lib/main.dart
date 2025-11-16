import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/Counter%20app%20with%20Getx/home_page.dart';
import 'package:getx_practice/Doctor_List_View/View/doctor_list.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'Navigation and Routing/view/home_page.dart';
import 'Theme Switcher App__Getbuilder/view/theme_page.dart';


//counter app
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       title: 'Counter with getX',
//       home: const homepage(),
//     );
//   }
// }

//theme_change with getbuilder
//void main() => runApp(ThemePage());

//Navigation and Routing
// void main() {
//   runApp(GetMaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: HomePage(),
//   ));
// }

// Doctor list view

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DoctorList(),
    );
  }
}
