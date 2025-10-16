import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saving_diary/app/module/main/controller/bottom_navigation_controller.dart';
import 'package:saving_diary/app/module/main/view/main_view.dart';
import 'package:saving_diary/app/module/more/module/general/controller/general_setting_controller.dart';
import 'package:saving_diary/theme/theme.dart';

import 'app/data/db/database_helper.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  Get.put(BottomNavigationController());

  final generalSettingsController = Get.put(GeneralSettingsController());

  await generalSettingsController.loadSettings();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.detached) {
      DatabaseHelper().close();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    DatabaseHelper().close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.primaryOf(context);
    final materialTheme = MaterialTheme(textTheme);

    return GetMaterialApp(
      title: 'Money Diary',
      theme: materialTheme.light(),
      home: const MainView(),
    );
  }
}