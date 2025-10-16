import 'package:get/get.dart';

import '../../../../../data/repository/general_setting_repository.dart';

class GeneralSettingsController extends GetxController {
  final repo = GeneralSettingRepository();

  var settings = <String, String>{}.obs;

  @override
  void onInit() {
    super.onInit();
    loadSettings();
  }

  Future<void> loadSettings() async {
    await repo.initDefaultSettings();
    final allSettings = await repo.getAllSettings();
    settings.assignAll(allSettings);
  }

  Future<void> updateSetting(String key, String value) async {
    settings[key] = value;
    await repo.setSetting(key, value);
  }

  String getSetting(String key, {String defaultValue = ''}) {
    return settings[key] ?? defaultValue;
  }
}