
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saving_diary/app/module/main/controller/bottom_navigation_controller.dart';

class HomeScreen extends GetView<BottomNavigationController> {

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Home"),
        ),
      );
  }

}