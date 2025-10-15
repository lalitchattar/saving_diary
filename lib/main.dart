import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saving_diary/app/module/main/controller/bottom_navigation_controller.dart';
import 'package:saving_diary/app/module/main/view/main_view.dart';
import 'package:saving_diary/theme/theme.dart';

void main() {
  Get.put(BottomNavigationController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = TextTheme.primaryOf(context);
    MaterialTheme materialTheme = MaterialTheme(textTheme);
    return GetMaterialApp(
      title: 'Money Diary',
      theme: MaterialTheme(textTheme).light(),
      home: const MainView(),
    );
  }
}